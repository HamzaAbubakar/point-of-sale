<?php

namespace App\Http\Controllers\Dashboard;

use Carbon\Carbon;
use App\Models\Category;
use App\Models\Product;
use App\Models\Supplier;
use App\Models\Purchase;
use App\Models\PurchaseDetails;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Gloudemans\Shoppingcart\Facades\Cart;
use Spatie\QueryBuilder\AllowedSort;
use Spatie\QueryBuilder\QueryBuilder;
use Illuminate\Support\Facades\DB;
use Haruncpi\LaravelIdGenerator\IdGenerator;

class PurchaseController extends Controller
{
    public function allPurchases()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $purchases = QueryBuilder::for(Purchase::class)
            ->allowedSorts([
                'purchase_date',
                'total',
                AllowedSort::callback('supplier.name', function ($query, $descending) {
                    $query->join('suppliers', 'purchases.supplier_id', '=', 'suppliers.id')
                        ->orderBy('suppliers.name', $descending ? 'DESC' : 'ASC')
                        ->select('purchases.*');
                })
            ])
            ->with('supplier')
            ->paginate($row);

        return view('purchase.all-purchases', [
            'purchases' => $purchases
        ]);
    }

    public function purchaseDetails(int $purchase_id)
    {
        $purchase = Purchase::with('supplier')->findOrFail($purchase_id);
        $purchaseDetails = PurchaseDetails::with('product')
            ->where('purchase_id', $purchase_id)
            ->orderBy('id', 'DESC')
            ->get();

        return view('purchase.purchase-details', [
            'purchase' => $purchase,
            'purchaseDetails' => $purchaseDetails,
        ]);
    }

    public function index()
    {
        $todayDate = Carbon::now();
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        return view('purchase.index', [
            'categories' => Category::orderBy('name')->get(),
            'productItem' => Cart::instance('purchase')->content(),
            'products' => QueryBuilder::for(Product::class)
                ->allowedSorts(['name', 'selling_price'])
                ->allowedFilters(['name', 'category_id'])
                ->filter(request(['search', 'category_id']))
                ->paginate($row)
                ->appends(request()->query()),
        ]);
    }

    public function addCart(Request $request)
    {
        $validatedData = $request->validate([
            'id' => 'required|numeric',
            'name' => 'required|string',
            'price' => 'required|numeric',
        ]);

        Cart::instance('purchase')->add([
            'id' => $validatedData['id'],
            'name' => $validatedData['name'],
            'qty' => 1,
            'price' => $validatedData['price'],
            'options' => ['size' => 'large']
        ]);

        if ($request->wantsJson()) {
            return response()->json([
                'success' => true,
                'message' => 'Product added to purchase list!',
                'cart_html' => view('purchase.cart-sidebar', [
                    'productItem' => Cart::instance('purchase')->content()
                ])->render(),
                'cart_count' => Cart::instance('purchase')->count()
            ]);
        }

        return Redirect::back()->with('success', 'Product added!');
    }

    public function updateCart(Request $request, string $rowId)
    {
        $validatedData = $request->validate([
            'qty' => 'required|numeric',
            'price' => 'required|numeric',
        ]);

        Cart::instance('purchase')->update($rowId, ['qty' => $validatedData['qty'], 'price' => $validatedData['price']]);

        if ($request->wantsJson()) {
            return response()->json([
                'success' => true,
                'message' => 'Purchase list updated!',
                'cart_html' => view('purchase.cart-sidebar', [
                    'productItem' => Cart::instance('purchase')->content()
                ])->render(),
                'cart_count' => Cart::instance('purchase')->count()
            ]);
        }

        return Redirect::back()->with('success', 'Updated!');
    }

    public function deleteCart(Request $request, string $rowId)
    {
        Cart::instance('purchase')->remove($rowId);

        if ($request->wantsJson()) {
            return response()->json([
                'success' => true,
                'message' => 'Item removed!',
                'cart_html' => view('purchase.cart-sidebar', [
                    'productItem' => Cart::instance('purchase')->content()
                ])->render(),
                'cart_count' => Cart::instance('purchase')->count()
            ]);
        }

        return Redirect::back()->with('success', 'Removed!');
    }

    public function storeSupplier(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:50',
            'email' => 'nullable|email|max:50|unique:suppliers,email',
            'phone' => 'nullable|string|max:15|unique:suppliers,phone',
            'city' => 'nullable|string|max:50',
            'address' => 'nullable|string|max:100',
        ]);

        $supplier = Supplier::create($validatedData);

        return response()->json([
            'success' => true,
            'message' => 'Supplier created successfully!',
            'supplier' => $supplier
        ]);
    }

    public function searchSuppliers(Request $request)
    {
        $term = $request->term;
        $query = Supplier::query();

        if ($term) {
            $query->where('name', 'LIKE', "%{$term}%")
                ->orWhere('phone', 'LIKE', "%{$term}%");
        }

        $suppliers = $query->latest()->limit(20)->get()->map(function ($supplier) {
            return [
                'id' => $supplier->id,
                'text' => $supplier->name . ' (' . ($supplier->phone ?? 'N/A') . ')'
            ];
        });

        return response()->json(['results' => $suppliers]);
    }

    public function storePurchase(Request $request)
    {
        $validatedData = $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'pay_amount' => 'required|numeric',
            'payment_type' => 'required|string',
        ]);

        return DB::transaction(function () use ($request) {
            $purchase_no = IdGenerator::generate([
                'table' => 'purchases',
                'field' => 'purchase_no',
                'length' => 10,
                'prefix' => 'PUR-'
            ]);

            $cart = Cart::instance('purchase');
            $total = (float) $cart->total(null, null, '');
            $pay_amount = $request->pay_amount;
            $due_amount = $total - $pay_amount;

            $purchase = Purchase::create([
                'supplier_id' => $request->supplier_id,
                'purchase_no' => $purchase_no,
                'purchase_date' => Carbon::now(),
                'purchase_status' => 'complete', // Immediately complete
                'total_products' => $cart->count(),
                'sub_total' => (float) $cart->subtotal(null, null, ''),
                'vat' => (float) $cart->tax(null, null, ''),
                'total' => $total,
                'payment_type' => $request->payment_type,
                'pay_amount' => $pay_amount,
                'due_amount' => $due_amount,
                'bank_name' => $request->bank_name,
                'pay_transaction_id' => $request->pay_transaction_id,
                'pay_date' => $request->pay_date,
            ]);

            foreach ($cart->content() as $content) {
                PurchaseDetails::create([
                    'purchase_id' => $purchase->id,
                    'product_id' => $content->id,
                    'quantity' => $content->qty,
                    'unit_cost' => $content->price,
                    'total' => $content->total,
                ]);

                // Increase stock
                Product::where('id', $content->id)->increment('stock', $content->qty);
            }

            $cart->destroy();

            if ($request->wantsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Purchase completed successfully!',
                    'cart_html' => view('purchase.cart-sidebar', ['productItem' => $cart->content()])->render(),
                    'cart_count' => $cart->count(),
                ]);
            }

            return Redirect::route('purchase.index')->with('success', 'Purchase completed!');
        });
    }
}

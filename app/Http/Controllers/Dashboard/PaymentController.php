<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Carbon\Carbon;

use Haruncpi\LaravelIdGenerator\IdGenerator;

class PaymentController extends Controller
{
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'customer_id' => 'nullable|exists:customers,id',
            'supplier_id' => 'nullable|exists:suppliers,id',
            'amount' => 'required|numeric|min:0.01',
            'type' => 'required|in:credit,debit',
            'payment_method' => 'required|string',
            'bank_name' => 'nullable|required_if:payment_method,Transfer|string',
            'transaction_id' => 'nullable|required_if:payment_method,Transfer|string',
            'date' => 'required|date',
            'note' => 'nullable|string',
        ]);

        $reference_code = IdGenerator::generate([
            'table' => 'payments',
            'field' => 'reference_code',
            'length' => 10,
            'prefix' => 'PAY-'
        ]);

        $validatedData['reference_code'] = $reference_code;

        $payment = Payment::create($validatedData);

        if ($request->customer_id) {
            $message = 'Payment received successfully!';
            if ($request->wantsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => $message,
                    'receipt_url' => route('payment.receipt', $payment->id)
                ]);
            }
            return Redirect::back()->with('success', $message);
        } else {
             $message = 'Payment made successfully!';
             if ($request->wantsJson()) {
                 return response()->json([
                     'success' => true,
                     'message' => $message,
                 ]);
             }
             return Redirect::back()->with('success', $message);
        }
    }

    public function receipt(Payment $payment)
    {
        if (!$payment->customer_id) {
            abort(404);
        }
        
        $payment->load('customer');
        return view('payments.receipt', compact('payment'));
    }
}

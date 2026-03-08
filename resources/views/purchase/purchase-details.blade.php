@extends('dashboard.body.main')

@section('container')
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Purchase Details Information</h4>
                        </div>
                        <div>
                            <a href="{{ route('purchase.allPurchases') }}" class="btn btn-outline-secondary btn-sm">
                                <x-heroicon-o-arrow-left class="w-4 h-4 mr-1 inline" /> Back
                            </a>
                        </div>
                    </div>

                    <div class="card-body">
                        <!-- Supplier Profile Info -->
                        <div class="d-flex align-items-center mb-4">
                            <div>
                                <h5 class="mb-1">{{ $purchase->supplier->name }}</h5>
                                <p class="mb-0 text-muted">{{ $purchase->supplier->email }}</p>
                                <p class="mb-0 text-muted">{{ $purchase->supplier->address }}</p>
                            </div>
                        </div>

                        <!-- Purchase Information Form (Read Only) -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Supplier Name</label>
                                    <input type="text" class="form-control bg-white" value="{{ $purchase->supplier->name }}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Supplier Phone</label>
                                    <input type="text" class="form-control bg-white" value="{{ $purchase->supplier->phone }}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Purchase Date</label>
                                    <input type="text" class="form-control bg-white" value="{{ $purchase->purchase_date->format('Y-m-d') }}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Purchase Invoice</label>
                                    <input class="form-control bg-white" value="{{ $purchase->purchase_no }}" readonly />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Payment Type</label>
                                    <input class="form-control bg-white" value="{{ $purchase->payment_type }}" readonly />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Paid Amount</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">$</span>
                                        </div>
                                        <input type="text" class="form-control bg-white" value="{{ number_format($purchase->pay_amount, 2) }}" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Due Amount</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">$</span>
                                        </div>
                                        <input type="text" class="form-control bg-white" value="{{ number_format($purchase->due_amount, 2) }}" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Purchase Items Table -->
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Purchase Items</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive rounded">
                            <table class="table mb-0">
                                <thead class="bg-light text-uppercase">
                                    <tr class="ligth ligth-data">
                                        <th>No.</th>
                                        <th>Photo</th>
                                        <th>Product Name</th>
                                        <th>Product Code</th>
                                        <th>Quantity</th>
                                        <th>Unit Cost</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody class="ligth-body">
                                    @foreach ($purchaseDetails as $item)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>
                                                <img class="avatar-50 rounded"
                                                    src="{{ $item->product->image ? asset('storage/products/' . $item->product->image) : asset('assets/images/product/default.webp') }}"
                                                    alt="{{ $item->product->name }}" style="object-fit: cover;">
                                            </td>
                                            <td>{{ $item->product->name }}</td>
                                            <td>{{ $item->product->code }}</td>
                                            <td>{{ $item->quantity }}</td>
                                            <td>{{ number_format($item->unit_cost, 2) }}</td>
                                            <td>{{ number_format($item->total, 2) }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                                <tfoot class="bg-light">
                                    <tr>
                                        <td colspan="6" class="text-right font-weight-bold">Subtotal</td>
                                        <td class="font-weight-bold">{{ number_format($purchase->sub_total, 2) }}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" class="text-right font-weight-bold">VAT</td>
                                        <td class="font-weight-bold">{{ number_format($purchase->vat, 2) }}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" class="text-right font-weight-bold text-primary" style="font-size: 1.1em;">
                                            Total</td>
                                        <td class="font-weight-bold text-primary" style="font-size: 1.1em;">
                                            {{ number_format($purchase->total, 2) }}
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

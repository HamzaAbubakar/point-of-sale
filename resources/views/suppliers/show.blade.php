@extends('dashboard.body.main')

@section('container')
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Supplier Details</h4>
                        </div>
                        <div>
                            <button type="button" class="btn btn-success font-size-14" data-toggle="modal" data-target="#paymentModal">
                                <x-heroicon-o-currency-dollar class="w-4 h-4 mr-1 inline" /> Make Payment
                            </button>
                            <a href="{{ route('suppliers.edit', $supplier->id) }}" class="btn btn-primary font-size-14">Edit
                                Profile</a>
                            <a href="{{ route('suppliers.index') }}" class="btn btn-secondary font-size-14">Back</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            {{-- Section: Left Profile (Contact) --}}
                            <div class="col-lg-4 col-md-12 mb-4 mb-lg-0 pr-lg-4 border-lg-right">
                                <div class="d-flex align-items-center mb-4 justify-content-center justify-content-lg-start">
                                    <div class="ml-3">
                                        <h4 class="mb-1">{{ $supplier->name }}</h4>
                                        <p class="mb-2 text-muted">Supplier ID: #{{ $supplier->id }}</p>
                                    </div>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                        <div class="d-flex align-items-center">
                                            <x-heroicon-o-envelope class="w-6 h-6 mr-3 text-primary" />
                                            <span class="mb-0">{{ $supplier->email }}</span>
                                        </div>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                        <div class="d-flex align-items-center">
                                            <x-heroicon-o-phone class="w-6 h-6 mr-3 text-primary" />
                                            <span class="mb-0">{{ $supplier->phone }}</span>
                                        </div>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                        <div class="d-flex align-items-center">
                                            <x-heroicon-o-map-pin class="w-6 h-6 mr-3 text-primary" />
                                            <span class="mb-0">{{ $supplier->city ?? 'Unknown' }}</span>
                                        </div>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                        <div class="d-flex align-items-center">
                                            <x-heroicon-o-currency-dollar class="w-6 h-6 mr-3 text-primary" />
                                            <div>
                                                <small class="text-muted">Remaining Due</small>
                                                <div class="font-weight-bold">{{ number_format($supplier->remaining_due, 2) }}</div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            {{-- Section: Right Detailed Info --}}
                            <div class="col-lg-8 col-md-12 pl-lg-4">
                                <h5 class="mb-3">Information</h5>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <h6 class="text-muted">Full Name</h6>
                                        <p class="font-weight-bold">{{ $supplier->name }}</p>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <h6 class="text-muted">Email</h6>
                                        <p class="font-weight-bold">{{ $supplier->email }}</p>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <h6 class="text-muted">Phone</h6>
                                        <p class="font-weight-bold">{{ $supplier->phone }}</p>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <h6 class="text-muted">City</h6>
                                        <p class="font-weight-bold">{{ $supplier->city }}</p>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <h6 class="text-muted">Address</h6>
                                        <p class="font-weight-bold">{{ $supplier->address }}</p>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <h6 class="text-muted">Joined At</h6>
                                        <p class="font-weight-bold">{{ $supplier->created_at->format('d M Y') }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Purchases History Table -->
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Transaction History</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive rounded">
                            <table id="transactions-table" class="table mb-0 table-striped">
                                <thead class="bg-white text-uppercase">
                                    <tr class="ligth ligth-data">
                                        <th>Date</th>
                                        <th>Type</th>
                                        <th>Reference</th>
                                        <th>Amount</th>
                                        <th>Method</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="ligth-body">
                                    <!-- Purchases -->
                                    @foreach ($purchases as $purchase)
                                        <tr>
                                            <td data-sort="{{ $purchase->purchase_date }}">{{ $purchase->purchase_date->format('Y-m-d H:i') }}</td>
                                            <td><span class="badge badge-primary">Purchase</span></td>
                                            <td>{{ $purchase->purchase_no }}</td>
                                            @if($purchase->due_amount > 0)
                                                <td class="text-danger font-weight-bold">- {{ number_format($purchase->due_amount, 2) }}
                                                    @if($purchase->pay_amount > 0)
                                                        <div class="small text-success">({{ number_format($purchase->pay_amount, 2) }} paid)</div>
                                                    @endif
                                                </td>
                                            @else
                                                <td class="text-success font-weight-bold">- {{ number_format($purchase->pay_amount, 2) }} <small class="text-muted">(paid)</small></td>
                                            @endif
                                            <td>{{ $purchase->payment_type }}</td>
                                            <td>
                                                <a class="btn btn-info btn-sm" href="{{ route('purchase.purchaseDetails', $purchase->id) }}">
                                                    <x-heroicon-o-eye class="w-4 h-4" />
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach

                                    <!-- Payments -->
                                    @foreach ($supplier->payments as $payment)
                                        <tr>
                                            <td data-sort="{{ $payment->date }}">{{ $payment->date->format('Y-m-d H:i') }}</td>
                                            <td><span class="badge badge-success">Payment</span></td>
                                            <td>{{ $payment->reference_code }}</td>
                                            <td class="text-success font-weight-bold">+ {{ number_format($payment->amount, 2) }}</td>
                                            <td>{{ $payment->payment_method }}</td>
                                            <td>
                                                <span class="text-muted small">{{ $payment->note }}</span>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Payment Modal -->
    <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Make Payment to {{ $supplier->name }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{ route('payment.store') }}" method="POST">
                    @csrf
                    <input type="hidden" name="supplier_id" value="{{ $supplier->id }}">
                    <input type="hidden" name="type" value="debit">

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Amount <span class="text-danger">*</span></label>
                            <input type="number" step="0.01" class="form-control" name="amount" required>
                        </div>

                        <div class="form-group">
                            <label>Date <span class="text-danger">*</span></label>
                            <input type="date" class="form-control" name="date" value="{{ date('Y-m-d') }}" required>
                        </div>

                        <div class="form-group">
                            <label>Payment Method <span class="text-danger">*</span></label>
                            <select class="form-control" name="payment_method" id="payment_method" onchange="toggleBankDetails(this.value)">
                                <option value="Cash">Cash</option>
                                <option value="Transfer">Transfer</option>
                            </select>
                        </div>

                        <div id="bank_details" style="display: none;">
                            <div class="form-group">
                                <label for="bank_name">Bank Name <span class="text-danger">*</span></label>
                                <select class="form-control" name="bank_name" id="bank_name">
                                    <option value="" selected disabled>Select Bank</option>
                                    <option value="Al Baraka Bank (Pakistan) Limited">Al Baraka Bank (Pakistan) Limited</option>
                                    <option value="Allied Bank Limited">Allied Bank Limited</option>
                                    <option value="Askari Bank Limited">Askari Bank Limited</option>
                                    <option value="Bank Al Falah Limited">Bank Al Falah Limited</option>
                                    <option value="Bank Al Habib Limited">Bank Al Habib Limited</option>
                                    <option value="BankIslami Pakistan Limited">BankIslami Pakistan Limited</option>
                                    <option value="Bank of Punjab">Bank of Punjab</option>
                                    <option value="Bank of Khyber">Bank of Khyber</option>
                                    <option value="Deutsche Bank A.G">Deutsche Bank A.G</option>
                                    <option value="Dubai Islamic Bank Pakistan Limited">Dubai Islamic Bank Pakistan Limited</option>
                                    <option value="Faysal Bank Limited">Faysal Bank Limited</option>
                                    <option value="First Women Bank Limited">First Women Bank Limited</option>
                                    <option value="Habib Bank Limited">Habib Bank Limited</option>
                                    <option value="Habib Metropolitan Bank Limited">Habib Metropolitan Bank Limited</option>
                                    <option value="Industrial and Commercial Bank of China">Industrial and Commercial Bank of China</option>
                                    <option value="Industrial Development Bank of Pakistan">Industrial Development Bank of Pakistan</option>
                                    <option value="JS Bank Limited">JS Bank Limited</option>
                                    <option value="MCB Bank Limited">MCB Bank Limited</option>
                                    <option value="MCB Islamic Bank Limited">MCB Islamic Bank Limited</option>
                                    <option value="Meezan Bank Limited">Meezan Bank Limited</option>
                                    <option value="National Bank of Pakistan">National Bank of Pakistan</option>
                                    <option value="Samba Bank Limited">Samba Bank Limited</option>
                                    <option value="Silk Bank Limited">Silk Bank Limited</option>
                                    <option value="Sindh Bank Limited">Sindh Bank Limited</option>
                                    <option value="Soneri Bank Limited">Soneri Bank Limited</option>
                                    <option value="Standard Chartered Bank (Pakistan) Limited">Standard Chartered Bank (Pakistan) Limited</option>
                                    <option value="Summit Bank Limited">Summit Bank Limited</option>
                                    <option value="The Bank of Tokyo-Mitsubishi UFJ">The Bank of Tokyo-Mitsubishi UFJ</option>
                                    <option value="United Bank Limited">United Bank Limited</option>
                                    <option value="Zarai Taraqiati Bank Limited">Zarai Taraqiati Bank Limited</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Transaction ID <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="transaction_id">
                            </div>
                            <div class="form-group">
                                <label>Transaction Date <span class="text-danger">*</span></label>
                                <input type="date" class="form-control" name="date" value="{{ date('Y-m-d') }}" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Note</label>
                            <textarea class="form-control" name="note" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Payment</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- DataTables Scripts -->
    <script>
        $(document).ready(function() {
            $('#transactions-table').DataTable({
                "order": [[ 0, "desc" ]], // Order by Date descending
                "pageLength": 10,
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "language": {
                    "search": "_INPUT_",
                    "searchPlaceholder": "Search transactions...",
                    "paginate": {
                        "previous": "Prev",
                        "next": "Next"
                    }
                }
            });
        });

        function toggleBankDetails(method) {
            const details = document.getElementById('bank_details');
            if (method === 'Transfer') {
                details.style.display = 'block';
            } else {
                details.style.display = 'none';
            }
        }
    </script>
@endsection

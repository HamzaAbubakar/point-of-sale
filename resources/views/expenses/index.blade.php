@extends('dashboard.body.main')

@section('container')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h4 class="mb-0">Expenses</h4>
                <a href="{{ route('expenses.create') }}" class="btn btn-primary">Create Expense</a>
            </div>

            @if(session('success'))
                <div class="alert text-white bg-success" role="alert">{{ session('success') }}</div>
            @endif

            @if($grouped->isEmpty())
                <p>No expenses found.</p>
            @else
                @foreach($grouped as $date => $items)
                    <h5 class="mt-4">{{ \Carbon\Carbon::parse($date)->format('F j, Y') }}</h5>
                    <div class="table-responsive rounded mb-3">
                        <table class="table mb-0">
                            <thead class="bg-white text-uppercase">
                                <tr>
                                    <th>No.</th>
                                    <th>Details</th>
                                    <th>Amount</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($items as $i => $expense)
                                <tr>
                                    <td>{{ $i + 1 }}</td>
                                    <td>{{ $expense->details }}</td>
                                    <td>{{ number_format($expense->amount, 2) }}</td>
                                    <td>
                                        <a href="{{ route('expenses.edit', $expense) }}" class="btn btn-sm btn-primary">Edit</a>
                                        <form action="{{ route('expenses.destroy', $expense) }}" method="POST" style="display:inline-block">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Delete this expense?')">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
</div>
@endsection

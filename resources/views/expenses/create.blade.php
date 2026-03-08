@extends('dashboard.body.main')

@section('container')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h4>Create Expense</h4>
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('expenses.store') }}" method="POST">
                        @include('expenses._form')
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

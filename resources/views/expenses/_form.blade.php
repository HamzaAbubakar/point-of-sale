@csrf

<div class="form-row">
    <div class="form-group col-md-4">
        <label for="date">Date</label>
        <input type="date" class="form-control @error('date') is-invalid @enderror" name="date" id="date"
               value="{{ old('date', isset($expense) && $expense->date ? $expense->date->format('Y-m-d') : '') }}" required>
        @error('date')
            <small class="text-danger">{{ $message }}</small>
        @enderror
    </div>

    <div class="form-group col-md-4">
        <label for="amount">Amount</label>
        <input type="number" step="0.01" class="form-control @error('amount') is-invalid @enderror" name="amount" id="amount"
               value="{{ old('amount', $expense->amount ?? '') }}" required>
        @error('amount')
            <small class="text-danger">{{ $message }}</small>
        @enderror
    </div>

</div>

<div class="form-group">
    <label for="details">Details</label>
    <textarea name="details" id="details" rows="4" class="form-control @error('details') is-invalid @enderror">{{ old('details', $expense->details ?? '') }}</textarea>
    @error('details')
        <small class="text-danger">{{ $message }}</small>
    @enderror
</div>


<div class="form-group">
    <button type="submit" class="btn btn-primary">Save</button>
    <a href="{{ route('expenses.index') }}" class="btn btn-secondary">Cancel</a>
</div>

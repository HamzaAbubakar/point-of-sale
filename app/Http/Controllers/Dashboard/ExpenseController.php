<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\ExpenseRequest;
use App\Models\Expense;
use Illuminate\Http\Request;

class ExpenseController extends Controller
{
    public function index(Request $request)
    {
        // Show expenses for a specific month (defaults to current)
        $monthParam = $request->query('month');
        $selectedMonth = $monthParam ?: now()->format('Y-m');

        try {
            $month = \Carbon\Carbon::createFromFormat('Y-m', $selectedMonth)->startOfMonth();
        } catch (\Exception $e) {
            $month = now()->startOfMonth();
            $selectedMonth = $month->format('Y-m');
        }

        $grouped = Expense::whereYear('date', $month->year)
            ->whereMonth('date', $month->month)
            ->orderBy('date', 'desc')
            ->orderBy('created_at', 'desc')
            ->get()
            ->groupBy(function ($item) {
                return $item->date->format('Y-m-d');
            });

        return view('expenses.index', ['grouped' => $grouped, 'selectedMonth' => $selectedMonth]);
    }

    public function create()
    {
        return view('expenses.create');
    }

    public function store(ExpenseRequest $request)
    {
        Expense::create($request->validated());
        return redirect()->route('expenses.index')->with('success', 'Expense created.');
    }

    public function edit(Expense $expense)
    {
        return view('expenses.edit', compact('expense'));
    }

    public function update(ExpenseRequest $request, Expense $expense)
    {
        $expense->update($request->validated());
        return redirect()->route('expenses.index')->with('success', 'Expense updated.');
    }

    public function destroy(Expense $expense)
    {
        $expense->delete();
        return redirect()->route('expenses.index')->with('success', 'Expense deleted.');
    }
}

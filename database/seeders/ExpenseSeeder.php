<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Expense;
use Carbon\Carbon;

class ExpenseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            ['date' => Carbon::now()->subDays(0)->toDateString(), 'details' => 'Office supplies', 'amount' => 45.50],
            ['date' => Carbon::now()->subDays(1)->toDateString(), 'details' => 'Taxi fare', 'amount' => 12.75],
            ['date' => Carbon::now()->subDays(2)->toDateString(), 'details' => 'Lunch with client', 'amount' => 60.00],
            ['date' => Carbon::now()->subDays(7)->toDateString(), 'details' => 'Monthly subscription', 'amount' => 9.99],
            ['date' => Carbon::now()->subDays(30)->toDateString(), 'details' => 'Hardware repair', 'amount' => 120.00],
        ];

        foreach ($data as $row) {
            Expense::create($row);
        }
    }
}

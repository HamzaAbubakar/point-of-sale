<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('bank_name')->nullable();
            $table->string('pay_transaction_id')->nullable();
            $table->date('pay_date')->nullable();
        });

        Schema::table('purchases', function (Blueprint $table) {
            $table->string('bank_name')->nullable();
            $table->string('pay_transaction_id')->nullable();
            $table->date('pay_date')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn(['bank_name', 'pay_transaction_id', 'pay_date']);
        });

        Schema::table('purchases', function (Blueprint $table) {
            $table->dropColumn(['bank_name', 'pay_transaction_id', 'pay_date']);
        });
    }
};

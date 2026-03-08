<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('purchases', function (Blueprint $table) {
            $table->id();
            $table->foreignId('supplier_id')->constrained()->onDelete('cascade');
            $table->string('purchase_no')->unique();
            $table->dateTime('purchase_date');
            $table->string('purchase_status')->default('pending');
            $table->integer('total_products');
            $table->decimal('sub_total', 15, 2);
            $table->decimal('vat', 15, 2)->default(0);
            $table->decimal('total', 15, 2);
            $table->string('payment_type')->nullable();
            $table->decimal('pay_amount', 15, 2)->default(0);
            $table->decimal('due_amount', 15, 2)->default(0);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('purchases');
    }
};

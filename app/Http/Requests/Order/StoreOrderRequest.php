<?php

namespace App\Http\Requests\Order;

use Illuminate\Foundation\Http\FormRequest;

class StoreOrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'customer_id' => 'required|exists:customers,id',
            'payment_type' => 'required|string',
            'pay_amount' => 'required|numeric|min:0',
            'bank_name' => 'required_if:payment_type,Transfer|nullable|string',
            'pay_transaction_id' => 'required_if:payment_type,Transfer|nullable|string',
            'pay_date' => 'required_if:payment_type,Transfer|nullable|date',
        ];
    }
}

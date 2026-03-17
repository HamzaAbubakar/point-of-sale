<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'email',
        'phone',
        'address',
        'city',
    ];

    protected $guarded = [
        'id',
    ];

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? false, function ($query, $search) {
            return $query->where('name', 'like', '%' . $search . '%');
        });
    }

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function payments()
    {
        return $this->hasMany(Payment::class);
    }

    /**
     * Get remaining due for the customer.
     * Calculated as total of orders minus total of payments received from the customer.
     */
    public function getRemainingDueAttribute()
    {
        // Use orders.due_amount so partial payments recorded on the order itself are considered
        // Then subtract any standalone payments from the payments table (type = 'credit')
        // to include payments recorded outside of order-level allocations.
        $ordersDue = (float) $this->orders()->sum('due_amount');
        $paymentsTotal = (float) $this->payments()->where('type', 'credit')->sum('amount');

        return $ordersDue - $paymentsTotal;
    }

    /**
     * Get remaining due for the customer.
     * Calculated as total of orders minus total of payments made by the customer.
     */
    // duplicate accessor removed; see the earlier getRemainingDueAttribute above
}

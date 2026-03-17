<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
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

    public function purchases()
    {
        return $this->hasMany(Purchase::class);
    }

    public function payments()
    {
        return $this->hasMany(Payment::class);
    }

    /**
     * Get remaining due for the supplier.
     * Calculated as total of purchases minus total of payments made to the supplier.
     */
    public function getRemainingDueAttribute()
    {
        // Use purchases.due_amount so partial payments recorded on the purchase itself are considered
        // Then subtract standalone payments from the payments table (type = 'debit') which
        // represent payments made to suppliers.
        $purchasesDue = (float) $this->purchases()->sum('due_amount');
        $paymentsTotal = (float) $this->payments()->where('type', 'debit')->sum('amount');

        return $purchasesDue - $paymentsTotal;
    }
}

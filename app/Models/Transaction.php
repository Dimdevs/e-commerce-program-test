<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    protected $table = "transaction";
    protected $primaryKey = "id";
    protected $fillable = [
        'customer_id' , 
        'customer_address_id',
        'totalPrice',
        'total_quantity'
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }

    public function customer_address()
    {
        return $this->belongsTo(CustomerAddress::class, 'customer_address_id');
    }

    public function transaction_payment_method()
    {
        return $this->hasMany(TransactionPaymentMethod::class, 'transaction_id');
    }

    public function transaction_product()
    {
        return $this->hasMany(TransactionProduct::class, 'transaction_id');
    }
}

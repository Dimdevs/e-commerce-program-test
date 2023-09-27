<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransactionPaymentMethod extends Model
{
    use HasFactory;

    protected $table = "transaction_payment_method";
    protected $primaryKey = "id";
    protected $fillable = [
        'transaction_id' , 
        'payment_method_id'
    ];

    public function transaction()
    {
        return $this->belongsTo(Transaction::class, 'transaction_id');
    }

    public function payment_method()
    {
        return $this->belongsTo(PaymentMethod::class, 'payment_method_id');
    }
}

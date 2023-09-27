<?php

namespace App\Http\Controllers\API\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

// Models
use App\Models\Transaction;
use App\Models\TransactionPaymentMethod;
use App\Models\TransactionProduct;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function checkoutTransaction(Request $request)
    {
        $data = $request->all();

        $transaction = new Transaction();
        $transaction->customer_id = 1;
        $transaction->customer_address_id = 1;
        $transaction->totalPrice = $data['total'];
        $transaction->save();
    
        foreach ($data['cartItems'] as $cartItem) {
            $transactionProduct = new TransactionProduct();
            $transactionProduct->transaction_id = $transaction->id;
            $transactionProduct->product_id = $cartItem['id'];
            $transactionProduct->totalPrice = $cartItem['price'];
            $transactionProduct->quantity = $cartItem['quantity'];
            $transactionProduct->save();
        }
    
        foreach ($data['paymentMethods'] as $paymentMethodId) {
            $transactionPaymentMethod = new TransactionPaymentMethod();
            $transactionPaymentMethod->transaction_id = $transaction->id;
            $transactionPaymentMethod->payment_method_id = $paymentMethodId;
            $transactionPaymentMethod->save();
        }
    
        $transaction->save();
    
        return response()->json(['message' => 'Checkout successful', 'transaction' => $transaction]);        
    }
}

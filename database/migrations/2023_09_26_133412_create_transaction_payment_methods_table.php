<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaction_payment_method', function (Blueprint $table) {
            $table->id();
            $table->integer('transaction_id');
            $table->integer('payment_method_id');
            $table->foreign('transaction_id')->references('id')->on('transaction')->onDelete('cascade');
            $table->foreign('payment_method_id')->references('id')->on('payment_method')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaction_payment_methods');
    }
};

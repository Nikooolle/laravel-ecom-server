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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("user_id");
            $table->integer("quantity");
            $table->decimal("total");
            $table->enum("status", ["Pending", "For Packaging", "Out for Delivery", "Delivered", "Cancelled"]);
            $table->enum("payment_type", ["Paypal","GCash","PayMaya", "Cash On Delivery"]);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};

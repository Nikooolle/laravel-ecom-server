<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(){

       $total_sale =  Order::where('status', 'Delivered')->sum('total');
        $total_orders = Order::count();
        $total_products = Product::count();

        return response([
            'total_sale' => $total_sale,
            'total_order' => $total_orders,
            'total_products' => $total_products,
            'message' => "Successfully Ordered!"
        ]);
    }
}

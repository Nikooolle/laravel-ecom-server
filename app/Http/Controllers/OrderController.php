<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;

class OrderController extends Controller
{
    public function index(Request $request){

        $data = Order::with('orderItems','user')->where('user_id', auth()->user()->id)->get();
        return response([
            'data' => $data,
            'message' => "View all the Products"
        ]);
    }

    public function store(Request $request){
        $request->validate([
            'status' => ['required'],
            'payment_type' => ['required'],

        ]);

        $carts = Cart::where('user_id',auth()->user()->id)->get();

        $data = Order::create([
            'user_id' => auth()->user()->id,
            'quantity' => $carts->sum('quantity') ,
            'total' => $carts->sum('total_price'),
            'status' => auth()->user()->usertype == 'admin' ? $request->status : 'Pending',
            'payment_type' => $request->payment_type,
        ]);

        foreach($carts as $cart){
            OrderItem::create([
                'order_id' => $data->id,
                'product_id' => $cart->product_id,
                'quantity' => $cart->quantity,
                'price' => $cart->price,
                'total' => $cart->total_price
            ]);
        }

        Cart::where('user_id',auth()->user()->id)->delete();

        return response([
            'data' => $data,
            'message' => "Successfully created order"
        ]);
    }

    public function updateStatus(Request $request, $id){
        $data = Order::find($id);
        if (!$data) {
            return response()->json(['error'=>'Record Not Found'], 401);
        }

        $request->validate([
          'status' => ['required'],
        ]);

        $data->update([
          'status' => $request->status,
        ]);

        return response([
            'data' => $data,
           'message' => "Record Updated Successfully",
        ]);
    }
}

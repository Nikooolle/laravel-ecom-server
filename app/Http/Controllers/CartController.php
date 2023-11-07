<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Product;

class CartController extends Controller
{

    public function index(){
        $data = Cart::with('product.concern', 'product.category')->where('user_id',auth()->user()->id)->get();

        return response([
            'data' => $data,
            'message' => "My Carts"
        ],200);
    }



    public function store(Request $request){
        $request->validate([
            'product_id' => ['required'],
            'quantity' => ['required', 'numeric'],

        ]);
       // $product = Product::find($request->product_id);
        $product = Product::select('price')->where('id',$request->product_id)->first();

        $data = Cart::create([
            'product_id' => $request->product_id,
            'user_id'=> auth()->user()->id,
            'quantity' => $request->quantity,
            'price' => $product->price,
            'total_price' => $request->quantity * $product->price
        ]);

        return response([
            'data' => $data,
            'message' => "Successfully created cart"
        ]);
    }

    public function update(Request $request, $id){
        $data = Cart::find($id);
        if (!$data) {
            return response()->json(['error'=>'Record Not Found'], 401);
        }

        $request->validate([
            'quantity' => ['required', 'numeric', 'gt:0'],

        ]);

        $product = Product::select('price')->where('id',$data->product_id)->first();

        $data->update([
            'quantity' => $request->quantity,
            'price' => $product->price,
            'total_price' => $request->quantity * $product->price
        ]);

        return response([
            'data' => $data,
            'message' => "Record Updated Successfully",
        ]);

    }

    public function destroy($id){
        $data = Cart::find($id);
        if (!$data) {
            return response()->json(['error'=>'Record Not Found'], 401);
        }
        $data->delete();
        return response([
            'message' => "Product Deleted Successfully"
        ]);
    }
}

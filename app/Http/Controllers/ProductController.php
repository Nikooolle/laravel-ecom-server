<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{

    public function index(Request $request){

        $categoryId = $request->category_id;
        $data = Product::with('category')
        ->when($categoryId, function ($query, $categoryId) {
            $query->where('category_id', $categoryId);
        })
        ->get();
        return response([
            'data' => $data,
            'message' => "View all the Products"
        ]);
    }

    public function show($id){
        $data = Product::with('category')->find($id);
        if(!$data) {
            return response()->json(['error'=>'Record not found'], 401);
        }

        return response([
            'date' => $data,
            'message' => "Record Found Successfully"
        ]);
    }

    public function store(Request $request){
        $request->validate([
            'name' => ['required', 'string'],
            'description' => ['required', 'string'],
            'price' => ['required', 'numeric'],
            'image' => ['required', 'string'],
            'quantity' => ['required', 'numeric'],
            'category_id' => ['required']
        ]);

        $data = Product::create([
            'name' => $request->name,
            'description'=> $request->description,
            'price' => $request->price,
            'quantity' => $request->quantity,
            'image' => $request->image,
            'category_id' => $request->category_id
        ]);

        return response([
            'data' => $data,
            'message' => "Successfully created Product"
        ]);
    }

    public function update(Request $request, $id){
        $data = Product::find($id);
        if (!$data) {
            return response()->json(['error'=>'Record Not Found'], 401);
        }

        $request->validate([
            'name' => ['required', 'string'],
            'description' => ['required', 'string'],
            'price' => ['required', 'numeric'],
            'quantity' => ['required', 'numeric'],
            'image' => ['required','string'],
            'category_id' => ['required']
        ]);


        $data->update([
            'name' => $request->name,
            'description'=> $request->description,
            'price' => $request->price,
            'quantity' => $request->quantity,
            'image' => $request->image,
            'category_id' => $request->category_id
        ]);

        return response([
            'data' => $data,
            'message' => "Record Updated Successfully",
        ]);

    }

    public function destroy($id){
        $data = Product::find($id);
        if (!$data) {
            return response()->json(['error'=>'Record Not Found'], 401);
        }
        $data->delete();
        return response([
            'message' => "Product Deleted Successfully"
        ]);
    }
}

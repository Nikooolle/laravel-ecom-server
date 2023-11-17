<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{

    public function index(){
        $data = Category::all();

        return response([
            'data' => $data,
            'message' => "View all the Records"
        ],200);
    }

    public function show($id){
        $data = Category::find($id);
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
        ]);

        $data = Category::create([
            'name' => $request->name
        ]);

        return response([
            'data' => $data,
            'message' => "Successfully created category"
        ], 202);
    }

    public function update(Request $request, $id){
        $data = Category::find($id);
        if (!$data) {
            return response()->json(['error'=>'Record Not Found'], 401);
        }

        $request->validate([
            'name' => ['required', 'string']
        ]);


        $data->update([
            'name' => $request->name,
        ]);

        return response([
            'data' => $data,
            'message' => "Record Updated Successfully",
        ], 202);

    }

    public function destroy($id){
        $data = Category::find($id);
        if (!$data) {
            return response()->json(['error'=>'Record Not Found'], 401);
        }
        $data->delete();
        return response([
            'message' => "Category Deleted Successfully"
        ]);
    }
}

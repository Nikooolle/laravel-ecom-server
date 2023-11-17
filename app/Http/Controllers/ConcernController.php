<?php

namespace App\Http\Controllers;

use App\Models\Concern;
use Illuminate\Http\Request;

class ConcernController extends Controller
{
    public function index(){
        $data = Concern::all();

        return response([
            'data' => $data,
            'message' => "View all the Concerns"
        ]);
    }

    public function show($id){
        $data = Concern::find($id);
        if(!$data) {
            return response()->json(['error'=>'Concern not found'], 401);
        }

        return response([
            'date' => $data,
            'message' => "Concern Found Successfully"
        ]);
    }

    public function store(Request $request){
        $request->validate([
            'name' => ['required', 'string'],
        ]);

        $data = Concern::create([
            'name' => $request->name
        ]);

        return response([
            'data' => $data,
            'message' => "Successfully created concern"
        ], 202);
    }

    public function update(Request $request, $id){
        $data = Concern::find($id);
        if (!$data) {
            return response()->json(['error'=>'Concern Not Found'], 401);
        }

        $request->validate([
            'name' => ['required', 'string']
        ]);


        $data->update([
            'name' => $request->name,
        ]);

        return response([
            'data' => $data,
            'message' => "Concern Updated Successfully",
        ], 202);

    }

    public function destroy($id){
        $data = Concern::find($id);
        if (!$data) {
            return response()->json(['error'=>'Concern Not Found'], 401);
        }
        $data->delete();
        return response([
            'message' => "Concerns Deleted Successfully"
        ]);
    }
}

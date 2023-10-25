<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request ){
        $fields = $request->validate([
            'name'=>'required|string',
            'email'=>'required|string|unique:users,email',
            'password'=>'required|string|confirmed',
            'phone' => 'string|nullable',
            'address' => 'string|nullable',
        ]);

        $user = User::create([
            'name'=>$fields['name'],
            'email'=>$fields['email'],
            'password'=>bcrypt($fields['password']),
            'phone' => $fields['phone'],
            'address' => $fields['address'],
        ]);

        $token = $user->createToken('test')->plainTextToken;

        return response([
            'user'=>$user,
            'token'=>$token
        ]);
    }

    public function login(Request $request ){
        $fields = $request->validate([
            'email'=>'required|string',
            'password'=>'required|string'
        ]);

        $user = User::where('email', $fields['email'])->first();

        if(!$user || !Hash::check($fields['password'], $user->password)){
            return response(['message'=>'Invalid credentials'],401);
        }

        $token = $user->createToken('test')->plainTextToken;

        return response([
            'user'=>$user,
            'token'=>$token
        ]);
    }


    public function logout() {
        auth()->user()->tokens()->delete();

        return response([
            'message'=>"Logged out successfully",
        ], 201);
    }

}

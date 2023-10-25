<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

//Public routes
Route::get("/products", [ProductController::class,
'index']);
Route::get("/products/{id}", [ProductController::class, 'show']);
Route::get("/products/search/{name}", [ProductController::class, 'search']);
Route:: post("/register", [AuthController::class, 'register']);
Route:: post("/login", [AuthController::class, 'login']);

Route::group(['middleware' => ['auth:sanctum']], function(){
    Route:: post("/logout", [AuthController::class, 'logout']);
    Route::put('/orders/{id}', [OrderController::class, 'updateStatus']);
});


//User Route

//Cart
Route::group(['middleware' => ['auth:sanctum', 'role:user']], function(){
    Route::post("/carts", [CartController::class, 'store']);
    Route::delete("/carts/{id}", [CartController::class, 'destroy']);
    Route::put("/carts/{id}", [CartController::class, 'update']);
});

//Order
Route::group(['middleware' => ['auth:sanctum', 'role:user']], function(){
    Route::post("/orders", [OrderController::class, 'store']);
    Route::get("/orders", [OrderController::class, 'index']); //all record
});



//Admin Routes
//Protected routes
Route::group(['middleware' => ['auth:sanctum', 'role:admin']], function(){
    // Route::get("/products", [ProductController::class, 'index']); //all record
    // Route::get("/products/{id}", [ProductController::class, 'show']);
    Route::post("/products", [ProductController::class, 'store']);
    Route::put("/products/{id}", [ProductController::class, 'update']);
    Route::delete("/products/{id}", [ProductController::class, 'destroy']);

});
//Category
Route::group(['middleware' => ['auth:sanctum']], function(){
    Route::post("/category", [CategoryController::class, 'store']);
    Route::get("/category", [CategoryController::class, 'index']); //all record
    Route::get("/category/{id}", [CategoryController::class, 'show']); //specific record
    Route::put("/category/{id}", [CategoryController::class, 'update']);
    Route::delete("/category/{id}", [CategoryController::class, 'destroy']);
});

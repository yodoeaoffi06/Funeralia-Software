<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('f')->group(function () {

    Route::prefix('auth')->group(function (){
        Route::post('login', 'App\Http\Controllers\LoginController@login');
        Route::post('logout', 'App\Http\Controllers\LoginController@logout');
    });
    
    Route::prefix('user-management')->group(function () {
        Route::post('create-user', 'App\Http\Controllers\UserManagementController@createUser');
        Route::delete('remove-user/{id_usuario}', 'App\Http\Controllers\UserManagementController@removeUser');
        Route::put('update-user/{id_usuario}', 'App\Http\Controllers\UserManagementController@updateUser');
        Route::get('get-users/{id_tipo}', 'App\Http\Controllers\UserManagementController@getUsers');
        Route::get('get-user-types', 'App\Http\Controllers\UserManagementController@getUserTypes');
    })->middleware('auth:api');
});

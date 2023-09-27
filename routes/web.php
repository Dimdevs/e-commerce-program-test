<?php

use Illuminate\Support\Facades\Route;

// use internal controller
use App\Http\Controllers\WEB\ProductController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});

Route::get('/product', [ProductController::class, 'index']);

Route::get('/about', function () {
    return view('about');
});

Route::get('/demo', function () {
    return view('demo', ['name'=> 'Shailesh']);
})->name('demo');

Route::get('/test', function () {
    return view('test');
});

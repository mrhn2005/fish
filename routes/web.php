<?php

use App\Http\Controllers\ContactController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

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

Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/products', [ProductController::class, 'index'])->name('products.index');
Route::get('/products/{id}', [ProductController::class, 'show'])->name('products.show');

Route::get('/blog', [PostController::class, 'index'])->name('posts.index');
Route::get('/blog/{id}', [PostController::class, 'show'])->name('posts.show');

Route::get('/pages/{pageName}', [PageController::class, 'show'])->name('pages.show');

Route::post('/contacts', [ContactController::class, 'store'])->name('contacts.store');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

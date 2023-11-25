<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [MainController::class, 'index']);
Route::get('/painel', [MainController::class, 'painel_index'])->middleware('auth');
Route::get('/painel/clientes/{acao}/{id?}', [MainController::class, 'painel_clientes'])->middleware('auth');
Route::get('/painel/pedidos/{acao}/{id?}', [MainController::class, 'painel_pedidos'])->middleware('auth');
Route::get('/painel/index', [MainController::class, 'painel_index'])->middleware('auth');  

Route::post('/painel/post/{pagina}', [MainController::class, 'painel_post'])->middleware('auth');
Route::put('/painel/put/{pagina}/{id}', [MainController::class, 'painel_put'])->middleware('auth');

//ajax csv
Route::get('/painel/ajax_csv', [MainController::class, 'ajax_csv'])->middleware('auth');
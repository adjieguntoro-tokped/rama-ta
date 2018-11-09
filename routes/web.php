<?php

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

Route::get('/p', 'pesertaController@index');
Route::get('/seminar/{seminarslug}/daftar', 'pesertaController@register');
Route::post('/p/import', 'pesertaController@import')->name('import');
Route::get('/p/viewall', 'pesertaController@viewData');

Route::get('/seminar', 'seminarController@index');
Route::get('/seminar/tambah', 'seminarController@tambah');

Route::post('/upload-bukti', 'pembayaranController@upload')->name('upload.bukti');

Route::get('/transaksi', 'seminarController@dataupload');
Route::get('/transaksi/{seminarId}/{datauploadId}/detail', 'seminarController@viewDetail');
Route::post('/transaksi/verifikasi', 'pembayaranController@verification')->name('verifikasi');


// Users
Route::get('/login', 'userController@showLogin');
Route::post('/dologin', 'userController@doLogin')->name('doLogin');



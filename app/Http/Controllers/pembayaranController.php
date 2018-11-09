<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class pembayaranController extends Controller
{
    //
    public function upload(Request $request){
        // die();

        // print_r($request);
        $validate = $request->validate(array(
            'file_buktibayar' => 'required',
            'kode_kelas'      => 'required',
            'seminar_id'      => 'required',
        ));

        // print_r($validate); die();

        if($validate) {
            $buktiPembayaran = $request->file('file_buktibayar')->store('storage/uploads', 'public');
            $kode_kelas = $request->kode_kelas;
            $seminar_id = $request->seminar_id;
            $dataupload_id = $request->dataupload_id;
            $seminarslug = $request->seminar_slug;
            

            $timestamps = \Carbon\Carbon::now('Asia/Jakarta');

            $dataPembayaran = [
                'status_pembayaran'     => 1, // 1 = sedang diproses, 2 = valid, 3 = tidak valid
                'kode_pembayaran'       => 809890890,
                'kode_kelas'            => $kode_kelas,
                'dataupload_id'         => $dataupload_id,
                'seminar_id'            => $seminar_id,
                'url_bukti_pembayaran'  => $buktiPembayaran,
                'created_at'            => $timestamps,
                'updated_at'            => $timestamps,
            ];
            // store data to DB

            $insertDataPembayaran = DB::table('pembayaran')->insert($dataPembayaran);

            return redirect('s/' . $seminarslug . '/daftar');

        };
        
        // store data to DB 

        return '<img src="' . $path .'" />';
    }

    public function verification(Request $request){
        $dataupload_id = $request->dataupload_id;
        $pembayaran_id = $request->pembayaran_id;
        $seminar_id = $request->seminar_id;

        $where = [
            'dataupload_id' => $dataupload_id,
            'id'            => $pembayaran_id,
            'seminar_id'    => $seminar_id,
        ];

        // print_r($where);die();

        $updated = DB::table('pembayaran')
                        ->where('dataupload_id', $dataupload_id)
                        ->where('id', $pembayaran_id)
                        ->where('seminar_id', $seminar_id)
                        ->update(['status_pembayaran' => 2]);

        // if($updated){
        //     $response = [
        //         'status' => 'success',
        //         'code'   => 200,
        //         'message' => 'Pembayaran Berhasil diverifikasi!'
        //     ];
        // } else {
        //     $response = [
        //         'status' => 'error',
        //         'code'   => 401,
        //         'message' => 'Pembayaran Gagal diverifikasi!'
        //     ];
        // };

        // return response()->json($response);
        return redirect($request->url);

    }
}

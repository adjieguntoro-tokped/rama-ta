<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use File;
use Excel;

class pesertaController extends Controller
{
    //
    public function register($seminarslug){

        $userId = 2;

        $dataSeminar = DB::table('seminar')->where('seminar_slug', $seminarslug)->first();
        // print_r($dataSeminar); die();
        // print_r($dataSeminar);

        $getStatusPendaftaran = DB::table('dataupload')
                                    ->where('user_id', $userId)
                                    ->where('seminar_id', $dataSeminar->id)
                                    ->get();
        
        $idPendaftaran = isset($getStatusPendaftaran[0]) ? $getStatusPendaftaran[0]->id : 0;
        $kode_kelas = isset($getStatusPendaftaran[0]) ? $getStatusPendaftaran[0]->kode_kelas : null;
        $getPembayaran = DB::table('pembayaran')->where('dataupload_id', $idPendaftaran)
                                    ->get();

        $statusPembayaran = isset($getPembayaran[0]) ? $getPembayaran[0]->status_pembayaran : 0;

        
        $queryPeserta = DB::table('peserta as p')
            ->select(
                'p.id as id',
                'nama_peserta',
                'nim_peserta',
                'kelas_peserta',
                'telp_peserta',
                'kehadiran_peserta',
                'seminar_id',
                'tema_seminar'
            )
            ->leftjoin('dataupload as du', 'du.id', '=', 'p.dataupload_id')
            ->leftjoin('seminar as s', 's.id', '=', 'du.seminar_id')
            ->where('user_id', $userId)
            ->where('seminar_id', $dataSeminar->id);
            // ->groupBy('peserta.id', 'nama_peserta', 'nim_peserta', 'kelas_peserta', 'telp_peserta', 'kehadiran_peserta', 'seminar.id')
            
        $dataPeserta = $queryPeserta->distinct()->paginate(10);
        $totalDataPeserta = $queryPeserta->count();

            // print_r($totalDataPeserta);

        $data = [
            'seminarslug' => $seminarslug,
            'tableHead' => ['#ID', 'Nama', 'Nim', 'Kelas', 'No Telp', 'Seminar', 'Kehadiran'],
            'dataPeserta' => $dataPeserta,
            'totalDataPeserta' => $totalDataPeserta,
            'dataSeminar' => $dataSeminar,
            'kode_kelas'  => $kode_kelas,
            'dataupload_id'  => $idPendaftaran,   
            'statusPembayaran'     => $statusPembayaran,         
            'statusPendaftaran' => $getStatusPendaftaran->count() ? true : false
        ];


        return view('peserta/tambah-peserta', $data);
    }

    public function import(Request $request){
        // validate file excel
        $this->validate($request, array(
            'file_peserta'      => 'required'
        ));

        if($request->hasFile('file_peserta')){
            $extension = File::extension($request->file_peserta->getClientOriginalName());
            if ($extension == "xlsx" || $extension == "xls" || $extension == "csv"){
                $path = $request->file_peserta->getRealPath();
                $data = Excel::load($path, function($reader){})->get();
                    $seminarslug = $request->seminar_slug;

                if(!empty($data) && $data->count()){
                    $timestamps = \Carbon\Carbon::now('Asia/Jakarta');
                    
                    // insert dataupload
                    $dataUpload = [
                        'user_id' =>  2,
                        'kode_kelas' => '06TPLE008',
                        'seminar_id' => $request->seminar_id,
                        'created_at' => $timestamps,
                        'updated_at' => $timestamps,
                    ];

                    $idDataUpload = DB::table('dataupload')->insertGetId($dataUpload);

                    if($idDataUpload) {
                        foreach($data as $key => $value){
                            // print_r($value->kehadiran);die();
                            $strHadir = strtolower($value->kehadiran);
                            $hadir = substr_count($strHadir, 'tidak') ? '0' : '1';
                            $insert[] = [
                                'nim_peserta' => $value->nim,
                                'nama_peserta' => $value->nama,
                                'kelas_peserta' => $value->kelas,
                                'telp_peserta' => $value->no_telp,
                                'kehadiran_peserta' => $hadir,
                                'dataupload_id' => $idDataUpload, 
                                'created_at' => $timestamps,
                                'updated_at' => $timestamps,                                   
                            ];
                        }

                        $insertPeserta = DB::table('peserta')->insert($insert);

                        if($insertPeserta){
                            // handle berhasil
                        } else {
                            // handle gagal insert
                        }

                        // TODO : Kalkulasi total harga seminar

                        $response = [
                            'status' => 'OK',
                            'code' => 200,
                            'messages' => 'success' 
                        ];
                    }

                    return redirect('s/'.$seminarslug.'/daftar');
                } else {
                    // TODO : set session flash, data gak boleh kosong
                };
            } else {
                // data harus xls, xlsx, csv
            };
        } else {
            // tidak ada file yang dipilih
        }
    }

    public function viewData(Request $request){
        $dataPeserta = DB::table('peserta as p')
                        ->select(
                            'p.id as id',
                            'nama_peserta',
                            'nim_peserta',
                            'kelas_peserta',
                            'telp_peserta',
                            'kehadiran_peserta',
                            'seminar_id',
                            'tema_seminar'
                        )
                        ->leftjoin('dataupload as du', 'du.id', '=', 'p.dataupload_id')
                        ->leftjoin('seminar as s', 's.id', '=', 'du.seminar_id')
                        // ->groupBy('peserta.id', 'nama_peserta', 'nim_peserta', 'kelas_peserta', 'telp_peserta', 'kehadiran_peserta', 'seminar.id')
                        ->distinct()
                        ->paginate(8);

        $data['tableHead'] = ['#ID', 'Nama', 'Nim', 'Kelas', 'No Telp', 'Seminar', 'Kehadiran'];
        $data['dataPeserta'] = $dataPeserta;

        // print_r($dataPeserta->links());

        // return response()->json($dataPeserta);
        return view('peserta/data-peserta', $data);
    }
}

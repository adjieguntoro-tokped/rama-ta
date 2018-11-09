<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class seminarController extends Controller
{
    //
    public function index(Request $request){
        $dataSeminar = DB::table('seminar')->get();

        $data['dataSeminar'] = $dataSeminar;
        return view('seminar/list-seminar', $data);
    }

    public function dataupload(Request $request){
        $countPeserta = new \Sofa\Eloquence\Subquery(
            DB::table('peserta as p')
                ->selectRaw('count(p.id)')->whereRaw('p.dataupload_id = dataupload.id'),
                'count_peserta'
        );
        $dataPendaftar = DB::table('dataupload')
                        ->select(
                            'dataupload.id as dataupload_id',
                            'dataupload.kode_kelas',
                            'seminar.id as seminar_id',
                            'tema_seminar',
                            'harga_seminar',
                            'status_pembayaran',
                            $countPeserta
                        )
                        ->leftjoin('seminar', 'seminar.id', '=', 'dataupload.seminar_id')
                        ->leftjoin('pembayaran', 'pembayaran.dataupload_id', '=', 'dataupload.id')
                        ->paginate(10);

        // print_r($dataPendaftar);

        $data = [
            'tableHead' => ['#ID', 'Kelas', 'Jumlah Peserta', 'Seminar', 'Harga Tiket', 'Total Pembayaran', 'Status Pembayaran', 'Lihat'],        
            'dataPendaftaran' => $dataPendaftar,
        ];
        // return response()->json($dataPendaftar);
        return view('data-transaksi', $data);
    }

    public function tambah(Request $request){
        return view('seminar/tambah-seminar');
    }

    public function viewDetail($seminarId, $datauploadID){
        $countPeserta = new \Sofa\Eloquence\Subquery(
            DB::table('peserta as p')
                ->selectRaw('count(p.id)')->whereRaw('p.dataupload_id = dataupload.id'),
                'Jumlah Peserta'
        );
        $dataTransaksi = DB::table('dataupload')
                            ->select(
                                'dataupload.id as ID Transaksi',
                                'tema_seminar as Tema Seminar',
                                'harga_seminar as Harga Tiket',
                                'seminar.id as seminar_id',
                                'dataupload.kode_kelas as Kelas',
                                $countPeserta,
                                'pembayaran.id as pembayaran_id',
                                'status_pembayaran as Status Pembayaran',
                                'url_bukti_pembayaran as Bukti Pembayaran'                            
                                )
                            ->leftjoin('seminar', 'seminar.id', '=', 'dataupload.seminar_id')
                            ->leftjoin('pembayaran', 'pembayaran.dataupload_id', '=', 'dataupload.id')                    
                            ->where('dataupload.id', $datauploadID)
                            ->where('seminar.id', $seminarId)
                            ->get();
        $result = [];
        foreach($dataTransaksi[0] as $key => $val){
            // if($key === 'Bukti Pembayaran') $val = html_entity_decode('&lt;img src="' . $val . '"/&gt;');
            $result[$key] = $val;
        }

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
            ->where('du.id', $datauploadID)
            ->where('seminar_id', $seminarId)
            ->paginate(10);

        $data = [
            'dataT' => $result,
            'total_pembayaran' => $result['Harga Tiket'] * $result['Jumlah Peserta'],
            'tableHead' => ['#', 'Nama', 'Nim', 'Kelas', 'No Telp', 'Seminar', 'Kehadiran'],            
            'dataPeserta' => $queryPeserta,
            'url'       => 'transaksi/' . $datauploadID . '/' . $seminarId . '/detail'
        ];

        // return response()->json($dataTransaksi);
        return view('detail-transaksi', $data);
    }
}

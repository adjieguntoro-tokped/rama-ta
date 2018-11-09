
@extends('master')
@section('content')
<div class="row">
  <div class="col-lg-12">
    <div class="card m-b-30">
        <div class="card-body">

            <h4 class="mt-0 header-title">Data Pendaftaran Peserta Seminar</h4>
            <p class="text-muted m-b-30 font-14">Data peserta.
            </p>
            {{ $dataPendaftaran->links() }}

            <table class="table">
                <thead>
                <tr>
                    <!-- <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th> -->
                    @foreach($tableHead as $head)
                      <th>{{ $head }}</th>                    
                    @endforeach
                </tr>
                </thead>
                <tbody class="table-striped">
                  @foreach($dataPendaftaran as $p)
                  <tr>
                    <th scope="row">{{ $p->dataupload_id }}</th>
                    <td>{{ $p->kode_kelas }}</td>
                    <td>{{ $p->count_peserta }} Peserta</td>
                    <td>{{ $p->tema_seminar }}</td>
                    <td>Rp. {{ number_format($p->harga_seminar) }}</td>
                    <td>Rp. {{ number_format(((int) $p->harga_seminar) * $p->count_peserta) }}</td>                                                          
                    <td> 
                          @switch($p->status_pembayaran)
                            @case(1)
                              <span class="badge badge-info">
                              Menunggu Verifikasi
                              @break
                            @case(2)
                              <span class="badge badge-success">                            
                              Terverifikasi
                              @break
                            @default
                              <span class="badge badge-warning">                                                        
                              Belum Upload Bukti Pembayaran
                          @endswitch
                        <span>    
                    </td>
                    <td><a href="{{ '/transaksi/' . $p->seminar_id . '/' . $p->dataupload_id . '/detail' }}" class="btn btn-sm btn-outline-info"> Detail </a></td>                    
                  </tr>
                  @endforeach
                </tbody>
            </table>
            <nav aria-label="...">
                {{ $dataPendaftaran->links() }}
                <!-- <ul class="pagination">
                    <li class="page-item ">
                    
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul> -->
            </nav>
        </div>
    </div>
  </div> <!-- end col -->
</div>
@endsection
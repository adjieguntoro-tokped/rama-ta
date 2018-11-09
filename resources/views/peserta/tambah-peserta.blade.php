@extends('master')

@section('content')

<div class="row">
    <div class="col-12">
        <div class="card m-b-10">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                      <img class="card-img-top img-fluid" src={{ asset('assets/images/small/' . $dataSeminar->poster_seminar) }} alt="Card image cap">                  
                    </div>
                    <div class="col-md-6">
                        <h2 class="mt-0 ">{{ $dataSeminar->tema_seminar }}</h2>
                        <p>{{ $dataSeminar->deskripsi_seminar }}</p>  
                        <p><b><i class="ti-ticket"></i> Rp. {{ $dataSeminar->harga_seminar }}</b></p> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12 m-b-10" >
        <div class="card">
            <div class="card-body">
                <form action="{{ route('import') }}" method="POST" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    {{ method_field('post') }}
                    <input type="hidden" name="seminar_id" value="{{ $dataSeminar->id }}" />  
                    <input type="hidden" name="seminar_slug" value="{{ $seminarslug }}" />        
                    <div class="row">
                        <div class="col-md-1">
                            <h1 style="text-align:center">1</h1>
                        </div>
                        <div class="col-md-3">
                            <h3 class="header-title">Upload Data Peserta Seminar : </h3>
                        </div>
                        @if($statusPendaftaran === false)                        
                            <div class="col-md-5">
                                <input type="file" name="file_peserta" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <input type="submit" value="Upload" class="btn btn-outline-primary btn-block btn-lg">
                            </div>
                        @else
                            <div class="col-md-8">
                                <h4 style="color:#0f9cf3"><i class="ti-check-box"></i>Data Peserta Berhasil Diupload</h4>                                
                                <!-- <h4 style="color:#0f9cf3"><i class="ti-check-box"></i> {{ $totalDataPeserta }} Data Peserta Berhasil Diupload</h4> -->
                            </div>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-12 m-b-10">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('upload.bukti') }}" method="POST" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <!-- {{ method_field('post') }} -->
                    <input type="hidden" name="seminar_id" value="{{ $dataSeminar->id }}" />
                    <input type="hidden" name="dataupload_id" value="{{ $dataupload_id }}" />
                    <input type="hidden" name="kode_kelas" value="{{ $kode_kelas }}" />                                        
                    <div class="row">
                        <div class="col-md-1">
                            <h1 style="text-align:center">2</h1>
                        </div>
                        
                        <div class="col-md-3">
                            <h3 class="header-title">Upload Bukti Pembayaran : </h3>
                        </div>
                        @if($statusPendaftaran === true)
                            @switch($statusPembayaran)
                                @case(1)
                                    <div class="col-md-8">
                                        <h4 style="color:#ffc107"><i class="ti-info-alt"></i> Sedang diproses</h4>
                                    </div>
                                    @break
                                @case(2)
                                    <div class="col-md-8">
                                        <h4 style="color:#0f9cf3"><i class="ti-check-box"></i> Pembayaran dikonfirmasi</h4>
                                    </div>
                                    @break
                                @default
                                    <div class="col-md-5">
                                        <input type="file" name="file_buktibayar" class="form-control">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="submit" value="Upload" class="btn btn-outline-primary btn-block btn-lg">
                                    </div>
                            @endswitch
                        @else
                            <div class="col-md-8">
                                <h4 style="color:#ffc107"><i class="ti-info-alt"></i> Upload Data Peserta Terlebih Dahulu</h4>
                            </div>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-12 m-b-10">
        <div class="card">
            <div class="card-body">
                @include('peserta/list-peserta')
            </div>
        </div>
    </div>
    <!-- <div class="col-12">
        <div class="card m-b-30">
            <div class="card-body">
                <h4 class="mt-0 header-title">Upload Data Peserta dan Bukti Pembayaran Seminar</h4>
                <p class="text-muted m-b-30 font-14"> lorem ipsum si dolor amet</p>
                
                <form action="{{ route('import') }}" method="POST" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="form-group row">
                        <input type="hidden" name="seminar_id" value="{{ $dataSeminar->id }}" />
                        <label for="example-text-input" class="col-sm-4 col-form-label">
                            Data Peserta Seminar (xls, xlsx, csv)
                        </label>
                        <div class="col-sm-8">
                            <input type="file" name="file_peserta" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="example-text-input" class="col-sm-4 col-form-label">
                            Bukti Pembayaran Seminar
                        </label>
                        <div class="col-sm-8">
                            <input type="file" name="file_buktiPembayaran" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8">
                            <input type="submit" value="Upload" class="btn btn-primary btn-lg" style="margin-top: 3%">
                        </div>
                    </div>

                    
                </form>
        </div>
    </div> -->
</div>

@endsection
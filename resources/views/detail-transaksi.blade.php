
@extends('master')
@section('content')
<div class="row">
  <div class="col-lg-12">
    <div class="card m-b-30">
        <div class="card-body">

            <h4 class="mt-0 header-title">Data Pendaftaran Peserta Seminar</h4>

            <table class="table">
                <tbody>
                  @foreach($dataT as $key => $val)
                    @if($key === 'seminar_id' || $key === 'pembayaran_id')
                      @continue
                    @endif
                    <tr>
                      <th>{{ $key }} </th>
                      @if($key === 'Bukti Pembayaran')
                          @if($val !== null)
                            <td><img width="200px" src="{{ asset($val) }}"/> </td>                          
                          @else
                            <td>{{ $val }}</td>
                          @endif
                      @elseif($key === 'Status Pembayaran')
                        <td>
                        @switch($val)
                            @case(1)
                              <div class="row">
                                <div class="col-md-2">
                                  <span class="badge badge-info">
                                    Menunggu Verifikasi
                                  </span>
                                </div>
                                <div class="col-md-6">
                                  <form action="{{route('verifikasi')}}" method="POST">
                                    {{ csrf_field() }}
                                    {{ method_field('post') }}
                                    <input type="hidden" name="pembayaran_id" value="{{ $dataT['pembayaran_id'] }}">
                                    <input type="hidden" name="dataupload_id" value="{{ $dataT['ID Transaksi'] }}">
                                    <input type="hidden" name="seminar_id" value="{{ $dataT['seminar_id'] }}">
                                    <input type="hidden" name="url" value="{{ $url }}">                                    
                                    <input type="submit" class="btn btn-sm btn-outline-primary" value="Verifikasi Pembayaran">
                                  </form>
                                </div>
                              </div>

                              <!-- <span class="btn btn-sm btn-outline-primary"> Verifikasi Pembayaran</span> -->
                              @break
                            @case(2)
                              <span class="badge badge-success">                            
                              Terverifikasi</span>
                              @break
                            @default
                              <span class="badge badge-warning">                                                        
                              Belum Upload Bukti Pembayaran</span>
                          @endswitch
                        </td>
                      @elseif($key === 'Harga Tiket')
                        <td>
                          Rp. {{ number_format($val) }}
                        </td>
                      @else
                        <td>{{ $val }} </td>
                      @endif
                    </tr>
                    @if($key === 'Jumlah Peserta')
                    <tr>
                        <th>Total Pembayaran</th>
                        <td>
                          Rp. {{ number_format($total_pembayaran) }}
                        </td>
                    </tr>
                    @endif
                  @endforeach
                </tbody>
            </table>
            @include('peserta/list-peserta')
        </div>
    </div>
  </div> <!-- end col -->
</div>
@endsection
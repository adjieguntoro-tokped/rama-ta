@extends('master')
@section('content')
<div class="row">
  @foreach($dataSeminar as $data)
    <div class="col-md-4 col-lg-4 col-xl-4">
    <div class="card m-b-30">
          <img class="card-img-top img-fluid" src={{ asset('assets/images/small/' . $data->poster_seminar) }} alt="Card image cap">
          <div class="card-body">
              <h4 class="card-title font-20 mt-0"> {{ $data->tema_seminar }}</h4>
              <p><i class="ti-ticket"></i> {{ 'Rp. ' . $data->harga_seminar }}</p>
              
              <!-- <p class="card-text">{{ $data->deskripsi_seminar }}.</p> -->
              <a href="{{ 'seminar/' . $data->seminar_slug . '/daftar' }}" class="btn btn-outline-primary waves-effect btn-block btn-lg waves-light">Daftar</a>
          </div>
      </div>
    </div>
  @endforeach
</div>
@endsection
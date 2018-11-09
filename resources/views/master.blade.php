@extends('layout')
@section('main')
      <div id="wrapper">
        @include('sidebar')

        <div class="content-page">
          <div class="content">
            @include('topbar')
            @yield('content')
          </div>
        </div>
@endsection
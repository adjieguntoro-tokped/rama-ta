<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet">  
        <link href="{{ asset('assets/css/icons.css') }}" rel="stylesheet">                      
        <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">

        <title>Sistem Informasi & Pendaftaran Seminar</title>
    </head>
    <body>
      @yield('main')
    </body>
</html>
@extends('layout')
@section('main')
<div class="wrapper-page">
    <div class="card">
        <div class="card-body">

            <h3 class="text-center mt-0 m-b-15">
                <a href="./index.html" class="logo logo-admin"><img src="./assets/images/logo.png" height="30" alt="logo" /></a>
            </h3>

            <h4 class="text-muted text-center font-18"><b>Sign In</b></h4>

            <div class="p-3">
                <form class="form-horizontal m-t-20" method="POST" action="{{route('doLogin')}}" />
                {{ csrf_field() }}

                  @if($errors->any())
                    <div class="from-group row">
                      <div class="col-md-12">
                        <div class="alert alert-danger" role="alert">
                            <strong>Oh snap!</strong> <br /> Username atau Passwod Anda salah.
                        </div>
                      </div>
                    </div>
                  @endif
                    
                    <div class="form-group row">
                        <div class="col-12">
                            <input class="form-control" name="username" type="text" required="" placeholder="Username" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-12">
                            <input class="form-control" name="password" type="password" required="" placeholder="Password" />
                        </div>
                    </div>

                    <!-- <div class="form-group row">
                        <div class="col-12">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck1" />
                                <label class="custom-control-label" for="customCheck1">Remember me</label>
                            </div>
                        </div>
                    </div> -->

                    <div class="form-group text-center row m-t-20">
                        <div class="col-12">
                            <button class="btn btn-info btn-block waves-effect waves-light" type="submit">Log In</button>
                        </div>
                    </div>

                    <!-- <div class="form-group m-t-10 mb-0 row">
                        <div class="col-sm-7 m-t-20">
                            <a href="./pages-recoverpw.html" class="text-muted"><i class="mdi mdi-lock    "></i> Forgot your password?</a>
                        </div>
                        <div class="col-sm-5 m-t-20">
                            <a href="./pages-register.html" class="text-muted"><i class="mdi mdi-account-circle"></i> Create an account</a>
                        </div>
                    </div> -->
                </form>
            </div>

        </div>
    </div>
</div>
@endsection
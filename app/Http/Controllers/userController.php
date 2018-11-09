<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class userController extends Controller
{
    public function showLogin(){
        return view('login');
    }

    public function doLogin(Request $req){
        // print_r($req->all());

        $rules = [
            'username' => 'required',
            'password' => 'required|min:3'
        ];
        
        $validator = Validator::make($req->all(), $rules);
        
        if($validator->fails()) {
            // print_r($validator); die();
            return redirect('login')->withErros($validator)->withInput();
        }
    }
}

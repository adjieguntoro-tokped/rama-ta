<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSeminarTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('seminar', function (Blueprint $table) {
            $table->increments('id');
            $table->string('tema_seminar');
            $table->string('tanggal_seminar');
            $table->string('deskripsi_seminar');
            $table->string('quota_seminar');
            $table->string('harga_seminar');   
            $table->string('lokasi_seminar'); 
            $table->string('poster_seminar');                                                                                                                                                                                                                                                                             
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('seminar');
    }
}

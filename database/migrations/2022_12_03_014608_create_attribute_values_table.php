<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAttributeValuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('attribute_values', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('product_attribute_id')->unsigned()->nullable();
            $table->string('value');
            $table->bigInteger('product_id')->unsigned()->nullable();
            $table->timestamps();
            // Relasi antar tabel (menghubungkan ke dalam tabel product_attributes untuk dihubungkan ke dalam tabel product)
            $table->foreign('product_attribute_id')->references('id')->on('product_attributes')->onDelete('cascade'); // tabel product_attributes 
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade'); // tabel product
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('attribute_values');
    }
}

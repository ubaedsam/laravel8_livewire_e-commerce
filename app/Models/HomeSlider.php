<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomeSlider extends Model
{
    use HasFactory;

    // Menghubungkan ke dalam tabel home_sliders
    protected $table = "home_sliders";
}

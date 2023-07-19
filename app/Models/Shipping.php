<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
    use HasFactory;

    protected $table = "shippings"; // menghubungkan ke dalam tabel shippings

    // Relasi antar tabel (menghubungkan ke dalam tabel order)
    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}

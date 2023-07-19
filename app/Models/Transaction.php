<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    protected $table = "transactions"; // menghubungkan ke dalam tabel transactions

    // Relasi antar tabel (menghubungkan ke dalam tabel order)
    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}

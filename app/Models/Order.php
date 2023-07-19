<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $table = "orders"; // menghubungkan ke dalam tabel orders

    // Relasi antar tabel (menghubungkan ke dalam tabel user)
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Relasi antar tabel (menghubungkan ke dalam tabel order item dengan mengambil banyak field data)
    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }

    // Relasi antar tabel (menghubungkan ke dalam tabel shipping dengan mengambil satu field data)
    public function shipping()
    {
        return $this->hasOne(Shipping::class);
    }

    // Relasi antar tabel (menghubungkan ke dalam tabel transaction dengan mengambil satu field data)
    public function transaction()
    {
        return $this->hasOne(Transaction::class);
    }
}

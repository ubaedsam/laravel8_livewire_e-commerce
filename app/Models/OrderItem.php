<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;

    protected $table = "order_items"; // menghubungkan ke dalam tabel order_items

    // Relasi antar tabel (menghubungkan ke dalam tabel order)
    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    // Relasi antar tabel (menghubungkan ke dalam tabel product)
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    // Relasi antar tabel (menghubungkan satu data ke dalam tabel order item dari tabel review)
    public function review()
    {
        return $this->hasOne(Review::class,'order_item_id');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = "products";

    // Relasi antar tabel (menghubungkan tabel category ke dalam tabel product)
    public function category()
    {
        return $this->belongsTo(Category::class,'category_id');
    }

    // Relasi antar tabel untuk mengambil banyak data
    public function orderItems()
    {
        return $this->hasMany(OrderItem::class,'product_id');
    }

    // Relasi antar tabel untuk mengambil data (Menghubungkan ke dalam tabel subcategories)
    public function subCategories()
    {
        return $this->belongsTo(Subcategory::class,'subcategory_id');
    }

    // Relasi antar tabel untuk mengambil banyak data (menghubungkan ke dalam tabel attribute values berdasarkan product idnya)
    public function attributeValues()
    {
        return $this->hasMany(AttributeValue::class,'product_id');
    }
}

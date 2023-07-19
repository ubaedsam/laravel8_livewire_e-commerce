<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttributeValue extends Model
{
    use HasFactory;

    // Relasi antar tabel dengan menangkap aksi pengambil banyak data pada tabel product_attribute (menghubungkan ke dalam tabel product_attributes)
    public function productAttribute()
    {
        return $this->belongsTo(ProductAttribute::class,'product_attribute_id');
    }
}

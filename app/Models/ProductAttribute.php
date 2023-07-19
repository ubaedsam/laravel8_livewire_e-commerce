<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductAttribute extends Model
{
    use HasFactory;

    // Relasi antar tabel dengan mengambil banyak data (menghubungkan ke dalam tabel attribute_value)
    public function attributeValues()
    {
        return $this->hasMany(AttributeValue::class);
    }
}

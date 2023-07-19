<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    // menghubungkan ke dalam tabel categories
    protected $table = "categories";

    // menghubungkan ke dalam tabel subcategories pada file model Subcategory (relasi antar tabel)
    // mengambil banyak data
    public function subCategories()
    {
        return $this->hasMany(Subcategory::class,'category_id');
    }
}

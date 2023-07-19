<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subcategory extends Model
{
    use HasFactory;
    
    // menghubungkan ke dalam tabel categories pada file model category (relasi antar tabel)
    public function category()
    {
        $this->belongsTo(Category::class);
    }
}

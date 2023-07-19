<?php

namespace App\Http\Livewire\Admin;

use App\Models\Product;
use Livewire\Component;
use Livewire\WithPagination;

class AdminProductComponent extends Component
{
    use WithPagination; // menggunakan library pagination

    public $searchTerm; // untuk mencari data yang ada di tabel product

    // Proses menghapus data product
    public function deleteProduct($id)
    {
        $product = Product::find($id); // mengambil satu data
        if($product->image) // menghapus data lama gambar product yang satu
        {
            unlink('assets/images/products'.'/'.$product->image);
        }
        if($product->images) // menghapus data lama gambar product gallery yang banyak
        {
            $images = explode(",",$product->images);
            foreach($images as $image)
            {
                if($image)
                {
                    unlink('assets/images/products'.'/'.$image);
                }
            }
        }
        $product->delete();
        session()->flash('message','Data Produk berhasil di hapus!');
    }

    public function render()
    {
        $search = '%' . $this->searchTerm . '%';  // untuk fitur search

        $products = Product::where('name','LIKE',$search) // mencari data berdasarkan nama productnya
        ->orWhere('stock_status','LIKE',$search) // mencari data berdasarkan stock status barangnya
        ->orWhere('regular_price','LIKE',$search) // mencari data berdasarkan regular price barangnya
        ->orWhere('sale_price','LIKE',$search) // mencari data berdasarkan sale price barangnya
        ->orderBy('id','DESC')
        ->paginate(10); // Mengambil semua data product sekalian membatasi data yang muncul di tabel sebanyak 10 data dan memasukan fitur search data

        return view('livewire.admin.admin-product-component',['products'=>$products])->layout('layouts.base');
    }
}

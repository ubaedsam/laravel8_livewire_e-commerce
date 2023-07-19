<?php

namespace App\Http\Livewire;

use App\Models\Product; // Menghubungkan ke dalam model Product
use Livewire\Component;
use Livewire\WithPagination; // Menggunakan library pagination
use Cart;
use App\Models\Category; // Menghubungan ke dalam model Category

class SearchComponent extends Component
{
    public $sorting;
    public $pagesize;

    // Komponen Membuat Fitur Search Data Produk
    public $search;
    public $product_cat;
    public $product_cat_id;

    public function mount()
    {
        $this->sorting = "default"; // memunculkan data barang berdasarkan kategori yang di pilih
        $this->pagesize = 12; // membatasi data yang muncul di satu halaman (data yang muncul sebanyak 12 data)
        $this->fill(request()->only('search','product_cat','product_cat_id')); // fitur search
    }

    // Untuk menyimpan data belanja ke keranjang
    public function store($product_id,$product_name,$product_price)
    {
        Cart::add($product_id,$product_name,1,$product_price)->associate('App\Models\Product');
        session()->flash('success_message','Item added in Cart');
        return redirect()->route('product.cart'); // jika berhasil masuk ke halaman cart
    }

    public function render()
    {
        if($this->sorting=='date')
        {
            $products = Product::where('name','like','%'.$this->search . '%')->where('category_id','like','%'.$this->product_cat_id.'%')->orderBy('created_at','DESC')->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan orderBy adalah menampilkan data berdasarkan tanggal sebuah product di publikasikan secara terbalik dari bawah ke atas
        }
        else if($this->sorting=="price")
        {
            $products = Product::where('name','like','%'.$this->search . '%')->where('category_id','like','%'.$this->product_cat_id.'%')->orderBy('regular_price','ASC')->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan orderBy adalah menampilkan data berdasarkan tanggal sebuah product di publikasikan dari atas ke bawah
        }
        else if($this->sorting=="price-desc")
        {
            $products = Product::where('name','like','%'.$this->search . '%')->where('category_id','like','%'.$this->product_cat_id.'%')->orderBy('created_at','DESC')->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan orderBy adalah menampilkan data berdasarkan tanggal sebuah product di publikasikan secara terbalik dari bawah ke atas
        }
        else {
            $products = Product::where('name','like','%'.$this->search . '%')->where('category_id','like','%'.$this->product_cat_id.'%')->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
        }

        $categories = Category::all(); // Mengambil semua data kategori pada tabel category
        
        return view('livewire.search-component',['products'=> $products, 'categories'=> $categories])->layout("layouts.base");
        // keterangan ['products'=> $products] mengambil semua data product pada tabel product
        // keterangan ['categories'=> $categories] mengambil semua data categories pada tabel categories
    }
}
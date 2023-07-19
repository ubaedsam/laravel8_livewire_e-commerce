<?php

namespace App\Http\Livewire;

use App\Models\Product; // Menghubungkan ke dalam model Product
use Livewire\Component;
use Livewire\WithPagination; // Menggunakan library pagination
use Cart;
use App\Models\Category; // Menghubungan ke dalam model Category
use App\Models\Subcategory;

class CategoryComponent extends Component
{
    public $sorting;

    public $pagesize;

    public $category_slug;

    public $scategory_slug;

    public function mount($category_slug, $scategory_slug=null)
    {
        $this->sorting = "default"; // memunculkan data barang berdasarkan kategori yang di pilih
        $this->pagesize = 12; // membatasi data yang muncul di satu halaman (data yang muncul sebanyak 12 data)
        $this->category_slug = $category_slug;
        $this->scategory_slug = $scategory_slug;
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
        $category_id = null;
        $category_name = "";
        $filter = "";

        if($this->scategory_slug)
        {
            // Menampilkan semua data subcategory berdasarkan kategorinya dengan nama inisial subcategorynya
            $scategory = Subcategory::where('slug',$this->scategory_slug)->first();
            $category_id = $scategory->id;
            $category_name = $scategory->name;
            $filter = "sub";
        }
        else
        {
            // menampilkan semua data produk berdasarkan kategorinya dengan nama inisial slug kategorinya
            $category = Category::where('slug', $this->category_slug)->first();
            $category_id = $category->id;
            $category_name = $category->name;
            $filter = "";
        }

        if($this->sorting=='date')
        {
            $products = Product::where($filter.'category_id', $category_id)->orderBy('created_at','DESC')->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan orderBy adalah menampilkan data berdasarkan tanggal sebuah product di publikasikan secara terbalik dari bawah ke atas
        }
        else if($this->sorting=="price")
        {
            $products = Product::where($filter.'category_id', $category_id)->orderBy('regular_price','ASC')->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan orderBy adalah menampilkan data berdasarkan tanggal sebuah product di publikasikan dari atas ke bawah
        }
        else if($this->sorting=="price-desc")
        {
            $products = Product::where($filter.'category_id', $category_id)->orderBy('created_at','DESC')->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan orderBy adalah menampilkan data berdasarkan tanggal sebuah product di publikasikan secara terbalik dari bawah ke atas
        }
        else {
            $products = Product::where($filter.'category_id', $category_id)->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
        }

        $categories = Category::all(); // Mengambil semua data kategori pada tabel category
        
        return view('livewire.category-component',['products'=> $products, 'categories'=> $categories, 'category_name'=> $category_name])->layout("layouts.base");
        // keterangan ['products'=> $products] mengambil semua data product pada tabel product
        // keterangan ['categories'=> $categories] mengambil semua data categories pada tabel categories
        // keterangan ['category_name'=> $category_name] menampilkan semua data product berdasarkan category yang di pilih
    }
}

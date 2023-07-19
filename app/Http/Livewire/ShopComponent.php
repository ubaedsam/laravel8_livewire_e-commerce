<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Illuminate\Support\Facades\Auth;
use Cart; // menggunakan library cart
use Livewire\WithPagination; // Menggunakan library pagination
use App\Models\Product; // Menghubungkan ke dalam model Product
use App\Models\Category; // Menghubungan ke dalam model Category

class ShopComponent extends Component
{
    // Untuk memfilter data yang tampil
    public $sorting;
    public $pagesize;

    public $min_price;
    public $max_price;

    public function mount()
    {
        $this->sorting = "default"; // memunculkan data barang berdasarkan kategori yang di pilih
        $this->pagesize = 12; // membatasi data yang muncul di satu halaman (data yang muncul sebanyak 12 data)

        $this->min_price = 1; // memunculkan data barang dengan harga paling kecil yaitu 1 rupiah
        $this->max_price = 1000; // memunculkan data barang dengan harga paling besar yaitu 1000 rupiah
    }

    // Untuk menyimpan data barang belanja ke keranjang (bersifat sementara)
    public function store($product_id,$product_name,$product_price)
    {
        Cart::instance('cart')->add($product_id,$product_name,1,$product_price)->associate('App\Models\Product');
        session()->flash('success_message','Item added in Cart');
        return redirect()->route('product.cart'); // jika berhasil data masuk ke halaman cart
        // keterangan instance adalah menyimpan data barang hanya sebagai contoh di daftar wishlist (sementara)
        // keterangan add adalah menyimpan data barang hanya sebagai data barang yang akan di beli pada daftar keranjang (sementara)
        // keterangan associate adalah menghubungkan ke dalam model
        // keterangan cart adalah menggunakan library cart untuk e-commerce
    }

    // untuk menyimpan data barang belanja ke daftar disukai / wishlist (bersifat sementara)
    public function addToWishList($product_id,$product_name,$product_price)
    {
        Cart::instance('wishlist')->add($product_id,$product_name,1,$product_price)->associate('App\Models\Product');
        // keterangan instance adalah menyimpan data barang hanya sebagai contoh di daftar wishlist (sementara)
        // keterangan add adalah menyimpan data barang hanya sebagai data barang yang akan di beli pada daftar keranjang (sementara)
        // keterangan associate adalah menghubungkan ke dalam model
        // keterangan cart adalah menggunakan library cart untuk e-commerce

        $this->emitTo('wishlist-count-component','refreshComponent');
        // emitTo untuk menghubungkan ke beberapa halaman
        // contoh wishlist-count-component yaitu menghubungkan ke dalam view halaman tersebut
        // contoh refreshComponent yaitu menghubungkan ke dalam controller WishtListCountComponent sekaligus untuk merefresh halaman jika data product dimasukan ke dalam daftar wishlist
    }

    // untuk menghapus data barang belanja yang ada di daftar disukai / wishlist
    public function removeFromWishlist($product_id)
    {
        foreach(Cart::instance('wishlist')->content() as $witem)
        {
            if($witem->id == $product_id)
            {
            Cart::instance('wishlist')->remove($witem->rowId);
            $this->emitTo('wishlist-count-component','refreshComponent');
            // emitTo untuk menghubungkan ke beberapa halaman
            // contoh wishlist-count-component yaitu menghubungkan ke dalam view halaman tersebut
            // contoh refreshComponent yaitu menghubungkan ke dalam controller WishtListCountComponent sekaligus untuk merefresh halaman jika data product dimasukan ke dalam daftar wishlist
            return;
            }
        }
    }

    public function render()
    {
        if($this->sorting=='date')
        {
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->orderBy('created_at','DESC')->paginate($this->pagesize);
            // keterangan $this->pagesize adalah membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan orderBy adalah menampilkan data berdasarkan tanggal sebuah product di publikasikan secara terbalik dari bawah ke atas
            // keterangan whereBetween adalah menampilkan data product atau barang berdasarkan range harga yang di pilih
        }
        else if($this->sorting=="price")
        {
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->orderBy('regular_price','ASC')->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan orderBy adalah menampilkan data berdasarkan tanggal sebuah product di publikasikan dari atas ke bawah
            // keterangan whereBetween adalah menampilkan data product atau barang berdasarkan range harga yang di pilih
        }
        else if($this->sorting=="price-desc")
        {
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->orderBy('created_at','DESC')->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan orderBy adalah menampilkan data berdasarkan tanggal sebuah product di publikasikan secara terbalik dari bawah ke atas
            // keterangan whereBetween adalah menampilkan data product atau barang berdasarkan range harga yang di pilih
        }
        else {
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->paginate($this->pagesize);
            // keterangan $this->pagesize membatasi data product yang muncul sebanyak 12 data di dalam 1 halaman
            // keterangan whereBetween adalah menampilkan data product atau barang berdasarkan range harga yang di pilih
        }

        $categories = Category::all(); // Mengambil semua data kategori pada tabel category

        // Untuk menyimpan history penyimpanan barang di keranjang
        if(Auth::check())
        {
            Cart::instance('cart')->store(Auth::user()->email); // ke dalam cart
            Cart::instance('wishlist')->store(Auth::user()->email); // ke dalam wishlist
        }
        
        return view('livewire.shop-component',['products'=> $products, 'categories'=> $categories])->layout("layouts.base");
        // keterangan ['products'=> $products] mengambil semua data product pada tabel product
        // keterangan ['categories'=> $categories] mengambil semua data categories pada tabel categories
    }
}

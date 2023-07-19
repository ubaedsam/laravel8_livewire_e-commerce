<?php

namespace App\Http\Livewire;

use App\Models\Product;
use App\Models\Sale;
use Livewire\Component;
use Cart;

class DetailsComponent extends Component
{
    // Data yang disimpan
    public $slug; // merubah id menjadi nama slug pada satu data yang di cari
    public $qty; // merubah jumlah barang yang ada di dalam detail product
    public $satt=[]; // untuk 

    public function mount($slug){
        $this->slug = $slug;
        $this->qty = 1;
    }

    // Untuk menyimpan data belanja ke keranjang
    public function store($product_id,$product_name,$product_price)
    {
        Cart::instance('cart')->add($product_id,$product_name,$this->qty,$product_price,$this->satt)->associate('App\Models\Product');
        session()->flash('success_message','Item added in Cart');
        return redirect()->route('product.cart'); // jika berhasil masuk ke halaman cart
        // keterangan instance adalah menyimpan data barang hanya sebagai contoh di daftar wishlist (sementara)
        // keterangan add adalah menyimpan data barang hanya sebagai data barang yang akan di beli pada daftar keranjang (sementara)
        // keterangan associate adalah menghubungkan ke dalam model
        // keterangan cart adalah menggunakan library cart untuk e-commerce
    }

    // Menambah Barang yang ada di dalam cart
    public function increaseQuantity()
    {
        $this->qty++;
    }

    // Mengurangi Barang yang ada di dalam cart
    public function decreaseQuantity()
    {
        if($this->qty > 1)
        {
            $this->qty--;
        }
    }

    // menampilkan halaman detail dari sebuah product berdasarkan slug namanya
    public function render()
    {
        $product = Product::where('slug', $this->slug)->first(); // menampilkan satu data produk berdasarkan nama slugnya
        $popular_products = Product::inRandomOrder()->limit(4)->get(); // menampilkan 4 data produk secara random berdasarkan data produk yang sering di beli
        $related_products = Product::where('category_id', $product->category_id)->inRandomOrder()->limit(5)->get(); // menampilkan 5 saran data produk yang sama yang di minati oleh user
        $sale = Sale::find(1); // mengambil data pertama dari tabel sales untuk mengatur tanggal diskon
        return view('livewire.details-component', ['product'=>$product,'popular_products'=>$popular_products,'related_products'=>$related_products,'sale'=>$sale])->layout('layouts.base'); // Data Halaman
    }
}

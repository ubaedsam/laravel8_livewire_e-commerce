<?php

namespace App\Http\Livewire;

use App\Models\Sale;
use App\Models\Product;
use Livewire\Component;
use App\Models\Category;
use App\Models\HomeSlider;
use App\Models\HomeCategory;
use Illuminate\Support\Facades\Auth;
use Cart;

class HomeComponent extends Component
{
    public function render()
    {
        $sliders = HomeSlider::where('status',1)->get(); // mengambil semua data slider berdasarkan status active (1) atau inactive (0)
        $lproducts = Product::orderBy('created_at','DESC')->get()->take(8); // mengambil semua data product berdasarkan data yang tanggal terakhir di post dengan jumlah data sebanyak 8 data secara descending
        $category = HomeCategory::find(1); // mengambil satu data dari tabel home_category
        $cats = explode(',',$category->sel_categories); // menjabarkan data product yang tampil berdasarkan category yang di pilih
        $categories = Category::whereIn('id',$cats)->get(); // menampilkan data product beradasarkan category dari tabel category
        $no_of_products = $category->no_of_products; // menampilkan banyaknya data product berdasarkan kategori yang di pilih
        $sproducts = Product::where('sale_price','>',0)->inRandomOrder()->get()->take(8); // mengambil semua data product berdasarkan harga dari sebuah barang dengan jumlah data sebanyak 8 data
        $sale = Sale::find(1); // mengambil data pertama dari tabel sales untuk mengatur tanggal diskon

        // Untuk menyimpan history penyimpanan barang di keranjang
        if(Auth::check())
        {
            Cart::instance('cart')->restore(Auth::user()->email); // ke dalam cart
            Cart::instance('wishlist')->restore(Auth::user()->email); // ke dalam wishlist
        }

        return view('livewire.home-component',['sliders'=>$sliders,'lproducts'=>$lproducts,'lproducts'=>$lproducts,'categories'=>$categories,'no_of_products'=>$no_of_products,'sproducts'=>$sproducts,'sale'=>$sale])->layout("layouts.base");
    }
}

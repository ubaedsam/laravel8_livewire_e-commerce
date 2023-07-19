<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Cart;

class WishlistComponent extends Component
{
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

    // memindahkan data product dari daftar wishlist ke daftar keranjang belanja sekaligus menghapus data product di daftar wishlist
    public function moveProductFromWishlistToCart($rowId)
    {
        $item = Cart::instance('wishlist')->get($rowId); // mengambil satu data product berdasarkan idnya
        Cart::instance('wishlist')->remove($rowId); // menghapus data product di daftar wishlist
        Cart::instance('cart')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product'); // menyimpan data product
        // keterangan instance adalah menyimpan data barang hanya sebagai contoh di daftar wishlist (sementara)
        // keterangan add adalah menyimpan data barang hanya sebagai data barang yang akan di beli pada daftar keranjang (sementara)
        // keterangan associate adalah menghubungkan ke dalam model
        // keterangan cart adalah menggunakan library cart untuk e-commerce
        $this->emitTo('wishlist-count-component','refreshComponent');
        $this->emitTo('cart-count-component','refreshComponent');
        // emitTo untuk menghubungkan ke beberapa halaman
        // contoh wishlist-count-component yaitu menghubungkan ke dalam view halaman tersebut
        // contoh refreshComponent yaitu menghubungkan ke dalam controller WishtListCountComponent sekaligus untuk merefresh halaman jika data product dimasukan ke dalam daftar wishlist
    }

    public function render()
    {
        return view('livewire.wishlist-component')->layout('layouts.base');
    }
}

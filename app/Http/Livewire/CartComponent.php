<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Coupon;
use Carbon\Carbon; // menggunakan library carbon
Use Cart; // Menggunakan Library Cart
use Illuminate\Support\Facades\Auth; // Menggunakan library auth (sistem login)

class CartComponent extends Component
{
    // Data yang disimpan
    // tabel coupon
    public $haveCouponCode;
    public $couponCode;
    public $discount;
    public $subtotalAfterDiscount;
    public $taxAfterDiscount;
    public $totalAfterDiscount;

    // Menambah Barang yang ada di dalam cart
    public function increaseQuantity($rowId)
    {
        $product = Cart::instance('cart')->get($rowId); // konfigurasi data yang di ambil
        $qty = $product->qty + 1; // proses menambah product
        Cart::instance('cart')->update($rowId,$qty); // proses menyimpan data product

        // keterangan get adalah mengambil data product berdasarkan id
        // keterangan instance untuk contoh data barang yang di simpan ke dalam daftar wishlist

        $this->emitTo('cart-count-component','refreshComponent');
        // emitTo untuk menghubungkan ke beberapa halaman
        // contoh cart-count-component yaitu menghubungkan ke dalam view halaman tersebut
        // contoh refreshComponent yaitu menghubungkan ke dalam controller CartCountComponent sekaligus untuk merefresh halaman jika data product dimasukan ke dalam daftar cart
    }

    // Mengurangi Barang yang ada di dalam cart
    public function decreaseQuantity($rowId)
    {
        $product = Cart::instance('cart')->get($rowId); // konfigurasi data yang di ambil
        $qty = $product->qty - 1; // proses mengurangi product
        Cart::instance('cart')->update($rowId,$qty); // proses menyimpan data product

        // keterangan get adalah mengambil data product berdasarkan id
        // keterangan instance untuk contoh data barang yang di simpan ke dalam daftar wishlist

        $this->emitTo('cart-count-component','refreshComponent');
        // emitTo untuk menghubungkan ke beberapa halaman
        // contoh cart-count-component yaitu menghubungkan ke dalam view halaman tersebut
        // contoh refreshComponent yaitu menghubungkan ke dalam controller CartCountComponent sekaligus untuk merefresh halaman jika data product dimasukan ke dalam daftar cart
    }

    // Menghapus barang yang ada di dalam cart
    public function destroy($rowId)
    {
        Cart::instance('cart')->remove($rowId);
        $this->emitTo('cart-count-component','refreshComponent');
        // emitTo untuk menghubungkan ke beberapa halaman
        // contoh cart-count-component yaitu menghubungkan ke dalam view halaman tersebut
        // contoh refreshComponent yaitu menghubungkan ke dalam controller CartCountComponent sekaligus untuk merefresh halaman jika data product dimasukan ke dalam daftar cart
        session()->flash('success_message','Data Barang Telah Terhapus');

        // keterangan instance untuk contoh data barang yang di simpan ke dalam daftar wishlist
        // keterangan remove adalah menghapus satu data barang berdasarkan id

    }

    // Menghapus semua barang yang ada di dalam cart
    public function destroyAll()
    {
        Cart::instance('cart')->destroy();
        $this->emitTo('cart-count-component','refreshComponent');
        // emitTo untuk menghubungkan ke beberapa halaman
        // contoh cart-count-component yaitu menghubungkan ke dalam view halaman tersebut
        // contoh refreshComponent yaitu menghubungkan ke dalam controller CartCountComponent sekaligus untuk merefresh halaman jika data product dimasukan ke dalam daftar cart
        session()->flash('success_message','Semua Data Barang Telah Terhapus');

        // keterangan instance untuk contoh data barang yang di simpan ke dalam daftar wishlist
        // keterangan destroy adalah menghapus semua data barang

    }

    // Mengalokasikan data product ke dalam daftar simpan untuk nanti
    public function switchToSaveForLater($rowId)
    {
        $item = Cart::instance('cart')->get($rowId); // mengambil data product berdasarkan idnya
        Cart::instance('cart')->remove($rowId); // menghapus data product yang ada di keranjang pada saat memindahkan product ke daftar simpan untuk nanti
        Cart::instance('simpanUntukNanti')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        // keterangan instance adalah menyimpan data barang hanya sebagai contoh di daftar wishlist (sementara)
        // keterangan add adalah menyimpan data barang hanya sebagai data barang yang akan di beli pada daftar keranjang (sementara)
        // keterangan associate adalah menghubungkan ke dalam model
        // keterangan cart adalah menggunakan library cart untuk e-commerce

        $this->emitTo('cart-count-component','refreshComponent');
        // emitTo untuk menghubungkan ke beberapa halaman
        // contoh cart-count-component yaitu menghubungkan ke dalam view halaman tersebut
        // contoh refreshComponent yaitu menghubungkan ke dalam controller CartCountComponent sekaligus untuk merefresh halaman jika data product dimasukan ke dalam daftar cart
        session()->flash('success_message','Product berhasil di daftar simpan untuk nanti');
    }

    // memindahkan data product dari daftar simpan untuk nanti ke dalam keranjang
    public function moveToCart($rowId)
    {
        $item = Cart::instance('simpanUntukNanti')->get($rowId); // mengambil data product berdasarkan idnya
        Cart::instance('simpanUntukNanti')->remove($rowId); // menghapus data product yang ada di daftar simpan untuk nanti pada saat memindahkan product ke keranjang
        Cart::instance('cart')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        // keterangan instance adalah menyimpan data barang hanya sebagai contoh di daftar wishlist (sementara)
        // keterangan add adalah menyimpan data barang hanya sebagai data barang yang akan di beli pada daftar keranjang (sementara)
        // keterangan associate adalah menghubungkan ke dalam model
        // keterangan cart adalah menggunakan library cart untuk e-commerce

        $this->emitTo('cart-count-component','refreshComponent');
        // emitTo untuk menghubungkan ke beberapa halaman
        // contoh cart-count-component yaitu menghubungkan ke dalam view halaman tersebut
        // contoh refreshComponent yaitu menghubungkan ke dalam controller CartCountComponent sekaligus untuk merefresh halaman jika data product dimasukan ke dalam daftar cart
        session()->flash('s_success_message','Product berhasil di pindahkan ke dalam keranjang');
    }

    // Menghapus data product di daftar simpan untuk nanti
    public function deleteFromSaveFromLater($rowId)
    {
        Cart::instance('simpanUntukNanti')->remove($rowId);
        // keterangan instance adalah menyimpan data barang hanya sebagai contoh di daftar wishlist (sementara)
        // keterangan remove yaitu menghapus data product yang ada di daftar simpan untuk nanti
        session()->flash('s_success_message','Product berhasil terhapus dari daftar simpan untuk nanti');
    }

    // untuk mengkonfirmasi apakah kupon yang di isi ada atau tidak di daftar data kupon di tabel coupon
    public function applyCouponCode()
    {
        $coupon = Coupon::where('code',$this->couponCode)->where('expiry_date','>=',Carbon::today())->where('cart_value','<=',Cart::instance('cart')->subtotal())->first();
        // keterangan Coupon::where adalah mengambil satu data coupon berdasarkan coupon yang di pilih
        // keterangan where('cart_value','<=',Cart::instance('cart')->subtotal())->first(); adalah menyimpan data harga sementara setelah di hitung pemotongan harga 
        if(!$coupon)
        {
            session()->flash('coupon_message','Kode kupon tidak sah');
            return;
        }
        // if(!$coupon) untuk memberitahu kode kupon yang dimasukan tidak sah

        session()->put('coupon',[
            'code' => $coupon->code,
            'type' => $coupon->type,
            'value' => $coupon->value,
            'cart_value' => $coupon->cart_value
        ]);
    }

    // Digunakan untuk menghitung pemotongan harga setelah mendapat diskon pada barang
    public function calculateDiscounts()
    {
        if(session()->has('coupon'))
        {
            if(session()->get('coupon')['type'] == 'fixed')
            {
                $this->discount = session()->get('coupon')['value'];
            }
            else
            {
                $this->discount = (Cart::instance('cart')->subtotal() * session()->get('coupon')['value'])/100;
            }
            $this->subtotalAfterDiscount = Cart::instance('cart')->subtotal() - $this->discount;
            $this->taxAfterDiscount = ($this->subtotalAfterDiscount * config('cart.tax'))/100; // config('cart.tax')) adalah menghubungakn ke dalam folder config pada file cart bagian tax data
            $this->totalAfterDiscount = $this->subtotalAfterDiscount +$this->taxAfterDiscount;
        }
        // keterangan session()->get('coupon')['type'] == 'fixed' adalah mengetahui kupon yang dimasukan fixed (kupon asli atau tidak)
    }

    // untuk menghapus data coupon yang telah di input
    public function removeCoupon()
    {
        session()->forget('coupon');
    }

    // memproses pembelian barang (mencegah)
    // jika sudah login maka akan masuk ke dalam halaman checkout
    // jika belum login maka akan masuk ke dalam halaman login
    public function checkout()
    {
        if(Auth::check())
        {
            return redirect()->route('checkout');
        }
        else
        {
            return redirect()->route('login');
        }
    }

    // untuk menyimpan history data barang belanja jika belum melakukan login yang nanti setelah login history data barang belanja akan muncul kembali
    public function setAmountForCheckout()
    {
        // untuk menghitung berapa banyak barang di cart (keranjang) yang nanti akan di hapus semuanya
        if(!Cart::instance('cart')->count() > 0)
        {
            session()->forget('checkout');
            return;
        }

        if(session()->has('coupon'))
        {
            session()->put('checkout',[
                'discount' => $this->discount,
                'subtotal' => $this->subtotalAfterDiscount,
                'tax' => $this->taxAfterDiscount,
                'total' => $this->totalAfterDiscount
            ]);
        }
        else
        {
            session()->put('checkout',[
                'discount' => 0,
                'subtotal' => Cart::instance('cart')->subtotal(),
                'tax' => Cart::instance('cart')->tax(),
                'total' => Cart::instance('cart')->total()
            ]);
        }
    }

    public function render()
    {
        if(session()->has('coupon'))
        {
            if(Cart::instance('cart')->subtotal() < session()->get('coupon')['cart_value'])
            {
                session()->forget('coupon');
            }
            else
            {
                $this->calculateDiscounts();
            }
        }
        // untuk menampilkan kalkulasi perhitungan pemotongan harga pada barang jika mendapatan diskon
        
        // Untuk menyimpan history penyimpanan barang di keranjang
        if(Auth::check())
        {
            Cart::instance('cart')->store(Auth::user()->email);
        }

        $this->setAmountForCheckout(); // menyimpan proses konfigurasi history data pembelian dari fungsi setAmountForCheckout
        return view('livewire.cart-component')->layout("layouts.base");
        // halaman view cart-component
    }
}

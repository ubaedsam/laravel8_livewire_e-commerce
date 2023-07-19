<?php

namespace App\Http\Livewire;

use App\Mail\OrderMail;
use Livewire\Component;
use App\Models\Shipping;
use App\Models\OrderItem;
use App\Models\Transaction;
use App\Http\Livewire\Exception;
use Illuminate\Support\Facades\Mail;
use Stripe; // library untuk pembayara kartu kredit stripe
use App\Models\Order; // Menghubungkan ke dalam model order
use Illuminate\Support\Facades\Auth; // Menggunakan library Auth
use Gloudemans\Shoppingcart\Facades\Cart; // Menggunakan library cart untuk belanja

class CheckoutComponent extends Component
{
    public $ship_to_different; // agar form untuk input data shipper address bisa di muncul hilangkan

    // Data yang di simpan

    // untuk billing address
    public $firstname;
    public $lastname;
    public $email;
    public $mobile;
    public $line1;
    public $line2;
    public $city;
    public $province;
    public $country;
    public $zipcode;

    // untuk shipping address
    public $s_firstname;
    public $s_lastname;
    public $s_email;
    public $s_mobile;
    public $s_line1;
    public $s_line2;
    public $s_city;
    public $s_province;
    public $s_country;
    public $s_zipcode;

    // untuk metode pembayaran
    public $paymentmode;
    public $thankyou;

    public $card_no;
    public $exp_month;
    public $exp_year;
    public $cvc;

    // proses validasi data untuk menambah data
    public function updated($fields)
    {
        // Untuk billing
        $this->validateOnly($fields, [
            'firstname' => 'required',
            'lastname'  => 'required',
            'email' => 'required|email',
            'mobile'    => 'required|numeric',
            'line1' => 'required',
            'line2' => 'required',
            'city'  => 'required',
            'province'  => 'required',
            'country'   => 'required',
            'zipcode'   => 'required',
            'paymentmode' => 'required'
        ]);

        // Untuk shipping
        if($this->ship_to_different)
        {
            $this->validateOnly($fields,[
                's_firstname' => 'required',
                's_lastname'  => 'required',
                's_email' => 'required|email',
                's_mobile'    => 'required|numeric',
                's_line1' => 'required',
                's_line2' => 'required',
                's_city'  => 'required',
                's_province'  => 'required',
                's_country'   => 'required',
                's_zipcode'   => 'required'
            ]);
        }

        // untuk metode pembayaran lewat card (kartu kredit)
        if($this->paymentmode == 'card')
        {
            $this->validateOnly($fields,[
                'card_no' => 'required|numeric',
                'exp_month' => 'required|numeric',
                'exp_year' => 'required|numeric',
                'cvc' => 'required|numeric'
            ]);
        }
    }

    // Proses menyimpan data pembelian di tabel order dan tabel order_item
    public function placeOrder()
    {
        // menyimpan data ke dalam tabel order
        // proses validasi data billing untuk menambah data
        $this->validate([
            'firstname' => 'required',
            'lastname'  => 'required',
            'email' => 'required|email',
            'mobile'    => 'required|numeric',
            'line1' => 'required',
            'line2' => 'required',
            'city'  => 'required',
            'province'  => 'required',
            'country'   => 'required',
            'zipcode'   => 'required',
            'paymentmode' => 'required'
        ]);

        // untuk metode pembayaran lewat card (kartu kredit)
        if($this->paymentmode == 'card')
        {
            $this->validate([
                'card_no' => 'required|numeric',
                'exp_month' => 'required|numeric',
                'exp_year' => 'required|numeric',
                'cvc' => 'required|numeric'
            ]);
        }

        $order = new Order();
        $order->user_id = Auth::user()->id;
        $order->subtotal = session()->get('checkout')['subtotal'];
        $order->discount = session()->get('checkout')['discount'];
        $order->tax = session()->get('checkout')['tax'];
        $order->total = session()->get('checkout')['total'];
        $order->firstname = $this->firstname;
        $order->lastname = $this->lastname;
        $order->email = $this->email;
        $order->mobile = $this->mobile;
        $order->line1 = $this->line1;
        $order->line2 = $this->line2;
        $order->city = $this->city;
        $order->province = $this->province;
        $order->country = $this->country;
        $order->zipcode = $this->zipcode;
        $order->status = 'ordered';
        $order->is_shipping_different = $this->ship_to_different ? 1:0;
        $order->save(); // Proses menyimpan data ke dalam tabel order

        // menyimpan data ke dalam tabel order_item
        foreach(Cart::instance('cart')->content() as $item)
        {
            $orderItem = new OrderItem();
            $orderItem->product_id = $item->id;
            $orderItem->order_id = $order->id;
            $orderItem->price = $item->price;
            $orderItem->quantity = $item->qty;
            if($item->options)
            {
                $orderItem->options = serialize($item->options);
            }
            $orderItem->save(); // Proses menyimpan data ke dalam tabel order_item
        }

        if($this->ship_to_different)
        {
            // proses validasi data shipping untuk menambah data
            $this->validate([
            's_firstname' => 'required',
            's_lastname'  => 'required',
            's_email' => 'required|email',
            's_mobile'    => 'required|numeric',
            's_line1' => 'required',
            's_line2' => 'required',
            's_city'  => 'required',
            's_province'  => 'required',
            's_country'   => 'required',
            's_zipcode'   => 'required'
            ]);

            // Konfigurasi data yang di simpan ke dalam tabel sebagai data baru
            $shipping = new Shipping();
            $shipping->order_id = $order->id;
            $shipping->firstname = $this->s_firstname;
            $shipping->lastname = $this->s_lastname;
            $shipping->email = $this->s_email;
            $shipping->mobile = $this->s_mobile;
            $shipping->line1 = $this->s_line1;
            $shipping->line2 = $this->s_line2;
            $shipping->city = $this->s_city;
            $shipping->province = $this->s_province;
            $shipping->country = $this->s_country;
            $shipping->zipcode = $this->s_zipcode;
            $shipping->save();
        }

        // pilihan metode pembayaran
        if($this->paymentmode == 'cod')
        {
            // untuk cod (cash on delivery atau bayar di tempat)
            $this->makeTransaction($order->id,'pending'); // untuk memanggil fungsi makeTransaction
            $this->resetCart();
        }
        else if($this->paymentmode == 'card')
        {
            // untuk card (pembayaran lewat kartu kredit)
            $stripe = Stripe::make(env('STRIPE_KEY')); // untuk mengambil kunci api Stripe pada file ,env

            try{
                $token = $stripe->tokens()->create([
                    'card' => [
                        'number' => $this->card_no,
                        'exp_month' => $this->exp_month,
                        'exp_year' => $this->exp_year,
                        'cvc' => $this->cvc
                    ]
                ]);

                if(!isset($token['id']))
                {
                    session()->flash('stripe_error','The stripe token was not generated correctly');
                    $this->thankyou = 0;
                }

                $customer = $stripe->customers()->create([
                    'name' => $this->firstname . ' ' . $this->lastname,
                    'email' => $this->email,
                    'phone' => $this->mobile,
                    'address' => [
                        'line1' => $this->line1,
                        'postal_code' => $this->zipcode,
                        'city' => $this->city,
                        'state' => $this->province,
                        'country' => $this->country
                    ],
                    'shipping' => [
                        'name' => $this->firstname . ' ' . $this->lastname,
                        'address' => [
                            'line1' => $this->line1,
                            'postal_code' => $this->zipcode,
                            'city' => $this->city,
                            'state' => $this->province,
                            'country' => $this->country
                        ],
                    ],
                    'source' => $token['id']
                ]);

                $charge = $stripe->charges()->create([
                    'customer' => $customer['id'],
                    'currency' => 'USD',
                    'amount' => session()->get('checkout')['total'],
                    'description' => 'Payment for order no ' . $order->id
                ]);

                if($charge['status'] == 'succeeded')
                {
                    $this->makeTransaction($order->id,'approved');
                    $this->resetCart();
                }
                else
                {
                    session()->flash('stripe_error','Error in Transaction!');
                    $this->thankyou = 0;
                }
            } catch(Exception $e){
                session()->flash('stripe_error',$e->getMessage());
                $this->thankyou = 0;
            }

        }
        $this->sendOrderConfirmationMail($order); // memanggil fungsi class proses sendOrderConfirmationMail($order)
        
    }

    public function resetCart()
    {
        // Setelah melakukan pembelian maka barang yang ada di dalam cart (keranjang) akan terhapus semuanya
        $this->thankyou = 1;
        Cart::instance('cart')->destroy();
        session()->forget('checkout');
    }

    // konfigurasi fungsi untuk metode pembayaran
    public function makeTransaction($order_id, $status)
    {
        // satu metode pembayaran
        // $transaction = new Transaction(); // Transaksi baru
        // $transaction->user_id = Auth::user()->id; // Data user yang memesan
        // $transaction->order_id = $order->id; // Order data pemesanan ke berapa berdasarkan id
        // $transaction->mode = 'cod'; // pilihan metode pembayaran yaitu COD
        // $transaction->status = 'pending'; // status pembelian pending (dalam proses)
        // $transaction->save(); // menyimpan data ke dalam tabel transaction

        // banyak metode pembayaran
        $transaction = new Transaction(); // Transaksi baru
        $transaction->user_id = Auth::user()->id; // Data user yang memesan
        $transaction->order_id = $order_id; // Order data pemesanan ke berapa berdasarkan id
        $transaction->mode = $this->paymentmode; // pilihan metode pembayaran
        $transaction->status = $status; // status pembelian pending (dalam proses)
        $transaction->save(); // menyimpan data ke dalam tabel transaction
    }

    // mengirim pesan konfirmasi pemesanan ke email pelanggan setelah pelanggan melakukan pembelian barang/product
    public function sendOrderConfirmationMail($order)
    {
        Mail::to($order->email)->send(new OrderMail($order));
    }

    // Untuk memverifikasi atau mengecek user yang sedang melakukan proses pembelian barang
    public function verifyForCheckout()
    {
        if(!Auth::check())
        {
            return redirect()->route('login'); // jika beli barang akan tetapi belum login maka akan di alihkan ke halaman login terlebih dahulu
        }
        else if($this->thankyou)
        {
            return redirect()->route('thankyou'); // jika beli barang sudah melakukan login maka halaman akan berganti ke halaman thank you (yang berarti pembelian sukses)
        }
        else if(!session()->get('checkout'))
        {
            return redirect()->route('product.cart');
        }
    }

    public function render()
    {
        $this->verifyForCheckout(); // untuk menampilkan verifikasi pada sistem checkout (pembelian barang)
        return view('livewire.checkout-component')->layout('layouts.base');
    }
}

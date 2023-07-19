<?php

namespace App\Http\Livewire\Admin;

use App\Models\Coupon; // menghubungkan ke dalam model coupon
use Livewire\Component;

class AdminAddCouponComponent extends Component
{
    // Data yang disimpan
    public $code;
    public $type;
    public $value;
    public $cart_value;
    public $expiry_date;

    // proses validasi data untuk menambah data
    public function updated($fields)
    {
        $this->validateOnly($fields,[
            'code' => 'required|unique:coupons',
            'type' => 'required',
            'value' => 'required|numeric',
            'cart_value' => 'required|numeric',
            'expiry_date' => 'required'
        ]);
    }

    // proses menambah data untuk menyimpan pada tabel coupon di dalam database
    public function storeCoupon()
    {
        // proses validasi data untuk menambah data
        $this->validate([
            'code' => 'required|unique:coupons',
            'type' => 'required',
            'value' => 'required|numeric',
            'cart_value' => 'required|numeric',
            'expiry_date' => 'required'
        ]);

        $coupon = new Coupon();
        $coupon->code = $this->code;
        $coupon->type = $this->type;
        $coupon->value = $this->value;
        $coupon->cart_value = $this->cart_value;
        $coupon->expiry_date = $this->expiry_date;
        $coupon->save();
        session()->flash('message','Coupon berhasil di tambahkan!');
    }

    public function render()
    {
        return view('livewire.admin.admin-add-coupon-component')->layout('layouts.base');
    }
}

<?php

namespace App\Http\Livewire\Admin;

use App\Models\Coupon;
use Livewire\Component;

class AdminCouponsComponent extends Component
{
    // menghapus data coupon berdasarkan id couponnya
    public function deleteCoupon($coupon_id)
    {
        $coupon = Coupon::find($coupon_id); // mengambil data coupon berdasarkan idnya
        $coupon->delete(); // menghapus
        session()->flash('message','Kupon berhasil dihapus!');
    }

    public function render()
    {
        $coupons = Coupon::all(); // Mengambil semua data dari tabel coupons
        return view('livewire.admin.admin-coupons-component',['coupons'=>$coupons])->layout('layouts.base');
    }
}

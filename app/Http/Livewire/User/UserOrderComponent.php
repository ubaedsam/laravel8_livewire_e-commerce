<?php

namespace App\Http\Livewire\User;

use App\Models\Order;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class UserOrderComponent extends Component
{
    public function render()
    {
        $orders = Order::where('user_id',Auth::user()->id)->paginate(12); // menampilkan data daftar order (pemesanan) berdasarkan pengguna yang belanja
        
        return view('livewire.user.user-order-component',['orders'=>$orders])->layout('layouts.base');
    }
}

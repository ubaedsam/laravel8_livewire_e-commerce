<?php

namespace App\Http\Livewire\User;

use App\Models\Order;
use Livewire\Component;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class UserOrderDetailsComponent extends Component
{
    public $order_id;

    // menampilkan data order berdasarkan order idnya
    public function mount($order_id)
    {
        $this->order_id = $order_id;
    }

    // Untuk membatalkan pesanan barang berdasarkan order idnya
    public function cancelOrder()
    {
        $order = Order::find($this->order_id);
        $order->status = "canceled";
        $order->canceled_date = DB::raw('CURRENT_DATE');
        $order->save();
        session()->flash('order_message','Pesanan berhasil dibatalkan');
    }

    public function render()
    {
        $order = Order::where('user_id',Auth::user()->id)->where('id',$this->order_id)->first(); // menampilkan data pertama order (pemesanan) berdasarkan pengguna yang belanja dari data lengkap pertama yang di pilih

        return view('livewire.user.user-order-details-component',['order'=>$order])->layout('layouts.base');
    }
}

<?php

namespace App\Http\Livewire\Admin;

use App\Models\Order;
use Livewire\Component;
use Illuminate\Support\Facades\DB;

class AdminOrderComponent extends Component
{
    // Untuk merubah status pembelian barang
    public function updateOrderStatus($order_id, $status)
    {
        $order = Order::find($order_id); // mengambil satu data untuk di ubah berdasarkan idnya
        $order->status = $status; // hanya status saja yang berubah
        if($status == "delivered") // Status pemesanan diterima (dalam pengiriman)
        {
            $order->delivered_date = DB::raw('CURRENT_DATE');
        }
        else if($status == "canceled") // Status pemesanan ditolak (tidak dalam pengiriman)
        {
            $order->canceled_date = DB::raw('CURRENT_DATE');
        }
        $order->save(); // menyimpan data perubahan order ke dalam tabel order
        session()->flash('order_message','Status pemesanan berhasil di ubah!');
    }

    public function render()
    {
        $orders = Order::orderBy('created_at','DESC')->paginate(12);
        return view('livewire.admin.admin-order-component',['orders'=>$orders])->layout('layouts.base');
    }
}

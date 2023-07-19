<?php

namespace App\Http\Livewire\Admin;

use Carbon\Carbon;
use App\Models\Order;
use Livewire\Component;

class AdminDashboardComponent extends Component
{
    public function render()
    {
        $orders = Order::orderBy('created_at','DESC')->get()->take(10); // mengambil semua data order berdasarkan tanggalnya secara descending (terbalik) sebanyak 10 data
        $totalSales = Order::where('status','delivered')->count(); // mengambil sekaligus menghitung total semua data order berdasarkan pelanggan (orang) yang memesan barang dengan status delivered
        $totalRevenue = Order::where('status','delivered')->sum('total'); // mengambil sekaligus menghitung total harga data order yang telah memesan barang dengan status delivered
        $todaySales = Order::where('status','delivered')->whereDate('created_at',Carbon::today())->count(); // mengambil sekaligus menghitung total semua data order berdasarkan pelanggan (orang) yang memesan barang dengan status delivered pada hari ini
        $todayRevenue = Order::where('status','delivered')->whereDate('created_at',Carbon::today())->sum('total'); // mengambil sekaligus menghitung total harga data order yang telah memesan barang dengan status delivered pada hari ini

        return view('livewire.admin.admin-dashboard-component',['orders'=>$orders,'totalSales'=>$totalSales,'totalRevenue'=>$totalRevenue,'todaySales'=>$todaySales,'todayRevenue'=>$todayRevenue])->layout('layouts.base');
    }
}

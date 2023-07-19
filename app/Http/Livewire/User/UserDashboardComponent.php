<?php

namespace App\Http\Livewire\User;

use App\Models\Order;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class UserDashboardComponent extends Component
{
    public function render()
    {
        // Mengambil semua data pesanan (order) berdasarkan data user yang telah memesan barang tersebut sebanyak 10 data
        $orders = Order::orderBy('created_at','DESC')->where('user_id',Auth::user()->id)->get()->take(10);
        // Menghitung banyaknya jumlah pengeluaran uang untuk membeli barang berdasarkan data user yang telah memesan barang tersebut
        $totalCost = Order::where('status','!=','canceled')->where('user_id',Auth::user()->id)->sum('total');
        // Menghitung perbandingan banyaknya data pesanan yang telah di batalkan berdasarkan data user yang telah memesan barang tersebut
        $totalPurchase = Order::where('status','!=','canceled')->where('user_id',Auth::user()->id)->count();
        // Menghitung banyaknya data pesanan yang statusnya telah dikirim (delivired) berdasarkan data user yang telah memesan barang tersebut
        $totalDelivered = Order::where('status','delivered')->where('user_id',Auth::user()->id)->count();
        // Menghitung banyaknya data pesanan yang statusnya telah dibatalkan (canceled) berdasarkan data user yang telah memesan barang tersebut
        $totalCanceled = Order::where('status','canceled')->where('user_id',Auth::user()->id)->count();
        
        return view('livewire.user.user-dashboard-component',['orders'=>$orders,'totalCost'=>$totalCost,'totalPurchase'=>$totalPurchase,'totalDelivered'=>$totalDelivered,'totalCanceled'=>$totalCanceled])->layout('layouts.base');
    }
}

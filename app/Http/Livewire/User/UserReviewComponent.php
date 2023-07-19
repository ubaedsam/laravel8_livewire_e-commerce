<?php

namespace App\Http\Livewire\User;

use App\Models\OrderItem;
use App\Models\Review;
use Livewire\Component;

class UserReviewComponent extends Component
{
    // Data yang di simpan
    public $order_item_id;
    public $rating;
    public $comment;

    // mengambil satu data product dari tabel order_item untuk di beri rating review
    public function mount($order_item_id)
    {
        $this->order_item_id = $order_item_id;
    }

    // validasi data
    public function updated($fields)
    {
        $this->validateOnly($fields,[
            'rating' => 'required',
            'comment' => 'required'
        ]);
    }

    // proses menambah data rating review pada product yang di beli
    public function addReview()
    {
        // proses validasi data
        $this->validate([
            'rating' => 'required',
            'comment' => 'required'
        ]);

        // proses menambah data
        $review = new Review();
        $review->rating = $this->rating;
        $review->comment = $this->comment;
        $review->order_item_id = $this->order_item_id;
        $review->save();

        $orderItem = OrderItem::find($this->order_item_id);
        $orderItem->rstatus = true;
        $orderItem->save();
        session()->flash('message','Hasil review anda berhasil di tambahkan!');
    }

    public function render()
    {
        $orderItem = OrderItem::find($this->order_item_id); // mengambil satu data product yang ingin di review berdasarkan idnya
        
        return view('livewire.user.user-review-component',['orderItem'=>$orderItem])->layout('layouts.base');
    }
}

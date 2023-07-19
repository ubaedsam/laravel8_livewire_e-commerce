<?php

namespace App\Mail;

use App\Models\Order; // Menghubungkan ke dalam model order
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderMail extends Mailable
{
    use Queueable, SerializesModels;

    public $order;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($order)
    {
        $this->order = $order;
    }

    /**
     * Build the message.
     *
     * @return $this
     */

    // Digunakan untuk isi di dalam pesan email tersebut
    public function build()
    {
        return $this->subject('Order Confirmation')->view('mails.order-mail');
    }
}

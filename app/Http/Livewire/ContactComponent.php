<?php

namespace App\Http\Livewire;

use App\Models\Contact;
use App\Models\Setting;
use Livewire\Component;

class ContactComponent extends Component
{
    // Data yang disimpan
    public $name;
    public $email;
    public $phone;
    public $comment;

    // validasi data yang disimpan pada form input
    public function updated($fields)
    {
        $this->validateOnly($fields,[
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'comment' => 'required'
        ]);
    }

    // Proses menyimpan data pesan
    public function sendMessage()
    {
        // validasi data yang disimpan
        $this->validate([
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'comment' => 'required'
        ]);

        // konfigurasi data yang disimpan sebagai data baru
        $contact = new Contact();
        $contact->name = $this->name;
        $contact->email = $this->email;
        $contact->phone = $this->phone;
        $contact->comment = $this->comment;
        $contact->save();
        session()->flash('message','Terima kasih atas pesan yang anda kirim!');
    }

    public function render()
    {
        $setting = Setting::find(1); // Mengambil satu data setting dari tabel setting

        return view('livewire.contact-component',['setting'=>$setting])->layout('layouts.base');
    }
}

<?php

namespace App\Http\Livewire\Admin;

use App\Models\Contact;
use Livewire\Component;

class AdminContactComponent extends Component
{
    public function render()
    {
        $contacts = Contact::paginate(12); // mengambil semua data dari daftar tabel contact
        // keterangan paginate untuk membatasi data yang muncul di halaman tabel sebanyak 12 data

        return view('livewire.admin.admin-contact-component',['contacts'=>$contacts])->layout('layouts.base');
    }
}

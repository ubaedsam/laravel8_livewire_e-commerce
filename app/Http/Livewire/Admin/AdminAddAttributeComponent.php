<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ProductAttribute;

class AdminAddAttributeComponent extends Component
{
    // Data yang disimpan
    public $name;

    // Proses validasi data
    public function updated($fields)
    {
        $this->validateOnly($fields,[
            "name" => "required"
        ]);
    }

    // Proses menyimpan data attribute
    public function storeAttribute()
    {
        // Proses validasi data
        $this->validate([
            "name" => "required"
        ]);

        $pattribute = new ProductAttribute();
        $pattribute->name = $this->name;
        $pattribute->save();
        session()->flash('message','Data Attribute berhasil ditambahkan');
    }

    public function render()
    {
        return view('livewire.admin.admin-add-attribute-component')->layout('layouts.base');
    }
}

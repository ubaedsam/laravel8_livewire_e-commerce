<?php

namespace App\Http\Livewire\Admin;

use App\Models\ProductAttribute;
use Livewire\Component;

class AdminEditAttributeComponent extends Component
{
    // Data yang disimpan
    public $name;
    public $attribute_id;

    // Proses mengambil data attribute yang ingin di ubah berdasarkan idnya
    public function mount($attribute_id)
    {
        $pattribute = ProductAttribute::find($attribute_id);
        $this->attribute_id = $pattribute->id;
        $this->name = $pattribute->name;
    }

    // Proses validasi data
    public function updated($fields)
    {
        $this->validateOnly($fields,[
            "name" => "required"
        ]);
    }

    // Proses mengubah data attribute
    public function updateAttribute()
    {
        // Proses validasi data
        $this->validate([
            "name" => "required"
        ]);

        $pattribute = ProductAttribute::find($this->attribute_id);
        $pattribute->name = $this->name;
        $pattribute->save();
        session()->flash('message','Data Attribute berhasil diubah');
    }

    public function render()
    {
        return view('livewire.admin.admin-edit-attribute-component')->layout('layouts.base');
    }
}

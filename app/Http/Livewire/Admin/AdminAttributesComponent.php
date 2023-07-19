<?php

namespace App\Http\Livewire\Admin;

use App\Models\ProductAttribute;
use Livewire\Component;

class AdminAttributesComponent extends Component
{
    // Proses menghapus data attribute berdasarkan id attributenya
    public function deleteAttribute($attribute_id)
    {
        $pattribute = ProductAttribute::find($attribute_id);
        $pattribute->delete();
        session()->flash('message','Data Attribute berhasil dihapus');
    }
    
    public function render()
    {
        $pattributes = ProductAttribute::paginate(10); // mengambil semua data dari tabel product attribute dengan data sebanyak 10 data di setiap halamannya
        return view('livewire.admin.admin-attributes-component',['pattributes'=>$pattributes])->layout('layouts.base');
    }
}

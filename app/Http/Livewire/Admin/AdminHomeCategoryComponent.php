<?php

namespace App\Http\Livewire\Admin;

use App\Models\Category;
use App\Models\HomeCategory;
use Livewire\Component;

class AdminHomeCategoryComponent extends Component
{
    // data yang di simpan
    public $selected_categories = [];
    public $numberofproducts;

    // proses konfigurasi mengambil data yang di pilih untuk di ubah
    public function mount()
    {
        $category = HomeCategory::find(1); // mengambil data pertama dari tabel home_category

        $this->selected_categories = explode(',',$category->sel_categories);
        $this->numberofproducts = $category->no_of_products;
    }

    // proses mengubah data untuk menyimpan pada tabel home_category di dalam database
    public function updateHomeCategory()
    {
        $category = HomeCategory::find(1);
        $category->sel_categories = implode(',',$this->selected_categories);
        $category->no_of_products = $this->numberofproducts;
        $category->save();
        session()->flash('message','HomeCategory telah berhasil di ubah');
    }

    public function render()
    {
        $categories = Category::all(); // mengambil semua data category
        return view('livewire.admin.admin-home-category-component',['categories'=>$categories])->layout('layouts.base');
    }
}

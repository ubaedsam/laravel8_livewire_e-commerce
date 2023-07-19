<?php

namespace App\Http\Livewire\Admin;

use App\Models\Category;
use App\Models\Subcategory;
use Livewire\Component;
use Livewire\WithPagination;

class AdminCategoryComponent extends Component
{

    // menghapus data category berdasarkan idnya
    public function deleteCategory($id)
    {
        $category = Category::find($id);
        $category->delete();
        session()->flash('message','Data kategori berhasil di hapus!');
    }

    // menghapus data subcategory berdasarkan idnya
    public function deleteSubcategory($id)
    {
        $scategory = Subcategory::find($id);
        $scategory->delete();
        session()->flash('message','Data Subkategori berhasil di hapus!');
    }

    public function render()
    {
        // keterangan paginate(5) membatasi data product yang muncul sebanyak 5 data di dalam 1 halaman
        $categories = Category::paginate(5);
        return view('livewire.admin.admin-category-component',['categories'=>$categories])->layout('layouts.base');
    }
}

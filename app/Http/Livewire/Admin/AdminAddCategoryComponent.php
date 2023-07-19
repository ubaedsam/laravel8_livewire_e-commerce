<?php

namespace App\Http\Livewire\Admin;

use App\Models\Category;
use App\Models\Subcategory;
use Livewire\Component;
use Illuminate\Support\Str;

class AdminAddCategoryComponent extends Component
{
    // Data yang di simpan
    public $name;
    public $slug;
    public $category_id;

    // membuat data slug kategori secara otomatis berdasarkan data nama kategori yang di isi
    public function generateslug()
    {
        $this->slug = Str::slug($this->name);
    }

    // proses validasi data untuk menambah data
    public function updated($fields)
    {
        $this->validateOnly($fields,[
            'name' => 'required',
            'slug' => 'required|unique:categories'
        ]);
    }

    // proses menambah data untuk menyimpan pada tabel category di dalam database
    public function storeCategory()
    {
        // proses validasi data untuk menambah data
        $this->validate([
            'name' => 'required',
            'slug' => 'required|unique:categories'
        ]);

        // Diberi pengecualian
        // jika data category yang disimpan ga pake parent category atau sub categorynya maka data yang di simpan akan masuk ke tabel categories
        // sebaliknya jika data category yang disimpan pake parent category atau sub category maka data yang di simpan akan masuk ke tabel subcategories
        if($this->category_id)
        {
            // menyimpan data ke dalam tabel subcategories
            $scategory = new Subcategory();
            $scategory->name = $this->name;
            $scategory->slug = $this->slug;
            $scategory->category_id = $this->category_id;
            $scategory->save();
        }
        else{
            // menyimpan data ke dalam tabel categories
            $category = new Category();
            $category->name = $this->name;
            $category->slug = $this->slug;
            $category->save();
        }
        session()->flash('message','Data kategori Baru berhasil di tambahkan!');
    }
    
    public function render()
    {
        $categories = Category::all(); // mengambil semua data category dari tabel categories

        return view('livewire.admin.admin-add-category-component',['categories'=>$categories])->layout('layouts.base');
    }
}

<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Category; // Menghubungkan ke dalam model kategori
use App\Models\Subcategory;
use Illuminate\Support\Str;

class AdminEditCategoryComponent extends Component
{
    // Data yang disimpan
    public $category_slug;
    public $category_id;
    public $name;
    public $slug;
    public $scategory_id;
    public $scategory_slug;

    // proses konfigurasi mengambil data yang di pilih untuk di ubah
    public function mount($category_slug, $scategory_slug=null)
    {
        // diberi pengecualian
        // jika data yang di ambil untuk di ubah tidak ada data subcategory maka yang muncul adalah data dari tabel category
        // sebaliknya jika data yang di ambil untuk di ubah ada data subcategory maka yang muncul adalah data dari tabel subcategory
        if($scategory_slug)
        {
            // mengambil data dari tabel subcategory
            $this->scategory_slug = $scategory_slug;
            $scategory = Subcategory::where('slug',$scategory_slug)->first();
            $this->scategory_id = $scategory->id;
            $this->category_id = $scategory->category_id;
            $this->name = $scategory->name;
            $this->slug = $scategory->slug;
        }
        else
        {
            // mengambil data dari tabel category
            $this->category_slug = $category_slug;
            $category = Category::where('slug',$category_slug)->first();
            $this->category_id = $category->id;
            $this->name = $category->name;
            $this->slug = $category->slug;
        }
    }

    // membuat data slug kategori secara otomatis berdasarkan data nama kategori yang di isi
    public function generateslug()
    {
        $this->slug = Str::slug($this->name);
    }

    // proses validasi data untuk mengubah data
    public function updated($fields)
    {
        $this->validateOnly($fields,[
            'name' => 'required',
            'slug' => 'required|unique:categories'
        ]);
    }

    // proses mengubah data untuk menyimpan pada tabel category di dalam database
    public function updateCategory()
    {
        // proses validasi data untuk mengubah data
        $this->validate([
            'name' => 'required',
            'slug' => 'required|unique:categories'
        ]);

        // Diberi pengecualian
        // jika data category yang disimpan ga pake parent category atau sub categorynya maka data yang di simpan akan masuk ke tabel categories
        // sebaliknya jika data category yang disimpan pake parent category atau sub category maka data yang di simpan akan masuk ke tabel subcategories
        if($this->scategory_id)
        {
            // menyimpan data ke dalam tabel subcategories
            $scategory = Subcategory::find($this->scategory_id);
            $scategory->name = $this->name;
            $scategory->slug = $this->slug;
            $scategory->category_id = $this->category_id;
            $scategory->save();
        }
        else
        {
            // menyimpan data ke dalam tabel categories
            $category = Category::find($this->category_id);
            $category->name = $this->name;
            $category->slug = $this->slug;
            $category->save();
        }
        session()->flash('message','Data kategori berhasil di Ubah!');
    }

    // Halaman Awal Kategori Admin
    public function render()
    {
        $categories = Category::all(); // mengambil semua data category

        return view('livewire.admin.admin-edit-category-component',['categories'=>$categories])->layout('layouts.base');
    }
}

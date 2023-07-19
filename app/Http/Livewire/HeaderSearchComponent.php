<?php

namespace App\Http\Livewire;

use App\Models\Category;
use Livewire\Component;

class HeaderSearchComponent extends Component
{

    public $search; // untuk membuat fitur search di dalam program
    public $product_cat;
    public $product_cat_id;

    // Public function mount ini adalah fitur sistem yang ada di dalam program
    public function mount()
    {
        $this->product_cat = 'All Category';
        $this->fill(request()->only('search','product_cat','product_cat_id'));
    }

    public function render()
    {
        $categories = Category::all(); // mengambil semua data di dalam model category pada tabel category
        return view('livewire.header-search-component',['categories'=>$categories]);
    }
}

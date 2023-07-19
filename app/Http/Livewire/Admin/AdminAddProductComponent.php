<?php

namespace App\Http\Livewire\Admin;

use App\Models\AttributeValue;
use App\Models\Product;
use Livewire\Component;
use Carbon\Carbon; // Library untuk file upload image
use App\Models\Category;
use App\Models\ProductAttribute;
use App\Models\Subcategory;
use Illuminate\Support\Str;
use Livewire\WithFileUploads;

class AdminAddProductComponent extends Component
{
    use WithFileUploads; // menggunakan library untuk mengupload file gambar

    // Data yang di simpan
    public $name;
    public $slug;
    public $short_description;
    public $description;
    public $regular_price;
    public $sale_price;
    public $SKU;
    public $stock_status;
    public $featured;
    public $quantity;
    public $image;
    public $category_id;
    public $images;
    public $scategory_id;

    // Untuk input data product attribute
    public $attr;
    public $inputs = [];
    public $attribute_arr = [];
    public $attribute_values;

    // Konfigurasi untuk data stock apakah in stock atau out of stock
    public function mount()
    {
        $this->stock_status = 'instock';
        $this->featured = 0;
    }

    // Untuk menambah form input data lengkap dari sebuah attribute
    public function add()
    {
        if(!in_array($this->attr,$this->attribute_arr))
        {
            array_push($this->inputs,$this->attr);
            array_push($this->attribute_arr,$this->attr);
        }
    }

    // untuk menghapus form input data lengkap dari sebuah attribute yang telah disimpan
    public function remove($attr)
    {
        unset($this->inputs[$attr]);
    }

    // membuat data slug produk secara otomatis berdasarkan data nama produk yang di isi
    public function generateSlug()
    {
        $this->slug = Str::slug($this->name,'-');
    }

    // proses validasi data untuk menambah data
    public function updated($fields)
    {
        $this->validateOnly($fields,[
            'name' => 'required',
            'slug' => 'required|unique:products',
            'short_description' => 'required',
            'description' => 'required',
            'regular_price' => 'required|numeric',
            'sale_price' => 'required',
            'SKU' => 'required',
            'stock_status' => 'required',
            'featured' => 'required',
            'quantity' => 'required|numeric',
            'image' => 'required|mimes:jpeg,png',
            'category_id' => 'required'
        ]);
    }

    // proses menambah data untuk menyimpan pada tabel product di dalam database
    public function addProduct()
    {
        // proses validasi data untuk menambah data
        $this->validate([
            'name' => 'required',
            'slug' => 'required|unique:products',
            'short_description' => 'required',
            'description' => 'required',
            'regular_price' => 'required|numeric',
            'sale_price' => 'required',
            'SKU' => 'required',
            'stock_status' => 'required',
            'featured' => 'required',
            'quantity' => 'required|numeric',
            'image' => 'required|mimes:jpeg,png',
            'category_id' => 'required'
        ]);

        $product = new Product();
        $product->name = $this->name;
        $product->slug = $this->slug;
        $product->short_description = $this->short_description;
        $product->description = $this->description;
        $product->regular_price = $this->regular_price;
        $product->sale_price = $this->sale_price;
        $product->SKU = $this->SKU;
        $product->stock_status = $this->stock_status;
        $product->featured = $this->featured;
        $product->quantity = $this->quantity;

        // untuk mengupload satu data gambar
        $imageName = Carbon::now()->timestamp. '_' . $this->image->extension();
        $this->image->storeAs('products',$imageName);
        $product->image = $imageName;

        // untuk mengupload banyak data gambar
        if($this->images)
        {
            $imagesname = '';
            foreach($this->images as $key=>$image)
            {
                $imgName = Carbon::now()->timestamp. $key . '_' . $image->extension();
                $image->storeAs('products',$imgName);
                $imagesname = $imagesname . ',' . $imgName;
            }
            $product->images = $imagesname;
        }

        $product->category_id = $this->category_id;
        if($this->scategory_id)
        {
            $product->subcategory_id = $this->scategory_id;
        }
        $product->save();

        // Untuk menyimpan data attribute pada product di tabel attribute value
        foreach($this->attribute_values as $key=>$attribute_value)
        {
            $avalues = explode(",",$attribute_value);
            foreach($avalues as $avalue)
            {
                $attr_value = new AttributeValue();
                $attr_value->product_attribute_id = $key;
                $attr_value->value = $avalue;
                $attr_value->product_id = $product->id;
                $attr_value->save(); 
            }
        }

        session()->flash('message','Data Produk Baru Berhasil Di Tambahkan');
    }

    // fungsi aksi untuk menampilkan semua opsi pilih data sub kategori pada saat memilih kategori yang mempunyai data sub kategori
    public function changeSubcategory()
    {
        $this->scategory_id = 0;
    }

    public function render()
    {
        $categories = Category::all(); // Mengambil semua data kategori
        $scategories = Subcategory::where('category_id',$this->category_id)->get(); // mengambil semua data sub kategori berdasarkan kategori idnya

        $pattributes = ProductAttribute::all(); // Mengambil semua data attribute

        return view('livewire.admin.admin-add-product-component',['categories'=>$categories,'scategories'=>$scategories,'pattributes'=>$pattributes])->layout('layouts.base');
    }
}

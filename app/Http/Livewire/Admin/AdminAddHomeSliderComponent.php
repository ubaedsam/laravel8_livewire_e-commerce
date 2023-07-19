<?php

namespace App\Http\Livewire\Admin;

use App\Models\HomeSlider;
use Livewire\Component;
use Carbon\Carbon; // Library untuk file upload image
use Illuminate\Support\Str;
use Livewire\WithFileUploads;

class AdminAddHomeSliderComponent extends Component
{
    use WithFileUploads; // menggunakan library untuk mengupload file gambar

    // Data yang ingin di simpan
    public $title;
    public $subtitle;
    public $price;
    public $link;
    public $image;
    public $status;

    // Konfigurasi untuk data status apakah inactive (tidak aktif) atau active (aktif)
    public function mount()
    {
        $this->status = 0;
    }

    // proses menambah data untuk menyimpan pada tabel home_slide di dalam database
    public function addSlide()
    {
        $slider = new HomeSlider();
        $slider->title = $this->title;
        $slider->subtitle = $this->subtitle;
        $slider->price = $this->price;
        $slider->link = $this->link;

        $imageName = Carbon::now()->timestamp. '_' . $this->image->extension();
        $this->image->storeAs('sliders',$imageName); // menyimpan data gambar ke dalam folder sliders di public -> asset -> sliders
        $slider->image = $imageName;

        $slider->status = $this->status;

        $slider->save();
        session()->flash('message','Data Slide Baru Berhasil Di Tambahkan');
    }

    public function render()
    {
        return view('livewire.admin.admin-add-home-slider-component')->layout('layouts.base');
    }
}

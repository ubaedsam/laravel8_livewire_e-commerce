<?php

namespace App\Http\Livewire\Admin;

use App\Models\HomeSlider;
use Livewire\Component;
use Carbon\Carbon; // Library untuk file upload image
use Livewire\WithFileUploads;

class AdminEditHomeSliderComponent extends Component
{
    use WithFileUploads; // menggunakan library untuk mengupload file gambar

    // Data yang ingin di simpan
    public $title;
    public $subtitle;
    public $price;
    public $link;
    public $image;
    public $status;
    public $newimage;
    public $slider_id;

    // proses konfigurasi mengambil data yang di pilih untuk di ubah
    public function mount($slide_id)
    {
        $slider = HomeSlider::find($slide_id); // mengambil data slider berdasarkan id
        $this->title = $slider->title;
        $this->subtitle = $slider->subtitle;
        $this->price = $slider->price;
        $this->link = $slider->link;
        $this->image = $slider->image;
        $this->status = $slider->status;
        $this->slider_id = $slider->id;
    }

    // proses mengubah data untuk menyimpan pada tabel home_slider di dalam database
    public function updateSlide()
    {
        $slider = HomeSlider::find($this->slider_id);
        $slider->title = $this->title;
        $slider->subtitle = $this->subtitle;
        $slider->price = $this->price;
        $slider->link = $this->link;
        if($this->newimage)
        {
            $imageName = Carbon::now()->timestamp. '_' . $this->newimage->extension();
            $this->newimage->storeAs('sliders',$imageName); // menyimpan data gambar ke dalam folder sliders di public -> asset -> sliders
            $slider->image = $imageName;
        }
        $slider->status = $this->status;
        $slider->save();
        session()->flash('message','Data Slide Berhasil Di Ubah');
    }

    public function render()
    {
        return view('livewire.admin.admin-edit-home-slider-component')->layout('layouts.base');
    }
}

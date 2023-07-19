<?php

namespace App\Http\Livewire;

use App\Models\Setting;
use Livewire\Component;

class FooterComponent extends Component
{
    public function render()
    {
        $setting = Setting::find(1); // Mengambil satu data setting dari tabel setting
        return view('livewire.footer-component',['setting'=>$setting]);
    }
}

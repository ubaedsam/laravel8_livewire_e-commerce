<?php

namespace App\Http\Livewire\User;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Livewire\Component;

class UserChangePasswordComponent extends Component
{
    // Data yang disimpan
    public $current_password; // password lama
    public $password; // password baru
    public $password_confirmation; // password baru

    // validasi data password yang disimpan pada form input password
    public function update($fields)
    {
        $this->validateOnly($fields,[
            'current_password' => 'required',
            'password' => 'required|min:8|confirmed|different:current_password'
        ]);
    }

    // proses merubah password pengguna
    public function changePassword()
    {
        // validasi data password yang disimpan
        $this->validate([
            'current_password' => 'required',
            'password' => 'required|min:8|confirmed|different:current_password'
        ]);

        // Proses konfigurasi merubah data password
        if(Hash::check($this->current_password,Auth::user()->password))
        {
            $user = User::findOrFail(Auth::user()->id);
            $user->password = Hash::make($this->password);
            $user->save();
            session()->flash('password_success','Passsword berhasil diubah!');
        }
        else
        {
            session()->flash('password_error','Password gagal diubah');
        }
    }

    public function render()
    {
        return view('livewire.user.user-change-password-component')->layout('layouts.base');
    }
}

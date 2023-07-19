<?php

namespace App\Http\Livewire\User;

use App\Models\Profile;
use App\Models\User;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class UserProfileComponent extends Component
{
    public function render()
    {
        $userProfile = Profile::where('user_id',Auth::user()->id)->first(); // mengambil data pertama profile berdasarkan user yang login
        if(!$userProfile)
        {
            $profile = new Profile();
            $profile->user_id = Auth::user()->id;
            $profile->save();
        }

        $user = User::find(Auth::user()->id); // mengambil data user berdasarkan idnya

        return view('livewire.user.user-profile-component',['user'=>$user])->layout('layouts.base');
    }
}

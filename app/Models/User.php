<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{

    protected $table = 'users';

    use Notifiable;

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username', 'email', 'password', 'level', 'fullname', 'adress', 'phone', 'dob', 'avatar','activated'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function getAllAdmin() {
        return $this->where('level', 0)->select('id')->get();
    }

    public function getInfoBasicUserById($id) {
        return $this->where('id',$id)->select('username', 'avatar')->get()->first();
    }
}

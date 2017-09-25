<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReadingLevel extends Model
{
    protected $table = 'reading_levels';

    protected $fillable = ['level', 'status'];

    public $timestamps = true;

    public function getAllLevel() {
        return $this->where('status', 1)->get();
    }
}

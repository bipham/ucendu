<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReadingVocabulary extends Model
{
    protected $table = 'reading_vocabularies';

    protected $fillable = ['name', 'content', 'status'];

    public $timestamps = true;

    public function createNewVocabulary ($type_name, $name_icon, $content) {
        $newVocabulary = new ReadingVocabulary();
        $newVocabulary->name = $type_name;
        $newVocabulary->icon = $name_icon;
        $newVocabulary->content = $content;
        $newVocabulary->save();
        return 'success';
    }

    public function getAllVocabulary() {
        return $this->get();
    }
}

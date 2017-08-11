<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReadingTypeQuestion extends Model
{
    protected $table = 'reading_type_questions';

    protected $fillable = ['name', 'introduction', 'status'];

    public $timestamps = true;

    public function getAllTypeQuestion() {
        return $this->get();
    }

    public function createNewTypeQuestion ($type_name, $introduction) {
        $newTypeQuestion = new ReadingTypeQuestion();
        $newTypeQuestion->name = $type_name;
        $newTypeQuestion->introduction = $introduction;
        $newTypeQuestion->save();
        return 'success';
    }

    public function getTypeQuestionById ($id) {
        return $this->where('id',$id)->get()->first();
    }

}

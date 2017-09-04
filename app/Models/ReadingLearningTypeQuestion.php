<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReadingLearningTypeQuestion extends Model
{
    protected $table = 'reading_learning_type_questions';

    protected $fillable = ['type_question_id', 'title_section', 'icon', 'content_section', 'status'];

    public $timestamps = true;

    public function getAllSectionByTypeQuestionId($type_question_id) {
        return $this->where('status', 1)
                    ->where('type_question_id', $type_question_id)
                    ->get();
    }

    public function createNewSectionOfTypeQuestion ($type_question_id, $title_section, $icon, $content_section) {
        $newSectionOfTypeQuestion = new ReadingLearningTypeQuestion();
        $newSectionOfTypeQuestion->type_question_id = $type_question_id;
        $newSectionOfTypeQuestion->title_section = $title_section;
        $newSectionOfTypeQuestion->icon = $icon;
        $newSectionOfTypeQuestion->content_section = $content_section;
        $newSectionOfTypeQuestion->save();
        return 'success';
    }
}

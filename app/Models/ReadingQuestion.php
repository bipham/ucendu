<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class ReadingQuestion extends Model
{
    protected $table = 'reading_questions';

    protected $fillable = ['quiz_id', 'question_id_custom', 'answer', 'keyword', 'type_question_id', 'status'];

    public $timestamps = true;

    public function addNewQuestion($quiz_id, $question_id_custom, $answer, $keyword, $type_question_id) {
        $readingQuestionModel = new ReadingQuestion();
        $readingQuestionModel->quiz_id = $quiz_id;
        $readingQuestionModel->question_id_custom = $question_id_custom;
        $readingQuestionModel->answer = $answer;
        $readingQuestionModel->keyword = $keyword;
        $readingQuestionModel->type_question_id = $type_question_id;
        $readingQuestionModel->save();
    }

    public function checkAnswerByIdCustom($question_id_custom, $answer_key) {
        $answer_extractly = $this->where('question_id_custom',$question_id_custom)->get()->pluck('answer');
        if ($answer_extractly[0] == $answer_key) {
            return true;
        }
        else return false;
    }

    public function getQuestionIdByIdCustom($question_id_custom) {
        $query = $this->where('question_id_custom',$question_id_custom)->get()->pluck('id');
        return $query[0];
    }


    public function getAllKeywordsByQuestionId($question_id) {
        return $this    ->where('status',1)
                        ->where('id', $question_id)
                        ->get()
                        ->pluck('keyword');
    }


    public function getLessonIdByQuestionId($question_id) {
        return DB::table('reading_questions')
            ->leftJoin('reading_quizzs', 'reading_questions.quiz_id', '=', 'reading_quizzs.id')
            ->where('reading_questions.id', $question_id)
            ->select(['reading_quizzs.lesson_id'])
            ->get()
            ->first();
    }

}

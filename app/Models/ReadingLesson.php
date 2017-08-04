<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class ReadingLesson extends Model
{
    protected $table = 'reading_lessons';

    protected $fillable = ['title', 'content_lesson', 'content_highlight', 'image_feature', 'status'];

    public $timestamps = true;

    public function createNewPost($title_post, $content_post, $content_highlight, $image_feature) {
        $newReadingLesson = new ReadingLesson();
        $newReadingLesson->title = $title_post;
        $newReadingLesson->content_lesson = $content_post;
        $newReadingLesson->content_highlight = $content_highlight;
        $newReadingLesson->image_feature = $image_feature;
        $newReadingLesson->save();
        return $newReadingLesson->id;
    }

    public function getPracticeNewest($number) {
        return DB::table('reading_lessons')
            ->leftJoin('reading_category_lessons', 'reading_lessons.id', '=', 'reading_category_lessons.lesson_id')
            ->leftJoin('reading_categories', 'reading_categories.id', '=', 'reading_category_lessons.cate_id')
            ->leftJoin('reading_quizzs', 'reading_lessons.id', '=', 'reading_quizzs.lesson_id')
            ->where('reading_quizzs.limit_time', '=', 0)
            ->orderBy('reading_lessons.updated_at','desc')
//            ->take($number)
            ->get();
    }

    public function getTestNewest($number) {
        return DB::table('reading_lessons')
            ->leftJoin('reading_category_lessons', 'reading_lessons.id', '=', 'reading_category_lessons.lesson_id')
            ->leftJoin('reading_categories', 'reading_categories.id', '=', 'reading_category_lessons.cate_id')
            ->leftJoin('reading_quizzs', 'reading_lessons.id', '=', 'reading_quizzs.lesson_id')
            ->where('reading_quizzs.limit_time', '>', 0)
            ->orderBy('reading_lessons.updated_at','desc')
//            ->take($number)
            ->get();
    }

    public function getPracticeNewestOfTypeQuestion($number, $type_question_id) {
        $lessons = DB::table('reading_lessons')
            ->leftJoin('reading_category_lessons', 'reading_lessons.id', '=', 'reading_category_lessons.lesson_id')
            ->leftJoin('reading_categories', 'reading_categories.id', '=', 'reading_category_lessons.cate_id')
            ->leftJoin('reading_quizzs', 'reading_lessons.id', '=', 'reading_quizzs.lesson_id')
            ->leftJoin('reading_type_question_of_quizzes', 'reading_type_question_of_quizzes.quiz_id', '=', 'reading_quizzs.id')
            ->where('reading_quizzs.type_lesson', '=', 1)
            ->where('reading_type_question_of_quizzes.type_question_id', '=', $type_question_id)
            ->where('reading_quizzs.limit_time', '=', 0)
            ->orderBy('reading_lessons.updated_at','desc')
//            ->take($number)
            ->get();
        return $lessons;
    }

     public function getTestNewestOfTypeQuestion($number, $type_question_id) {
         $lessons = DB::table('reading_lessons')
             ->leftJoin('reading_category_lessons', 'reading_lessons.id', '=', 'reading_category_lessons.lesson_id')
             ->leftJoin('reading_categories', 'reading_categories.id', '=', 'reading_category_lessons.cate_id')
             ->leftJoin('reading_quizzs', 'reading_lessons.id', '=', 'reading_quizzs.lesson_id')
             ->leftJoin('reading_type_question_of_quizzes', 'reading_type_question_of_quizzes.quiz_id', '=', 'reading_quizzs.id')
             ->where('reading_quizzs.type_lesson', '=', 1)
             ->where('reading_type_question_of_quizzes.type_question_id', '=', $type_question_id)
             ->where('reading_quizzs.limit_time', '>', 0)
             ->orderBy('reading_lessons.updated_at','desc')
//             ->take($number)
             ->get();
         return $lessons;
     }

    public function getPracticeNewestOfTypeLesson ($number, $type_lesson) {
        $lessons = DB::table('reading_lessons')
            ->leftJoin('reading_category_lessons', 'reading_lessons.id', '=', 'reading_category_lessons.lesson_id')
            ->leftJoin('reading_categories', 'reading_categories.id', '=', 'reading_category_lessons.cate_id')
            ->leftJoin('reading_quizzs', 'reading_lessons.id', '=', 'reading_quizzs.lesson_id')
            ->where('reading_quizzs.type_lesson', '=', $type_lesson)
            ->where('reading_quizzs.limit_time', '=', 0)
            ->orderBy('reading_lessons.updated_at','desc')
//            ->take($number)
            ->get();
        return $lessons;
    }

     public function getTestNewestOfTypeLesson ($number, $type_lesson) {
         $lessons = DB::table('reading_lessons')
             ->leftJoin('reading_category_lessons', 'reading_lessons.id', '=', 'reading_category_lessons.lesson_id')
             ->leftJoin('reading_categories', 'reading_categories.id', '=', 'reading_category_lessons.cate_id')
             ->leftJoin('reading_quizzs', 'reading_lessons.id', '=', 'reading_quizzs.lesson_id')
             ->where('reading_quizzs.type_lesson', '=', $type_lesson)
             ->where('reading_quizzs.limit_time', '>', 0)
             ->orderBy('reading_lessons.updated_at','desc')
//             ->take($number)
             ->get();
         return $lessons;
     }

    public function getLessonById($id) {
        return $this->where('id',$id)->get()->first();
    }
}

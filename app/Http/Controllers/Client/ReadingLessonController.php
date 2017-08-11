<?php

namespace App\Http\Controllers\Client;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ReadingLesson;
use App\Models\ReadingCategoryLesson;
use App\Models\ReadingCategory;
use App\Models\ReadingQuizz;
use App\Models\ReadingTypeQuestion;
use App\Models\ReadingTypeQuestionOfQuiz;

class ReadingLessonController extends Controller
{
    public function index()
    {
        $readingLessonModel = new ReadingLesson();
        $readingTypeQuestionOfQuizModel = new ReadingTypeQuestionOfQuiz();
        $practice_lessons = $readingLessonModel->getPracticeNewest(8);
        $test_lessons = $readingLessonModel->getTestNewest(8);
//        dd($lessons);
        return view('client.reading',compact('practice_lessons', 'test_lessons', 'readingTypeQuestionOfQuizModel'));
    }

    public function readingLessonDetail($domain, $link_lesson)
    {
//        dd($link_lesson);
        $lesson_id = getIdLessonFromLinkLesson($link_lesson);
        $readingLessonModel = new ReadingLesson();
        $lesson_detail = $readingLessonModel->getLessonById($lesson_id);
        $quizModel = new ReadingQuizz();
        $lesson_quiz = $quizModel->getQuizByLessonId($lesson_id);
        $type_lesson = $lesson_quiz->type_lesson;
        $readingTypeQuestionModel = new ReadingTypeQuestion();
        $readingTypeQuestionOfQuizModel = new ReadingTypeQuestionOfQuiz();
        if ($type_lesson == 1) {
            $type_question_id = $readingTypeQuestionOfQuizModel->getTypeQuestionIdByQuizId($lesson_quiz->id);
            $practice_lessons = $readingLessonModel->getPracticeNewestOfTypeQuestion(8, $type_question_id);
            $test_lessons = $readingLessonModel->getTestNewestOfTypeQuestion(8, $type_question_id);
            $type_question = $readingTypeQuestionModel->getTypeQuestionById($type_question_id);
        }
        else {
            $practice_lessons = $readingLessonModel->getPracticeNewestOfTypeLesson(8, $type_lesson);
            $test_lessons = $readingLessonModel->getTestNewestOfTypeLesson(8, $type_lesson);
            $type_question = '';
        }
        $readingCategoryLessonModel = new ReadingCategoryLesson();
        $readingCategoryModel = new ReadingCategory();
//dd($practice_lessons);
        return view('client.readingLessonDetail',compact('lesson_detail', 'lesson_quiz', 'practice_lessons','test_lessons', 'readingCategoryLessonModel', 'readingCategoryModel', 'type_lesson', 'type_question', 'readingTypeQuestionOfQuizModel'));
    }

    public function readingTypeQuestion($domain, $link_type_question)
    {
        $type_question_id = getIdLessonFromLinkLesson($link_type_question);
//        dd($type_question_id);
        $readingLessonModel = new ReadingLesson();
        $practice_lessons = $readingLessonModel->getPracticeNewestOfTypeQuestion(8, $type_question_id);
        $test_lessons = $readingLessonModel->getTestNewestOfTypeQuestion(8, $type_question_id);
        $readingTypeQuestionModel = new ReadingTypeQuestion();
        $type_question = $readingTypeQuestionModel->getTypeQuestionById($type_question_id);
        $readingTypeQuestionOfQuizModel = new ReadingTypeQuestionOfQuiz();
        return view('client.readingTypeQuestion',compact('practice_lessons', 'test_lessons', 'type_question', 'readingTypeQuestionOfQuizModel'));
    }

    public function readingTypeLesson($domain, $link_type_lesson)
    {
        $type_lesson_id = getIdLessonFromLinkLesson($link_type_lesson);
        $readingLessonModel = new ReadingLesson();
        $practice_lessons = $readingLessonModel->getPracticeNewestOfTypeLesson(8, $type_lesson_id);
        $test_lessons = $readingLessonModel->getTestNewestOfTypeLesson(8, $type_lesson_id);
        $readingTypeQuestionOfQuizModel = new ReadingTypeQuestionOfQuiz();
        return view('client.readingTypeLesson',compact('practice_lessons', 'test_lessons', 'type_lesson_id', 'readingTypeQuestionOfQuizModel'));
    }
}
<?php

namespace App\Http\Controllers\Admin;

//use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ReadingTypeQuestion;
use Request;

class TypeQuestionController extends Controller
{
    public function createNewTypeQuiz() {
        if (Request::ajax()) {
            $typeName = $_GET['typeName'];
            $readingTypeQuestionModel = new ReadingTypeQuestion();
            $typeId = $readingTypeQuestionModel->createNewTypeQuestion($typeName);
            return json_encode(['typeName' => $typeName, 'typeId' => $typeId]);
        }
//        return "hello";
    }

    public function getTypeQuestion() {
        if (Request::ajax()) {
            $readingTypeQuestionModel = new ReadingTypeQuestion();
            $list_type_questions = $readingTypeQuestionModel->getAllTypeQuestion();
            return json_encode(['list_type_questions' => $list_type_questions]);
        }
    }
}

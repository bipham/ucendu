<?php

namespace App\Http\Controllers\Admin;

//use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ReadingTypeQuestion;
use App\Models\ReadingLearningTypeQuestion;
use Request;

class TypeQuestionController extends Controller
{
//    public function createNewTypeQuiz() {
//        if (Request::ajax()) {
//            $typeName = $_GET['typeName'];
//            $readingTypeQuestionModel = new ReadingTypeQuestion();
//            $typeId = $readingTypeQuestionModel->createNewTypeQuestion($typeName);
//            return json_encode(['typeName' => $typeName, 'typeId' => $typeId]);
//        }
////        return "hello";
//    }

    public function getCreateNewTypeQuestion($domain) {
        $readingTypeQuestionModel = new ReadingTypeQuestion();
        $all_type_questions = $readingTypeQuestionModel->getAllTypeQuestion();
        return view('admin.readingCreateNewTypeQuestion', compact('all_type_questions'));
    }

    public function postCreateNewTypeQuestion(Request $request)
    {
        if (Request::ajax()) {
            $name_type_question = $_POST['name_type_question'];
//            $introduction_type_question = $_POST['introduction_type_question'];
            $readingTypeQuestionModel = new ReadingTypeQuestion();
            $new_type_question_id = $readingTypeQuestionModel->createNewTypeQuestion($name_type_question);
            return json_encode(['new_type_question_id' => $new_type_question_id]);
        }
    }

    public function postCreateNewSectionTypeQuestion(Request $request)
    {
        if (Request::ajax()) {
            $type_question_id = $_POST['type_question_id'];
            $title_section = $_POST['title_section'];
            $name_icon_section = $_POST['name_icon_section'];
            if ($name_icon_section == '') {
                $name_icon_section = 'fa-cog';
            }
            $content_section = $_POST['content_section'];
            $readingLearningTypeQuestionModel = new ReadingLearningTypeQuestion();
            $result = $readingLearningTypeQuestionModel->createNewSectionOfTypeQuestion($type_question_id, $title_section, $name_icon_section, $content_section);
            return json_encode(['result' => $result]);
        }
    }

    public function getTypeQuestion() {
        if (Request::ajax()) {
            $readingTypeQuestionModel = new ReadingTypeQuestion();
            $list_type_questions = $readingTypeQuestionModel->getAllTypeQuestion();
            return json_encode(['list_type_questions' => $list_type_questions]);
        }
    }
}

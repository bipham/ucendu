<?php

namespace App\Http\Controllers\Admin;

use App\Models\ReadingVocabulary;
//use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Request;

class ReadingVocabularyController extends Controller
{
    public function getCreateNewVocabulary($domain) {
        return view('admin.readingCreateNewVocabulary');
    }

    public function postCreateNewVocabulary(Request $request)
    {
        if (Request::ajax()) {
            $name_type_voca = $_POST['name_type_voca'];
            $content_type_voca = $_POST['content_type_voca'];
            $name_icon_type_vocabulary = $_POST['name_icon_type_vocabulary'];
            $readingTypeQuestionModel = new ReadingVocabulary();
            $result = $readingTypeQuestionModel->createNewVocabulary($name_type_voca, $name_icon_type_vocabulary, $content_type_voca);
            return json_encode(['result' => $result]);
        }
    }
}

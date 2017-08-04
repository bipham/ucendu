<?php

namespace App\Http\Controllers\Admin;

//use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ReadingLesson;
use App\Models\ReadingQuestion;
use App\Models\ReadingCategory;
use App\Models\ReadingQuizz;
use App\Models\ReadingCategoryLesson;
use App\Models\ReadingTypeQuestion;
use App\Models\ReadingTypeQuestionOfQuiz;
use DOMDocument;
use Illuminate\Support\Facades\File;
use Request;

class ReadingLessonController extends Controller
{
    public function getUploadReadingLesson() {
        $ques = new ReadingQuestion();
        $i_ques = $ques::orderBy('id', 'desc')->first();
        if ($i_ques == NULL) {
            $id_ques = 1;
        }
        else {
            $id_ques = $i_ques->question_id_custom + 1;
        }
        $cate = new ReadingCategory();
        $list_cate = $cate::select()->get();

        $type_quiz = new ReadingTypeQuestion();
        $list_type_quiz = $type_quiz::select()->get();

//        dd($id_ques);
        return view('admin.upPost', compact('id_ques', 'list_cate', 'list_type_quiz'));
    }

    /**
     * @param ClientUpRequest $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function postUploadReadingLesson(Request $request)
    {
        if (Request::ajax()) {
            $img_url = $_POST['img_url'];
            $img_name = $_POST['img_name'];
//            $img_extension = $_POST['img_extension'];
            $img_name = stripUnicode($img_name);
            $content_post = $_POST['content_post'];
            $content_highlight = $_POST['content_highlight'];
            $content_quiz = $_POST['content_quiz'];
            $content_answer_quiz = $_POST['content_answer_quiz'];
            $cate_selected = $_POST['cate_selected'];
            $list_answer = $_POST['list_answer'];
            $title_post = $_POST['title_post'];
            $list_type_questions = $_POST['list_type_questions'];
            $listKeyword = $_POST['listKeyword'];
            $type_lesson = $_POST['type_lesson'];
            $limit_time = $_POST['limit_time'];

            $base_to_php = explode(',', $img_url);

            $data = base64_decode($base_to_php[1]);

            $filepath = base_path() . '/storage/upload/images/img-feature/';

            if (!File::exists($filepath)) {
                File::makeDirectory($filepath, 0777, true, true);
            }

            $filename_img = base_path() . '/storage/upload/images/img-feature/' . $img_name;

            file_put_contents($filename_img, $data);

            $readingLessonModel = new ReadingLesson();
            $post_id = $readingLessonModel->createNewPost($title_post, $content_post, $content_highlight, $img_name);

//            $img_feature = new ImageFeature();
//            $img_feature->addImageFeature($post_id, $img_name, $img_url);

            $total_questions = sizeof($list_answer);
            $readingQuizzModel = new ReadingQuizz();
            $quiz_id = $readingQuizzModel->createNewQuiz($post_id, $content_quiz, $content_answer_quiz, $total_questions, $type_lesson, $limit_time);

            $readingCategoryLessonModel = new ReadingCategoryLesson();
            $readingCategoryLessonModel->addNewCatePost($post_id, $cate_selected);

            foreach ($list_answer as $qnumber => $answer) {
                $readingQuestionModel = new ReadingQuestion();
                $readingQuestionModel->addNewQuestion($quiz_id, $qnumber, $answer, $listKeyword[$qnumber], $list_type_questions[$qnumber]);

                $readingTypeQuestionOfQuizModel = new ReadingTypeQuestionOfQuiz();
                $readingTypeQuestionOfQuizModel->addNewQuizQuestion($quiz_id, $list_type_questions[$qnumber]);
            }

            return json_encode(['success' => 'success']);
        }
    }
}

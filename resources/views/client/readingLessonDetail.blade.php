<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/18/2017
 * Time: 8:30 PM
 */
//dd($practice_lessons);
?>
@extends('layout.master')
@section('meta-title')
    {!! $lesson_detail->title !!}
@endsection
@section('content')
    @include('utils.toolbarReadingLesson')

    @section('titleTypeLesson')
            {!! $lesson_detail->title !!}
    @endsection

    @section('typeLessonHeader')
        @if ($type_lesson == 1)
            <span class="badge badge-success type-lesson-header">
                {!! $type_question->name !!}
            </span>
        @elseif ($type_lesson == 2)
            <span class="badge badge-warning type-lesson-header">
               Mix Test
            </span>
        @elseif ($type_lesson == 3)
            <span class="badge badge-danger type-lesson-header">
                Full Test
            </span>
        @endif
    @endsection

    @section('readingIntro')
        <?php
        if ($type_lesson == 1):
        ?>
        {!! $type_question->introduction !!}

        <?php
        endif;
        ?>
    @endsection

    @section('readingPractice')
        <div class="container reading-page page-custom">
            <div class="list-reading-thumbnail">
                <div class="row list-lesson-thumbnail">
                    @foreach($practice_lessons as $practice_lesson)
                        @if($type_lesson == 1)
                            <?php
                            $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($practice_lesson->quiz_id);
    //                        dd($detailTypeQuestionOfQuiz);
                            ?>
                        @else
                            <?php
                            $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($practice_lesson->id);
                            //                        dd($detailTypeQuestionOfQuiz);
                            ?>
                        @endif

                        @include('utils.contentGrid',['lesson' => $practice_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz)])
                    @endforeach
                </div>
            </div>
        </div>
    @endsection

    @section('readingTest')
        <div class="container reading-page page-custom">
            <div class="list-reading-thumbnail">
                <div class="row list-lesson-thumbnail">
                    @foreach($test_lessons as $test_lesson)
                        @if($type_lesson == 1)
                            <?php
                            $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($test_lesson->quiz_id);
                            //                        dd($detailTypeQuestionOfQuiz);
                            ?>
                        @else
                            <?php
                            $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($test_lesson->id);
                            //                        dd($detailTypeQuestionOfQuiz);
                            ?>
                        @endif
                        @include('utils.contentGrid',['lesson' => $test_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz)])
                    @endforeach
                </div>
            </div>
        </div>
    @endsection

    @section('readingTestQuiz')
        <div class="container lesson-detail-page page-custom">
            <input type="hidden" name="_token" value="{!!csrf_token()!!}">
            <div class="row lesson-detail">
                <div class="col-md-6 card preview-post">
                    <div class="card-header">
                        <h3 class="text-left">
                            Noi dung Post!
                        </h3>
                    </div>
                    <div class="card-block">
                        <div id="lesson-content-area" data-lessonid="{!! $lesson_detail->id !!}">
                            {!! $lesson_detail->content_post !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6 card preview-quiz">
                    <div class="card-header">
                        <h3 class="text-left">
                            Noi dung Quiz!
                        </h3>
                    </div>
                    <div class="card-block">
                        <div id="quiz-test-area" data-quizId="{!! $lesson_quiz->id !!}">
                            {!! $lesson_quiz->content_quiz !!}
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-danger btn-submit-quiz btn-custom">
                Submit
            </button>
        </div>
    @endsection

@endsection

@section('scripts')
    <script src="{{asset('public/js/client/lessonDetail.js')}}"></script>
    <script>
        var type_lesson = <?php print_r($type_lesson); ?>;
        $(function () {
            $('#myTab a.reading-test-quiz').tab('show');
            if (type_lesson != 1) {
                $('#myTab a.reading-intro').addClass('hidden');
            }
        })
    </script>
@endsection

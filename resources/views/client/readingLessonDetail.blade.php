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
@section('css')

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
                            $quiz_id = $practice_lesson->quiz_id;
//                            dd($practice_lesson);
                            ?>
                        @else
                            <?php
                            $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($practice_lesson->id);
                            //                        dd($detailTypeQuestionOfQuiz);
                            $quiz_id = $practice_lesson->id;
                            ?>
                        @endif

                        @include('utils.contentGrid',['lesson' => $practice_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz), 'quiz_id' => $quiz_id])
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
                            $quiz_id = $test_lesson->quiz_id;
                            ?>
                        @else
                            <?php
                            $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($test_lesson->id);
                            //                        dd($detailTypeQuestionOfQuiz);
                            $quiz_id = $test_lesson->id;
                            ?>
                        @endif
                        @include('utils.contentGrid',['lesson' => $test_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz), 'quiz_id' => $quiz_id])
                    @endforeach
                </div>
            </div>
        </div>
    @endsection

    @section('readingTestQuiz')
        <div class="container lesson-detail-page page-custom">
            <input type="hidden" name="_token" value="{!!csrf_token()!!}">
            <div class="lesson-detail panel-container">
                <div class="left-panel-custom panel-left panel-top" id="lesson-content-area" data-lessonid="{!! $lesson_detail->id !!}">
                    {!! $lesson_detail->content_lesson !!}
                </div>
                <div class="splitter">
                </div>
                <div class="splitter-horizontal">
                </div>
                <div class="right-panel-custom panel-right panel-bottom @if ($lesson_quiz->limit_time == 0) active-quiz @endif" id="quiz-test-area" data-quizId="{!! $lesson_quiz->id !!}" data-limit-time="{!! $lesson_quiz->limit_time !!}">
                    {!! $lesson_quiz->content_quiz !!}
                </div>
                <div class="overlay-lesson @if ($lesson_quiz->limit_time == 0) overlay-lesson-active @endif">
                    <img src="http://ucendu.dev/public/imgs/original/cover-1.jpg" alt="Logo" class="img-overlay-quiz">
                    <div class="reading-guide-test">
                        <h4 class="reading-title-start">
                            Are you ready?
                        </h4>
                        <button type="button" class="btn btn-outline-danger btn-reading-start-test">START</button>
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
    <script src="{{asset('public/libs/countdown/jquery.countdown.js')}}"></script>
    <script>
        var type_lesson = <?php print_r($type_lesson); ?>;
        $(function () {
            $('#myTabReading a.reading-test-quiz').tab('show');
            if (type_lesson != 1) {
                $('#myTabReading a.reading-intro').addClass('hidden');
            }
            $('#myTabReading a.reading-solution-quiz').addClass('hidden');
        });

        var limit_time = <?php print_r($lesson_quiz->limit_time); ?>;
        var show_time_quiz = limit_time/60;
        if (show_time_quiz > 0) {
            $('.countdown-time').html(show_time_quiz + ' mins');
        }
        else {
            $('.countdown-time').remove();
        }

        $('.btn-reading-start-test').click(function () {
            var limit_time_quiz = new Date().getTime() + limit_time*1000;
            $('.overlay-lesson').addClass('overlay-lesson-active');
            $('.right-panel-custom').addClass('active-quiz');
            $('.countdown-time').countdown(limit_time_quiz, function(event) {
                $(this).html(event.strftime('%M:%S'))
                .on('finish.countdown', function(event) {
                    var dialog = bootbox.dialog({
                        title: 'Het thoi gian, he thong tu dong gui ket qua len trong 3s, vui long cho....',
                        message: '<p><i class="fa fa-spin fa-spinner"></i> Submitting...</p>',
    //                    size: 'large',
                        closeButton: false
                    });
                    dialog.init(function(){
                        setTimeout(function(){
                            submitReadingTest();
                        }, 3000);
                    });
                })
            });
        });
    </script>
@endsection

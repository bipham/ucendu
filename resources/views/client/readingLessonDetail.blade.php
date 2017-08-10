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
        @include('utils.readingLessonTestTools',['lesson_detail' => $lesson_detail, 'lesson_quiz' => $lesson_quiz])
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
                    <div class="reading-end-lesson end-lesson-area">
                        <h4 class="title-end-lesson">
                            --- End of the Test ---
                        </h4>
                        <h5 class="recomment-submit-lesson">
                            Please Submit to view your score, solution and explanations.
                        </h5>
                        <button type="submit" class="btn btn-danger btn-submit-modal btn-custom" data-toggle="modal" data-target="#readingSubmitQuizModal">
                            Submit
                        </button>
                        <div class="found-mistake">
                            <a href="#" class="send-mistake">
                                <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
                                Found a mistake? Let us know!
                            </a>
                        </div>
                    </div>
                </div>
                <div class="overlay-lesson @if ($lesson_quiz->limit_time == 0) overlay-lesson-active @endif">
                    <img src="http://ucendu.dev/public/imgs/original/cover-1.jpg" alt="Logo" class="img-overlay-quiz">
                    <div class="reading-guide-test">
                        <div class="badge badge-primary countdown-time-overview"></div>
                        <h4 class="reading-title-start">
                            Are you ready?
                        </h4>
                        <button type="button" class="btn btn-outline-danger btn-reading-start-test">START</button>
                    </div>
                </div>
            </div>
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
            if (show_time_quiz == 1) {
                $('.countdown-time-overview').html(show_time_quiz + ' min');
            }
            else {
                $('.countdown-time-overview').html(show_time_quiz + ' mins');
            }
        }
        else {
            $('.countdown-time-overview').remove();
        }

        $('.btn-reading-start-test').click(function () {
            var limit_time_quiz = new Date().getTime() + 3*1000;
            $('.overlay-lesson').addClass('overlay-lesson-active');
            $('.right-panel-custom').addClass('active-quiz');
            $('html,body').animate({
                scrollTop: 0
            }, 500);
            $('.countdown-time').css('display', 'block');
            $('.countdown-time').countdown(limit_time_quiz, function(event) {
                $(this).html(event.strftime('%M:%S'))
            })
                .on('finish.countdown', function(event) {
//                    console.log('aaaaa');
                    var result_quiz = getAnsweredQuestionOverview();
                    var dialog = bootbox.dialog({
                        title: 'End time!',
                        message:    '<h5 class="title-auto-submit">You answered <span class="result-test">' + result_quiz + '</span> questions</h5>' +
                                    '<p><i class="fa fa-spin fa-spinner"></i> Your result is submitting...</p>',
    //                    size: 'large',
                        closeButton: false
                    });
                    dialog.init(function(){
                        $('.menu-left-stick').addClass('hidden');
                        $('.reading-tool-lesson-quiz').addClass('hidden');
                        setTimeout(function(){
                            submitReadingTest();
                        }, 3000);
                    });

                });
            $('.reading-tool-lesson-quiz').removeClass('hidden');
        });
    </script>
@endsection

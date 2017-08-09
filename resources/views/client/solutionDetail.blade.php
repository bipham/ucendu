<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/18/2017
 * Time: 8:30 PM
 */
//dd($lesson_quiz);
?>
@extends('layout.master')
@section('meta-title')
    Solution Detail
@endsection
@section('css')
    <link rel="stylesheet" href="{{asset('public/css/client/readingSolution.css')}}">
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
                <div class="right-panel-custom panel-right panel-bottom" id="quiz-test-area" data-quizId="{!! $lesson_quiz->id !!}">
                    {!! $lesson_quiz->content_quiz !!}
                </div>
            </div>
            <button type="submit" class="btn btn-danger btn-submit-quiz btn-custom">
                Submit
            </button>
        </div>
    @endsection

    @section('readingSolutionQuiz')
        <div class="container solution-detail-page page-custom">
            <input type="hidden" name="_token" value="{!!csrf_token()!!}">
            <div class="solution-detail panel-container">
                <div class="left-panel-custom panel-left panel-top" id="lesson-highlight-area" data-lessonid="{!! $lesson_detail->id !!}">
                    {!! $lesson_detail->content_highlight !!}
                </div>
                <div class="splitter">
                </div>
                <div class="splitter-horizontal">
                </div>
                <div class="right-panel-custom panel-right panel-bottom active-quiz" id="solution-area" data-quizId="{!! $lesson_quiz->id !!}">
                    {!! $lesson_quiz->content_answer_quiz !!}
                </div>
            </div>
        </div>
    @endsection

@endsection

@section('scripts')
    <script src="{{asset('public/js/client/solutionDetail.js')}}"></script>
    <script type="text/javascript">
        var type_lesson = <?php print_r($type_lesson); ?>;
        $(function () {
            $('#myTabReading a.reading-solution-quiz').tab('show');
            $('#myTabReading a.reading-test-quiz').addClass('hidden');
            if (type_lesson != 1) {
                $('#myTabReading a.reading-intro').addClass('hidden');
            }
        });
        var correct_answers = <?php print_r(json_encode($correct_answer)); ?>;
        jQuery.each( correct_answers, function( index, correct_answer ) {
            $('.explain-area-' + correct_answer + ' .show-answer').append('<i class="fa selected-true-icon fa-check-circle-o" aria-hidden="true"></i>');
        });
        var totalQuestion = <?php print_r(json_encode($totalQuestion)); ?>;
        if (totalQuestion != 0) {
            var number_correct_answer = correct_answers.length;
            $('.result-overview').html(number_correct_answer + '/' + totalQuestion);
        }
        var list_answer = <?php print_r(json_encode($list_answer)); ?>;
        $('.question-quiz').each(function () {
            var qnumber = $(this).data('qnumber');
            var qorder = $(this).attr('name');
            qorder = qorder.match(/\d+/);
            var answer_key = list_answer[qnumber];
            if ($(this).hasClass('question-radio')) {
                if (answer_key) {
                    $('input[value=' + answer_key + '].question-' + qorder,'#pr-quiz').prop( "checked", true);
                }
            }
            else if ($(this).hasClass('question-checkbox')) {
                if (answer_key) {
                    $('input[value=' + answer_key + '].question-' + qorder,'#pr-quiz').prop( "checked", true);
                }
            }
            else if ($(this).hasClass('question-input')) {
                if (answer_key) {
                    $(this).val(answer_key);
                }
            }
            else if ($(this).hasClass('question-select')) {
                if (answer_key) {
                    $(this).val(answer_key);;
                }
            }
        });
    </script>
@endsection

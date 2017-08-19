<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 8/16/2017
 * Time: 3:42 PM
 */
?>

@extends('layout.master')
@section('meta-title')
    Solution Detail
@endsection
@section('css')
    <link rel="stylesheet" href="{{asset('public/css/client/readingSolution.css')}}">
@endsection
@section('content')
    {{--@include('utils.toolbarReadingLesson')--}}

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
                        if (array_key_exists($practice_lesson->lesson_id, $highest_result)) {
                            $highest_result_reading = $highest_result[$practice_lesson->lesson_id];
                        }
                        else {
                            $highest_result_reading = 99999;
                        }
                        ?>
                    @else
                        <?php
                        $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($practice_lesson->id);
                        //                        dd($detailTypeQuestionOfQuiz);
                        $quiz_id = $practice_lesson->id;
                        if (array_key_exists($practice_lesson->lesson_id, $highest_result)) {
                            $highest_result_reading = $highest_result[$practice_lesson->lesson_id];
                        }
                        else {
                            $highest_result_reading = 99999;
                        }
                        ?>
                    @endif

                    @include('utils.contentGrid',['lesson' => $practice_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz), 'quiz_id' => $quiz_id, 'highest_result_reading' => $highest_result_reading])
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
                        if (array_key_exists($test_lesson->lesson_id, $highest_result)) {
                            $highest_result_reading = $highest_result[$test_lesson->lesson_id];
                        }
                        else {
                            $highest_result_reading = 99999;
                        }
                        ?>
                    @else
                        <?php
                        $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($test_lesson->id);
                        //                        dd($detailTypeQuestionOfQuiz);
                        $quiz_id = $test_lesson->id;
                        if (array_key_exists($test_lesson->lesson_id, $highest_result)) {
                            $highest_result_reading = $highest_result[$test_lesson->lesson_id];
                        }
                        else {
                            $highest_result_reading = 99999;
                        }
                        ?>
                    @endif
                    @include('utils.contentGrid',['lesson' => $test_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz), 'quiz_id' => $quiz_id, 'highest_result_reading' => $highest_result_reading])
                @endforeach
            </div>
        </div>
    </div>
@endsection

@section('readingTestQuiz')

@endsection

@section('readingSolutionQuiz')
    <div class="container solution-detail-page page-custom">
        @include('utils.readingOnlySolutionDetailTable', ['lesson_quiz' => $lesson_quiz])
        <input type="hidden" name="_token" value="{!!csrf_token()!!}">
        <h4 class="title-solution-detail-section">
            Solution Detail
        </h4>
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
    <script src="{{asset('public/libs/chart/Chart.min.js')}}"></script>
    <script type="text/javascript">
        var type_lesson = <?php print_r($type_lesson); ?>;
        $(function () {
            $('#myTabReading a.reading-solution-quiz').tab('show');
            $('#myTabReading a.reading-test-quiz').addClass('hidden');
            if (type_lesson != 1) {
                $('#myTabReading a.reading-intro').addClass('hidden');
            }
        });
        $('.result-overview').hide();

        $('.question-quiz').each(function () {
            var qnumber = $(this).data('qnumber');
            var qorder = $(this).attr('name');
            var solution_key = $('.explain-area-' + qnumber + ' .key-answer').html();
            qorder = qorder.match(/\d+/);
            $('.view-solution-question-' + qorder).html(solution_key);
        });
    </script>
@endsection
<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 8/4/2017
 * Time: 1:39 PM
 */
//dd($type_question->introduction);
?>
@extends('layout.master')
@section('meta-title')
    {!! $type_question->name !!}
@endsection
@section('content')
    {{--@include('utils.toolbarReadingLesson')--}}

    @section('typeLessonHeader')
        <span class="badge badge-success type-lesson-header">
            {!! $type_question->name !!}
        </span>
    @endsection

@section('readingIntro')
    {!! $type_question->introduction !!}
@endsection

@section('readingPractice')
    <div class="container reading-page page-custom">
        <div class="list-reading-thumbnail">
            <div class="row list-lesson-thumbnail">
                @foreach($practice_lessons as $practice_lesson)
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
                    <?php
                    $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($test_lesson->quiz_id);
                    $quiz_id = $test_lesson->quiz_id;
                    if (array_key_exists($test_lesson->lesson_id, $highest_result)) {
                        $highest_result_reading = $highest_result[$test_lesson->lesson_id];
                    }
                    else {
                        $highest_result_reading = 99999;
                    }
                    ?>
                    @include('utils.contentGrid',['lesson' => $test_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz), 'quiz_id' => $quiz_id, 'highest_result_reading' => $highest_result_reading])
                @endforeach
            </div>
        </div>
    </div>
@endsection

@endsection

@section('scripts')
    <script src="{{asset('public/js/client/lessonDetail.js')}}"></script>
    <script>
        $(function () {
            $('#myTabReading a.reading-intro').tab('show');
            $('#myTabReading a.reading-test-quiz').addClass('hidden');
            $('#myTabReading a.reading-solution-quiz').addClass('hidden');
        })
    </script>
@endsection


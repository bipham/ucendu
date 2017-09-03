<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/18/2017
 * Time: 4:42 PM
 */
//var_dump($highest_result[1]);
?>
@extends('layout.master')
@section('meta-title')
    Home
@endsection

@section('banner-page')
    <div class="row-fluid header-product outer-banner-custom">
        <div class="breadcrumb-header middle-banner-custom">
            <div class="content-breadcrumb-header content-banner-custom">
                <h2 class="title-post">READING IELTS</h2>
                {{--<ol class="breadcrumb" id="path">--}}
                    {{--<li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>--}}
                    {{--<li class="breadcrumb-item"><a href="{{url('/')}}">Tin tìm mua</a></li>--}}
                    {{--<li class="breadcrumb-item"><a href="{{url('/')}}">asd</a></li>--}}
                {{--</ol>--}}
            </div>
        </div>
    </div>
@endsection
{{--@include('utils.toolbarReadingLesson')--}}

@section('titleTypeLesson')
    READING IELTS
@endsection

@section('readingIntro')

@endsection

@section('readingPractice')
    <div class="container reading-page page-custom">
        <div class="list-reading-thumbnail">
            <div class="row list-lesson-thumbnail">
                @foreach($practice_lessons as $practice_lesson)
                    <?php
                    $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($practice_lesson->id);
                    //                            dd($practice_lesson);
                    $quiz_id = $practice_lesson->id;
                    //                            dd($highest_result[$practice_lesson->lesson_id]);
                    if (array_key_exists($practice_lesson->lesson_id, $highest_result)) {
                        $highest_result_reading = $highest_result[$practice_lesson->lesson_id];
                    }
                    else {
                        $highest_result_reading = 99999;
                    }
                    ?>
                    @include('utils.contentGrid',['lesson' => $practice_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz), 'highest_result_reading' => $highest_result_reading])
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
                    @include('utils.contentGrid',['lesson' => $test_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz), 'quiz_id' => $quiz_id, 'highest_result_reading' => $highest_result_reading])
                @endforeach
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(function () {
            $('#myTabReading a.reading-intro').tab('show');
//            $('#myTabReading a.reading-intro').addClass('hidden');
            $('#myTabReading a.reading-test-quiz').addClass('hidden');
            $('#myTabReading a.reading-solution-quiz').addClass('hidden');
        })
    </script>
@endsection
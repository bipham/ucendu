<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/18/2017
 * Time: 4:42 PM
 */
//dd($lessons);
?>
@extends('layout.master')
@section('meta-title')
    Home
@endsection
@section('content')
    @include('utils.toolbarReadingLesson')

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
    //                        dd($detailTypeQuestionOfQuiz);
                            ?>
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
                            <?php
                            $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($test_lesson->id);
                            //                        dd($detailTypeQuestionOfQuiz);
                            ?>
                            @include('utils.contentGrid',['lesson' => $test_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz)])
                    @endforeach
                </div>
            </div>
        </div>
    @endsection
@endsection

@section('scripts')
    <script>
        $(function () {
            $('#myTab a.reading-practice').tab('show');
            $('#myTab a.reading-intro').addClass('hidden');
            $('#myTab a.reading-test-quiz').addClass('hidden');
        })
    </script>
@endsection
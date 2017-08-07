<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/26/2017
 * Time: 1:00 AM
 */
//dd($lessons);
//dd($test_lessons);
?>
@extends('layout.master')
@section('meta-title')
    @if($type_lesson_id == 2 )
        Mix Test
    @elseif($type_lesson_id == 3)
        Full Test
    @endif
@endsection
@section('content')
    @include('utils.toolbarReadingLesson')

    @section('typeLessonHeader')
        @if ($type_lesson_id == 1)
            <span class="badge badge-success type-lesson-header">
                        {!! $type_question->name !!}
                    </span>
        @elseif ($type_lesson_id == 2)
            <span class="badge badge-warning type-lesson-header">
                       Mix Test
                    </span>
        @elseif ($type_lesson_id == 3)
            <span class="badge badge-danger type-lesson-header">
                        Full Test
                    </span>
        @endif
    @endsection

    @section('readingPractice')
        <div class="container reading-page page-custom">
            <div class="list-reading-thumbnail">
                <div class="row list-lesson-thumbnail">
                    @foreach($practice_lessons as $practice_lesson)
                        <?php
                        $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($practice_lesson->id);
                        $quiz_id = $practice_lesson->id;
                        ?>
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
                        <?php
                        $detailTypeQuestionOfQuiz =  $readingTypeQuestionOfQuizModel->getDetailQuizByQuizId($test_lesson->id);
                        $quiz_id = $practice_lesson->id;
                        ?>
                        @include('utils.contentGrid',['lesson' => $test_lesson, 'detailTypeQuestionOfQuiz' => json_decode($detailTypeQuestionOfQuiz), 'quiz_id' => $quiz_id])
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
            $('#myTabReading a.reading-practice').tab('show');
            $('#myTabReading a.reading-test-quiz').addClass('hidden');
            $('#myTabReading a.reading-intro').addClass('hidden');
        })
    </script>
@endsection

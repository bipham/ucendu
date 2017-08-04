<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/26/2017
 * Time: 1:00 AM
 */
//dd($lessons);
?>
@extends('layout.master')
@section('meta-title')
    {!! $type_question->name !!}
@endsection
@section('content')

    @section('titleTypeLesson')
        {!! $type_question->name !!}
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
                        $cate_lesson = $readingCategoryLessonModel->getCateByLessonId($practice_lesson->id);
                        $cate = $readingCategoryModel->getCateById($cate_lesson->cate_id);
                        ?>
                        @include('utils.contentGrid',['lesson' => $practice_lesson, 'cate' => json_decode($cate)])
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
                        $cate_lesson = $readingCategoryLessonModel->getCateByLessonId($test_lesson->id);
                        $cate = $readingCategoryModel->getCateById($cate_lesson->cate_id);
                        ?>
                        @include('utils.contentGrid',['lesson' => $test_lesson, 'cate' => json_decode($cate)])
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
            $('#myTab a.reading-intro').tab('show');
//            $('#myTab a.reading-test').addClass('hidden');
        })
    </script>
@endsection

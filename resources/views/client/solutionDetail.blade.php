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
                    <div id="pr-post" data-lessonid="{!! $lesson->id !!}">
                        {!! $lesson->content_highlight !!}
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
                    <div id="pr-quiz" data-quizId="{!! $lesson_quiz->id !!}">
                        {!! $lesson_quiz->content_answer_quiz !!}
                    </div>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-danger btn-submit-quiz btn-custom">
            Submit
        </button>
    </div>
@endsection

@section('scripts')
    <script src="{{asset('public/js/client/solutionDetail.js')}}"></script>
    <script type="text/javascript">
        var correct_answer = <?php print_r(json_encode($correct_answer)); ?>;
        var totalQuestion = <?php print_r(json_encode($totalQuestion)); ?>;
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

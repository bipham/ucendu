<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 8/11/2017
 * Time: 11:24 AM
 */
?>

@extends('layout.masterNoMenu')
@section('meta-title')
    Reading - Create New Type Question
@endsection
@section('css')
    <link rel="stylesheet" href="{{asset('public/css/admin/admin-style.css')}}">
    <script src="/public/libs/ckeditor/ckeditor.js"></script>
@endsection
@section('content')
    <div class="container">
        @include('utils.message')
        {{--@include('errors.input')--}}
        <form role="form" action="{!!url('createNewTypeQuestion')!!}" method="POST">
            <input type="hidden" name="_token" value="{!!csrf_token()!!}">
            <h1 class="title-new-type-action">Create New Type Question</h1>
            <div class="form-group">
                <label for="list_type_questions">
                    Chon dạng câu hỏi!
                </label>
                <select class="form-control" id="list_type_questions" name="list_type_questions" >
                    <option value="">Chon dạng câu hỏi!</option>
                    <?php
                    foreach ($all_type_questions as $type_question):
                        echo '<option value="' . $type_question->id . '">' . $type_question->name . '</option>';
                    endforeach;
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="create_new_type_question">
                    Hoặc tạo mới dạng câu hỏi!
                </label>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-tool-type-question btn-create-new-type-question btn-custom" data-toggle="modal" data-target="#readingCreateNewTypeQuestion">
                    Create New
                    <i class="fa fa-info icon-tool-type-question" aria-hidden="true"></i>
                </button>
                <div class="modal fade" id="readingCreateNewTypeQuestion" tabindex="-1" role="dialog" aria-labelledby="readingCreateNewTypeQuestionLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="readingReviewQuizModalLabel">
                                    Create New Type Question
                                </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="type_question_name">
                                        Name of type question
                                    </label>
                                    <input type="text" class="form-control" placeholder="Name type question" id="type_question_name" name="type_question_name" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-warning btn-finish-new-type-question">
                                    Create
                                </button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="title_section">
                    Title section
                </label>
                <input type="text" class="form-control" placeholder="Title section" id="title_section" name="title_section" required>
            </div>
            <div class="form-group">
                <label for="name_icon_section">
                    Icon section
                </label>
                <input type="text" class="form-control" placeholder="fa-cog" id="name_icon_section" name="name_icon_section" required>
            </div>
            <div class="form-group">
                <label for="content_section">
                    Nội dung
                </label>
                <textarea id="content_section" rows="10" cols="80" name="content_section"></textarea>
                <script>
                    CKEDITOR.replace( 'content_section' );
                </script>
            </div>
            <button type="button" class="btn btn-warning btn-create-new-section-type-question">
                Create section
            </button>
        </form>
    </div>
@endsection

@section('scripts')
    <script src="{{asset('public/js/admin/readingNewTypeQuestion.js')}}"></script>
@endsection

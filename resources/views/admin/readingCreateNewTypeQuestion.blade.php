<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 8/11/2017
 * Time: 11:24 AM
 */
?>

@extends('layout.master')
@section('meta-title')
    Reading - Create New Type Question
@endsection
@section('css')
    <script src="/public/libs/ckeditor/ckeditor.js"></script>
@endsection
@section('content')
    <div class="container">
        @include('utils.message')
        {{--@include('errors.input')--}}
        <form role="form" action="{!!route('postCreateNewTypeQuestion')!!}" method="POST">
            <input type="hidden" name="_token" value="{!!csrf_token()!!}">
            <h1>Create New Type Question</h1>
            <div class="form-group">
                <label for="type_question_name">
                    Name of type question
                </label>
                <input type="text" class="form-control" placeholder="Name" id="type_question_name" name="type_question_name" required>
            </div>
            <div class="form-group">
                <label for="introduction_type_question">
                    Nội dung
                </label>
                <textarea id="introduction_type_question" rows="10" cols="80" name="introduction_type_question">
                    Introduction type question
                </textarea>
                <script>
                    // Replace the <textarea id="editor1"> with a CKEditor
                    // instance, using default configuration.
                    CKEDITOR.replace( 'introduction_type_question' );
                </script>
            </div>
            <button type="submit" class="btn btn-lg btn-warning">
                Create
            </button>
        </form>
    </div>
@endsection

@section('scripts')
    {{--<script src="{{asset('public/js/admin/upload.js')}}"></script>--}}
@endsection

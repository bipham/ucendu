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
    Reading - Create New Vocabulary
@endsection
@section('css')
    <link rel="stylesheet" href="{{asset('public/css/admin/admin-style.css')}}">
    <script src="/public/libs/ckeditor/ckeditor.js"></script>
@endsection
@section('content')
    <div class="container">
        @include('utils.message')
        {{--@include('errors.input')--}}
        <form role="form" action="{!!url('createNewVocabulary')!!}" method="POST">
            <input type="hidden" name="_token" value="{!!csrf_token()!!}">
            <h1 class="title-new-type-voca">Create New Type Vocabulary</h1>
            <div class="form-group">
                <label for="type_voca_name">
                    Name of type Vocabulary
                </label>
                <input type="text" class="form-control" placeholder="Name" id="type_voca_name" name="type_voca_name" required>
            </div>
            <div class="form-group">
                <label for="name_icon_type_vocabulary">
                    Name of icon
                </label>
                <input type="text" class="form-control" placeholder="Name" id="name_icon_type_vocabulary" name="name_icon_type_vocabulary" required>
            </div>
            <div class="form-group">
                <label for="content_voca">
                    Nội dung
                </label>
                <textarea id="content_voca" rows="10" cols="80" name="content_voca">
                    Content Vocabulary
                </textarea>
                <script>
                    // Replace the <textarea id="editor1"> with a CKEditor
                    // instance, using default configuration.
                    CKEDITOR.replace( 'content_voca' );
                </script>
            </div>
            <button type="button" class="btn btn-lg btn-warning btn-finish-new-type-voca">
                Create
            </button>
        </form>
    </div>
@endsection

@section('scripts')
    <script src="{{asset('public/js/admin/readingNewVocabulary.js')}}"></script>
@endsection

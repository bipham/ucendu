<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/18/2017
 * Time: 4:42 PM
 */
//var_dump($highest_result[1]);
//dd($all_vocabulary);
?>
@extends('layout.master_no_menu')
@section('meta-title')
    Vocabulary Reading
@endsection
@section('css')
    <link rel="stylesheet" href="{{asset('public/css/client/readingVocabulary.css')}}">
@endsection
@section('content')
    <div class="container">
        <div class="row">
            <ul class="nav nav-tabs flex-column col-md-2" id="myTabVocabulary" role="tablist">
                @foreach($all_vocabulary as $vocabulary)
                    <li class="nav-item tab-test-control">
                        <a class="nav-link vocabulary-{!! $vocabulary->id !!}" data-toggle="tab" href="#vocabulary{!! $vocabulary->id !!}" role="tab">
                            <div class="icon-type-voca">
                                <i class="fa fa-{!! $vocabulary->icon !!}" aria-hidden="true"></i>
                            </div>
                            <div class="name-type-voca">
                                {!! $vocabulary->name !!}
                            </div>
                        </a>
                    </li>
                @endforeach
            </ul>
            <!-- Tab panes -->
            <div class="tab-content col-md-10 content-vocabulary-area">
                @foreach($all_vocabulary as $vocabulary)
                    <div class="tab-pane" id="vocabulary{!! $vocabulary->id !!}" role="tabpanel">
                        <div class="container content-vocabulary">
                            {!! $vocabulary->content !!}
                        </div>
                    </div>
                @endforeach
            </div>
        </div><!-- /row -->
    </div><!-- /container -->
@endsection

@section('scripts')
    {{--<script src="{{asset('public/js/welcome.js')}}"></script>--}}
@endsection
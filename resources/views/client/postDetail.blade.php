<?php
/**
 * Created by PhpStorm.
 * User: nobikun1412
 * Date: 12-Jun-17
 * Time: 01:53
 */
?>
@extends('layout.master')
@section('meta-title')
    PostDetail
@endsection
@section('css')
@endsection

@section('content')
    <div class="content-breadcrumb-header content-banner-custom">
        <h2 class="title-post" style="color: red;">{!!  $dataPost->name !!}</h2>
    </div>

    <div class="container content-product-detail">
        <div class="row">
            <div class="col-md-8 col-xs-12 product-detail-custom">
                <div class="detail-desc-product-custom">
                    {!! nl2br($dataPost->content) !!}
                </div>
            </div>
            <div class="col-md-4 col-xs-12 info-basic-product-custom">
                <div class="card author-info">
                    <div class="card-header header-author-info card-header-custom">
                        <a class="fontItem" data-toggle="collapse" href="#collapseProductInfo" aria-expanded="true" aria-controls="collapseProductInfo">
                            <h5 class="header-info-custom">Đáp án câu 1</h5>
                        </a>
                    </div>
                    <div class="collapse card-block" id="collapseProductInfo">{!! $dataQuestion[0]->content !!}</div>

                </div>
                <div class="card author-info">
                    <div class="card-header header-author-info card-header-custom">
                        <a class="fontItem" data-toggle="collapse" href="#authorInfomation" aria-expanded="true" aria-controls="collapseInfo">
                            <h5 class="header-info-custom">Đáp án câu 2</h5>
                        </a>
                    </div>
                    <div class="card-block collapse" id="authorInfomation">{!! $dataQuestion[1]->content !!}</div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')

@endsection

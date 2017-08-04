<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/18/2017
 * Time: 4:45 PM
 */
?>
<div class="card col-xs-6 col-md-3 lesson-item">
    <div class="card-top-thumbnail img-thumbnail-middle">
        <div class="img-thumbnail-inner">
            <img class="img-middle-responsive" src="{{ asset('storage/upload/images/img-feature/' . $lesson->image_feature) }}" alt="IELTS">
        </div>
    </div>
    <div class="card-block card-body-product">
        <div class="name-product">
            <?php
                $title_lesson = str_replace(" ","-", $lesson->title);
            ?>
            <a href="{{route('reading.readingLesson', 'lesson' . $lesson->lesson_id . '-' . $title_lesson)}}">
                <h4 class="card-title title-product">{!! $lesson->title !!}</h4>
            </a>
        </div>
        <div class="info-cate-time-lesson">
            <span class="card-cate-product pull-left">
                <a href="#">{!! $lesson->name !!}</a>
            </span>
            <span class="time-ago-lesson pull-right">
                <?php
                    $time_ago = timeago($lesson->created_at);
                ?>
                {!! $time_ago !!}
            </span>
        </div>
        <div class="btn-lesson-overview-area">
            <span class="btn-inline">
                <a href="{{route('reading.readingLesson', 'lesson' . $lesson->lesson_id . '-' . $title_lesson)}}" class="btn btn-outline-primary">
                   <i class="fa fa-play" aria-hidden="true"></i>
                    Take Test
                </a>
            </span>
            <span class="btn-inline">
                <a href="{{route('reading.readingLesson', 'lesson' . $lesson->lesson_id . '-' . $title_lesson)}}" class="btn btn-outline-success">
                    <i class="fa fa-key" aria-hidden="true"></i>
                    Solution
                </a>
            </span>
        </div>
        @if($lesson->limit_time > 0)
            <div class="limit-time-overview">
                {!! $lesson->limit_time !!}
            </div>
        @endif
    </div>
    <div class="card-footer card-footer-product">
        <span class="type-lesson-overview pull-left">
            @if ($lesson->type_lesson == 1)
                {!! $detailTypeQuestionOfQuiz[0]->name !!}
            @elseif ($lesson->type_lesson == 2)
                Mix Test
            @elseif ($lesson->type_lesson == 3)
                Full Test
            @endif
        </span>
        <span class="btn-download-lesson pull-right">
            <a href="#" class="download-lesson">
                <i class="fa fa-download" aria-hidden="true"></i>
            </a>
        </span>
    </div>
</div>

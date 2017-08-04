<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/25/2017
 * Time: 8:29 PM
 */
?>
<div class="menu-left-stick left-position reading-menu-left">
    <div class="toolbar-inner">
        <div class="toolbar-scroll">
            <div class="open-toolbar" id="toolbar-open">
                <div class="btn-open">
                    <i class="fa fa-book" aria-hidden="true"></i>
                </div>
            </div>
            <div class="toolbar-content">
                <div class="toolbar-header">
                    <h4 class="header-toolbar">
                        Lesson Reading
                    </h4>
                </div>
                <div class="toolbar-body">
                    <div class="list-type-questions">
                        <?php
                            $readingTypeQuestionModel = new  App\Models\ReadingTypeQuestion();
                            $list_type_questions = $readingTypeQuestionModel->getAllTypeQuestion();
                            foreach ($list_type_questions as $type_question):
                            $title_type_lesson = str_replace(" ","-", $type_question->name);
                        ?>
                        <div class="item-type-question">
                            <a class="" href="{{route('reading.readingTypeLesson', 'typeLesson' . $type_question->id . '-' . $title_type_lesson)}}">
                                {!! $type_question->name !!}
                            </a>
                        </div>
                        <?php
                            endforeach;
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{--<div class="overlay"></div>--}}
</div>

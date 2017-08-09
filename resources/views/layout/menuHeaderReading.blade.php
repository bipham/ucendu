<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 7/25/2017
 * Time: 10:16 PM
 */
?>
<div class="menu-fix-custom">
    <div class="container">
        <div class="menu menu-reading">
            <ul class="nav nav-tabs" id="myTabReading" role="tablist">
                <li class="nav-item title-lesson-header">
                    <h4 class="title-type-lesson">
                        @yield('titleTypeLesson')
                    </h4>
                    @yield('typeLessonHeader')
                </li>
                <li class="nav-item tab-reading-control">
                    <a class="nav-link reading-intro" data-toggle="tab" href="#readingIntro" role="tab">Introduction</a>
                </li>
                <li class="nav-item tab-reading-control">
                    <a class="nav-link reading-practice" data-toggle="tab" href="#practice" role="tab">Practice Lessons</a>
                </li>
                <li class="nav-item tab-reading-control">
                    <a class="nav-link reading-test-lesson" data-toggle="tab" href="#readingTestLesson" role="tab">Test Lessons</a>
                </li>
                <li class="nav-item tab-reading-control">
                    <a class="nav-link reading-test-quiz" data-toggle="tab" href="#readingTestQuiz" role="tab">
                        Test Quiz
                        <div class="badge badge-danger countdown-time"></div>
                    </a>
                </li>
                <li class="nav-item tab-reading-control">
                    <a class="nav-link reading-solution-quiz" data-toggle="tab" href="#readingSolutionQuiz" role="tab">
                        Solution
                        <div class="badge badge-pill badge-info result-overview"></div>
                    </a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane" id="readingIntro" role="tabpanel">
                    @yield('readingIntro')
                </div>
                <div class="tab-pane" id="practice" role="tabpanel">
                    @yield('readingPractice')
                </div>
                <div class="tab-pane" id="readingTestLesson" role="tabpanel">
                    @yield('readingTest')
                </div>
                <div class="tab-pane" id="readingTestQuiz" role="tabpanel">
                    @yield('readingTestQuiz')
                </div>
                <div class="tab-pane" id="readingSolutionQuiz" role="tabpanel">
                    @yield('readingSolutionQuiz')
                </div>
            </div>
        </div>
    </div>
</div>

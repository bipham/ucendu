<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::pattern('nameDomain', '(www.ucendu.dev|ucendu.dev|www.ucendu.com|ucendu.com|www.ucendu.vn|ucendu.vn)');

// Authentication routes...
Route::get('login', ['as'=>'getLogin', 'uses' => 'Auth\LoginController@getLogin']);
Route::post('login',['as'=>'postLogin','uses'=>'Auth\LoginController@postLogin']);

Route::get('changePassword', ['as'=>'getChangePassword', 'uses' => 'Client\UserController@getChangePassword']);
Route::post('changePassword',['as'=>'postChangePassword','uses'=>'Client\UserController@postChangePassword']);

Route::get('getNotification/{user_id}',['as'=>'getMatchNotification','uses'=>'ReadingNotificationController@getNotification'])->middleware('auth');

Route::get('logout',['as'=>'logout','uses'=>'Auth\LoginController@getLogout'])->middleware('auth');

/*********************************************************
 *
 *                  ROUTE FOR ADMIN MODULE
 *
 *********************************************************/

Route::group(['domain' => 'admin.{nameDomain}', 'middleware' => ['adminAuth']], function () {
    Route::get('/', function () {
        return view('welcome');
    });

    Route::get('uploadReadingLesson',['as'=>'getUploadReadingLesson','uses'=>'Admin\ReadingLessonController@getUploadReadingLesson']);
    Route::post('uploadReadingLesson',['as'=>'postUploadReadingLesson','uses'=>'Admin\ReadingLessonController@postUploadReadingLesson']);

    Route::get('createNewTypeQuestion',['as'=>'getCreateNewTypeQuestion','uses'=>'Admin\TypeQuestionController@getCreateNewTypeQuestion']);
    Route::post('createNewTypeQuestion',['as'=>'postCreateNewTypeQuestion','uses'=>'Admin\TypeQuestionController@postCreateNewTypeQuestion']);

    Route::get('createNewUser',['as'=>'getCreateNewUser','uses'=>'Admin\UserController@getCreateNewUser']);
    Route::post('createNewUser',['as'=>'postCreateNewUser','uses'=>'Admin\UserController@postCreateNewUser']);

    Route::get('createNewCate',['as'=>'createNewCate','uses'=>'Admin\CateController@createNewCate']);
//    Route::get('createNewTypeQuiz',['as'=>'createNewTypeQuiz','uses'=>'Admin\TypeQuestionController@createNewTypeQuiz']);
    Route::get('getTypeQuestion',['as'=>'getTypeQuestion','uses'=>'Admin\TypeQuestionController@getTypeQuestion']);
});

/*********************************************************
 *
 *
 *                  ROUTE FOR CLIENT MODULE
 *
 *
 *
 *********************************************************/
Route::group(['domain'=>'{nameDomain}', 'middleware' => ['clientAuth']], function () {
    Route::get('/', function () {
        return view('welcome');
    });

    Route::get('showComments/{question_id_custom}',['as'=>'showComments','uses'=>'Client\CommentQuestionController@getComments']);
    Route::get('showKeywords/{question_id_custom}',['as'=>'showKeywords','uses'=>'Client\CommentQuestionController@getKeywords']);

    Route::post('enterNewComment',['as'=>'enterNewComment','uses'=>'Client\CommentQuestionController@createNewComment']);


    Route::group(['prefix'=>'reading'],function () {
        Route::get('',['as'=>'reading','uses'=>'Client\ReadingLessonController@index']);
//        Route::any('tai-khoan',                             array('as'=>'CustomerAccount',                  'uses'=>'Client\CustomerController@account'));
        Route::get('readingLesson/{lesson}',                array('as'=>'reading.readingLesson',            'uses'=>'Client\ReadingLessonController@readingLessonDetail'));
        Route::get('readingTypeQuestion/{typeQuestion}',['as'=>'reading.readingTypeQuestion','uses'=>'Client\ReadingLessonController@readingTypeQuestion']);
        Route::get('readingTypeLesson/{typeLesson}',['as'=>'reading.readingTypeLesson','uses'=>'Client\ReadingLessonController@readingTypeLesson']);
        Route::get('resultReading',['as'=>'resultReading','uses'=>'Client\ResultController@getResultQuiz']);
        Route::get('solutionLesson/{lesson_id}-{quiz_id}',['as'=>'solutionLesson','uses'=>'Client\ResultController@getSolutionLesson']);
    });
});

<?php

namespace App\Http\Controllers;

//use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\ReadingCommentNotification;
use App\Models\ReadingLesson;
use Request;

class ReadingNotificationController extends Controller
{
    public function getNotification($user_id) {
        if (Request::ajax()) {
            $readingCommentNotificationModel = new ReadingCommentNotification();
            $readingLessonModel = new ReadingLesson();
            $userModel = new User();
            $result_notifications = [];
            $list_notifications = $readingCommentNotificationModel->getAllNotificationByUserId($user_id);

            if (sizeof($list_notifications) != 0) {
                foreach ($list_notifications as $index_noti => $notificationReading) {
                    $strTimeAgo = timeago($notificationReading->updated_at);
                    $array_notification['noti_updated'] = $strTimeAgo;
                    $array_notification['read'] = $notificationReading->read;
                    $array_notification['type_noti'] = $notificationReading->type_noti;
                    $lesson_detail = $readingLessonModel->getLessonByCommentId($notificationReading->comment_id);
                    $array_notification['lesson_title'] = $lesson_detail->title;
                    $array_notification['image_lesson_feature'] = $lesson_detail->image_feature;
                    $user_detail = $userModel->getInfoBasicUserById($notificationReading->user_id);
                    $array_notification['username_cmt'] = $user_detail->username;
                    $array_notification['avatar_user'] = $user_detail->avatar;
                    array_push($result_notifications, $array_notification);
                }
            }
            return json_encode(['list_notis' => $result_notifications]);
        }
    }
}

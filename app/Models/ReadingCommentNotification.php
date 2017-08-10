<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class ReadingCommentNotification extends Model
{
    protected $table = 'reading_comment_notifications';

    protected $fillable = ['question_id', 'user_id', 'type_noti', 'read', 'read_at'];

    public $timestamps = true;

    public function createNewCommentNotification($question_id, $user_id) {
        $newCommentNotification = new ReadingCommentNotification();
        $newCommentNotification->question_id = $question_id;
        $newCommentNotification->user_id = $user_id;
        $newCommentNotification->type_noti = 'userCommentNotification';
        $newCommentNotification->save();
        return $newCommentNotification;
    }

    public function getTotalNumberCommentNotificationNoRead($user_id) {
        $total = $this->where('user_id', $user_id)
            ->where('type_noti', 'userCommentNotification')
            ->where('read', 0)
            ->get();
        return $totalStockNotiNoRead;
    }
}

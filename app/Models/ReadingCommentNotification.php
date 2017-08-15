<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;


class ReadingCommentNotification extends Model
{
    protected $table = 'reading_comment_notifications';

    protected $fillable = ['comment_id', 'user_id', 'type_noti', 'read', 'read_at', 'status'];

    public $timestamps = true;

    public function createNewCommentNotification($comment_id, $user_id) {
        $comment_noti_query = DB::table('reading_comment_notifications')    -> where('comment_id', $comment_id)
                                                                            -> where('user_id', $user_id)
                                                                            -> where('type_noti', 'userCommentNotification')
                                                                            -> count();

        if ($comment_noti_query == 0) {
            $newCommentNotification = new ReadingCommentNotification();
            $newCommentNotification->comment_id = $comment_id;
            $newCommentNotification->user_id = $user_id;
            $newCommentNotification->type_noti = 'userCommentNotification';
            $newCommentNotification->save();
        }
        else {
            DB::table('reading_comment_notifications')  -> where('comment_id', $comment_id)
                                                        -> where('user_id', $user_id)
                                                        -> where('type_noti', 'userCommentNotification')
                                                        -> update(['read' => 0, 'updated_at' => Carbon::now()]);
        }
    }

    public function getTotalNumberCommentNotificationNoRead($user_id) {
        $total = $this->where('user_id', $user_id)
            ->where('type_noti', 'userCommentNotification')
            ->where('read', 0)
            -> count();
        return $total;
    }

    public function getAllNotificationByUserId($user_id) {
        return $this->where('user_id', $user_id)
                    ->orderBy('updated_at', 'desc')
                    ->get();
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class ReadingQuestionAndAnswer extends Model
{
    protected $table = 'reading_question_and_answers';

    protected $fillable = ['question_id', 'user_id', 'reply_id', 'content_cmt', 'status'];

    public $timestamps = true;

    public function getAllCommentsByQuestionId($question_id) {
        $comments = DB::table('reading_question_and_answers')
            ->rightJoin('users', 'users.id', '=', 'reading_question_and_answers.user_id')
            ->where('reading_question_and_answers.question_id', $question_id)
            ->select(['reading_question_and_answers.*', 'username' => 'users.username', 'avatar' => 'users.avatar'])
            ->orderBy('reading_question_and_answers.updated_at','asc')
            ->get();
        return $comments;
    }

    public function createNewComment($question_id, $user_id, $reply_id, $content_cmt) {
        $newComment = new ReadingQuestionAndAnswer();
        $newComment->question_id = $question_id;
        $newComment->user_id = $user_id;
        $newComment->reply_id = $reply_id;
        $newComment->content_cmt = $content_cmt;
        $newComment->save();
        return $newComment;
    }

    public function getAllRelatedUser($question_id) {
        return DB::table('reading_question_and_answers')
            ->leftJoin('users', 'reading_question_and_answers.user_id', '=', 'users.id')
            ->where('reading_question_and_answers.question_id', $question_id)
            ->where('reading_question_and_answers.status', 1)
            ->where('users.level', 0)
            ->groupBy('reading_question_and_answers.user_id')
            ->select(['reading_question_and_answers.user_id'])
            ->get();
    }

}

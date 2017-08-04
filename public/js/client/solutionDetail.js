/**
 * Created by BiPham on 7/19/2017.
 */
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('[name="_token"]').val()
    }
});
var token = $('[name="_token"]').val();
var baseUrl = document.location.origin;
var isCreateReplyComment = false;
var isExpanded = [];

function scrollToHighlight(i) {
    // alert('Scroll to: ' + i);
    var last_highlight = $('.highlighting');
    last_highlight.removeClass('highlighting');
    last_highlight.addClass('hidden-highlight');
    $('.highlight-' + i).removeClass('hidden-highlight');
    $('.highlight-' + i).addClass('highlighting');
    var qnumber = $('#pr-post .highlight-' + i).data('qnumber');
    var idClass = 'hl-answer-' + qnumber;
    $('html,body').animate({
            scrollTop: $("#"+idClass).offset().top - 20
        }, 500);
    // $('.highlight-' + i).focus();
}

function showComments(i) {
    var ajaxUrlShowComments = 'http://ucendu.dev/showComments/' + i;
    console.log('ajaxUrlShowComments: ' + ajaxUrlShowComments);
    $.ajax({
        type: "GET",
        url: ajaxUrlShowComments,
        dataType: "json",
        // data: { list_answer: list_answer, quizId: quizId},
        success: function (data) {
            console.log('sucess:', data);
            $('#commentArea-' + i + ' .comments-area').html('');
            if (data.list_comments.length > 0) {
                jQuery.each( data.list_comments, function( index, list_comment ) {
                    var avatar = list_comment.avatar;
                    var cmt_content = list_comment.content_cmt;
                    var time_ago = list_comment.updated_at;
                    var cmt_id = list_comment.id;
                    var username = list_comment.username;
                    var reply_id = list_comment.reply_id;

                    if ((list_comment.private == 0) || (list_comment.user_id == data.user_id)) {
                        if (reply_id == 0) {
                            $('#commentArea-' + i + ' .comments-area').append('<div class="row list-cmt-area list-cmt-' + cmt_id + '" data-cmt-id="' + cmt_id + '">' +
                                '<div class="item-cmt cmt-' + cmt_id + '" id="comment' + cmt_id + '" data-cmt-id="' + cmt_id + '">'
                                + '<span class="img-avatar">'
                                + '<img alt="" src="../storage/img/users/' + avatar + '" class="img-custom avatar-custom" />'
                                + '</span>'
                                + '<span class="item-cmt-content">'
                                + '<div class="item-cmt-header">'
                                +  username
                                + '</div>'
                                + '<div class="item-cmt-body">'
                                +  cmt_content
                                + '</div>'
                                + '<div class="item-time-cmt">'
                                + '<span class="img-time-cmt">'
                                + '<img alt="time-cmt" src="../public/imgs/original/time.png" class="img-time-cmt" />'
                                + '</span>'
                                + '<span class="time-ago-cmt">'
                                + time_ago
                                + '</span>'
                                + '<span class="reply-cmt pull-right">'
                                + '<button type="button" class="btn btn-sm btn-outline-primary" onclick="replyComment(' + cmt_id + ', ' + i + ')">Reply</button>'
                                + '</span>'
                                + '</div>'
                                + '</span>'
                                + '</div>'
                                + '</div>');
                        }
                        else {
                            $('.list-cmt-' + reply_id).append('<div class="item-cmt item-sub-cmt cmt-' + cmt_id + '" id="comment' + cmt_id + '" data-cmt-id="' + cmt_id + '">'
                                + '<span class="img-avatar">'
                                + '<img alt="" src="../storage/img/users/' + avatar + '" class="img-custom avatar-custom" />'
                                + '</span>'
                                + '<span class="item-cmt-content">'
                                + '<div class="item-cmt-header">'
                                +  username
                                + '</div>'
                                + '<div class="item-cmt-body">'
                                +  cmt_content
                                + '</div>'
                                + '<div class="item-time-cmt">'
                                + '<span class="img-time-cmt">'
                                + '<img alt="time-cmt" src="../public/imgs/original/time.png" class="img-time-cmt" />'
                                + '</span>'
                                + '<span class="time-ago-cmt">'
                                + time_ago
                                + '</span>'
                                + '<span class="reply-cmt pull-right">'
                                + '<button type="button" class="btn btn-sm btn-outline-primary" onclick="replyComment(' + cmt_id + ', ' + i + ')">Reply</button>'
                                + '</span>'
                                + '</div>'
                                + '</span>'
                                + '</div>');
                        }
                    }
                });
            }
            if (jQuery.inArray(i, isExpanded) == -1) {
                isExpanded.push(i);

                var avatar = current_user.avatar;
                var username = current_user.username;
                var link = 'enterNewComment';

                $('#commentArea-' + i).append('<div class="item-reply-cmt" id="replyComment">'
                    + '<span class="img-avatar">'
                    + '<img alt="" src="../storage/img/users/' + avatar + '" class="img-custom avatar-custom" />'
                    + '</span>'
                    + '<span class="item-cmt-content">'
                    + '<div class="item-cmt-header">'
                    +  username
                    + '</div>'
                    + '<div class="item-cmt-body">'
                    + '<input type="text" class="reply-cmt reply-cmt-' + i + '" data-reply-cmt-id="0" data-question-id = "' + i + '">'
                    + '</div>'
                    + '<div class="item-time-cmt">'
                    + '</div>'
                    + '</span>'
                    + '</div>'
                    + '</div>');
            }
            var numItems = $('#commentArea-' + i + ' .comments-area .list-cmt-area').length;
            if (numItems == 0) {
                $('#commentArea-' + i + ' .comments-area').append('<p class="no-cmt">Chua co comment nao cho cau hoi nay!</p>');
            }
        },
        error: function (data) {
            console.log('Error:', data);
            bootbox.alert({
                message: "Error, please contact admin!",
                backdrop: true
            });
        }
    });
}

function showKeywords(i) {
    var ajaxUrlShowKeywords = 'http://ucendu.dev/showKeywords/' + i;
    console.log('keywords: ' + i);
    $.ajax({
        type: "GET",
        url: ajaxUrlShowKeywords,
        dataType: "json",
        // data: { list_answer: list_answer, quizId: quizId},
        success: function (data) {
            console.log('sucess:', data);
            $('#keywordArea-' + i + ' .keywords-area').html(data);
        },
        error: function (data) {
            console.log('Error:', data);
            bootbox.alert({
                message: "Error, please contact admin!",
                backdrop: true
            });
        }
    });
}

function replyComment(cmt_id, question_id) {
    var reply_id = $('.cmt-' + cmt_id).parent().data('cmt-id');
    $('input.reply-cmt-' + question_id).data('reply-cmt-id', reply_id);
    $('input.reply-cmt-' + question_id).focus();
    $('html,body').animate({
        scrollTop: $("input.reply-cmt-" + question_id).offset().top - 100
    }, 500);
}

function enterComment(e) {
    if (e.keyCode == 13) {
        var user_id = current_user.id;
        var content_cmt = $(this).val().trim();
        $(this).val('');
        var question_id_custom = $(this).data('question-id');
        var reply_id = $(this).data('reply-cmt-id');
        var ajaxUrlEnterReplyComment = baseUrl + '/enterNewComment';
        console.log('reply: ' + reply_id + ' question: ' + question_id_custom + 'content: ' + content_cmt);
        var token = $("input[name='_token']").val();
        $.ajax({
            type: "POST",
            url: ajaxUrlEnterReplyComment,
            dataType: "json",
            data: { '_token':token, user_id: user_id, content_cmt: content_cmt, question_id_custom: question_id_custom, reply_id: reply_id},
            success: function (data) {
                console.log('sucess:', data);
                var avatar = current_user.avatar;
                var time_ago = 'Just now';
                var cmt_id = data.list_comment.id;
                var username = current_user.username;
                $('p.no-cmt').remove();
                if ((data.list_comment.private == 0) || (data.list_comment.user_id == user_id)) {
                    if (reply_id == 0) {
                        $('#commentArea-' + question_id_custom + ' .comments-area').append('<div class="row list-cmt-area list-cmt-' + cmt_id + '" data-cmt-id="' + cmt_id + '">' +
                            '<div class="item-cmt cmt-' + cmt_id + '" data-cmt-id="' + cmt_id + '">'
                            + '<span class="img-avatar">'
                            + '<img alt="" src="../storage/img/users/' + avatar + '" class="img-custom avatar-custom" />'
                            + '</span>'
                            + '<span class="item-cmt-content">'
                            + '<div class="item-cmt-header">'
                            + username
                            + '</div>'
                            + '<div class="item-cmt-body">'
                            + content_cmt
                            + '</div>'
                            + '<div class="item-time-cmt">'
                            + '<span class="img-time-cmt">'
                            + '<img alt="time-cmt" src="../public/imgs/original/time.png" class="img-time-cmt" />'
                            + '</span>'
                            + '<span class="time-ago-cmt">'
                            + time_ago
                            + '</span>'
                            + '<span class="reply-cmt pull-right">'
                            + '<button type="button" class="btn btn-sm btn-outline-primary" onclick="replyComment(' + cmt_id + ', ' + question_id_custom + ')">Reply</button>'
                            + '</span>'
                            + '</div>'
                            + '</span>'
                            + '</div>'
                            + '</div>');
                    }
                    else {
                        $('.list-cmt-' + reply_id).append('<div class="item-cmt item-sub-cmt cmt-' + cmt_id + '" data-cmt-id="' + cmt_id + '">'
                            + '<span class="img-avatar">'
                            + '<img alt="" src="../storage/img/users/' + avatar + '" class="img-custom avatar-custom" />'
                            + '</span>'
                            + '<span class="item-cmt-content">'
                            + '<div class="item-cmt-header">'
                            + username
                            + '</div>'
                            + '<div class="item-cmt-body">'
                            + content_cmt
                            + '</div>'
                            + '<div class="item-time-cmt">'
                            + '<span class="img-time-cmt">'
                            + '<img alt="time-cmt" src="../public/imgs/original/time.png" class="img-time-cmt" />'
                            + '</span>'
                            + '<span class="time-ago-cmt">'
                            + time_ago
                            + '</span>'
                            + '<span class="reply-cmt pull-right">'
                            + '<button type="button" class="btn btn-sm btn-outline-primary" onclick="replyComment(' + cmt_id + ', ' + question_id_custom + ')">Reply</button>'
                            + '</span>'
                            + '</div>'
                            + '</span>'
                            + '</div>');
                    }
                }
                $('input.reply-cmt-' + question_id_custom).data('reply-cmt-id', 0);
                $('html,body').animate({
                    scrollTop: $(".cmt-" + cmt_id).offset().top - 20
                }, 500);
            },
            error: function (data) {
                console.log('Error:', data);
                bootbox.alert({
                    message: "Error, please contact admin!",
                    backdrop: true
                });
            }
        });
    }
}

$(document).on("keypress","input.reply-cmt",enterComment);
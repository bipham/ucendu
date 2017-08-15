var myId = $('#userNotiAction').data('user-id');
var baseUrl = document.location.origin;
var openNoti = false;

$("#toolbar-open").click(function() {
    $(this).toggleClass('transform-open-toolbar-active');
    $('.toolbar-content').toggleClass('transform-content-toolbar-active');
    $('.icon-toolbar-close').toggleClass('hidden');
    $('.icon-toolbar-open').toggleClass('hidden');
    $('.overlay').toggleClass('overlay-active');
});

$(".overlay").click(function() {
    $(this).toggleClass('overlay-active');
    $('.toolbar-content').toggleClass('transform-content-toolbar-active');
    $('.icon-toolbar-close').toggleClass('hidden');
    $('.icon-toolbar-open').toggleClass('hidden');
    $('.open-toolbar').toggleClass('transform-open-toolbar-active');
});

$(".panel-left").resizable({
    handleSelector: ".splitter",
    resizeHeight: true
});
$(".panel-top").resizable({
    handleSelector: ".splitter-horizontal",
    resizeWidth: false
});

jQuery("document").ready(function($){

    var nav = $('#myTabReading');

    $(window).scroll(function () {
        if ($(this).scrollTop() > 140) {
            nav.addClass("reading-header-fixed");
        } else {
            nav.removeClass("reading-header-fixed");
        }
    });

});


$(document).mouseup(function(e)
{
    var container = $('.notification-status');

    // if the target of the click isn't the container nor a descendant of the container
    if (!container.is(e.target) && container.has(e.target).length === 0)
    {
        openNoti = false;
        $('#notifications-container-menu').hide();
        $('.noti-status').removeClass('white-font-class');
    }

});

$('.noti-status').click(function (e) {
    // alert('match noti');
    e.preventDefault();
    if (!openNoti) {
        openNoti = true;
        $('#notifications-container-menu').show();
        $('.noti-status').addClass('white-font-class');
    }
    else {
        openNoti = false;
        $('#notifications-container-menu').hide();
        $('.noti-status').removeClass('white-font-class');
    }
    loadAllNotification();
});



function loadAllNotification() {
    var ajaxGetNotiUrl = baseUrl + '/getNotification/' + myId;
    $.ajax({
        type: "GET",
        url: ajaxGetNotiUrl,
        dataType: "json",
        success: function (data) {
            console.log(data);
            var list_notis = data.list_notis;
            if (list_notis.length != 0) {
                for (var i = 0; i < list_notis.length; i++) {
                    console.log('read: ' + list_notis[i].read);
                    if (list_notis[i].read == 0) {
                        var classReadNoti = '';
                    }
                    else {
                        console.log('read !0: ' + list_notis[i].read);
                        var classReadNoti = 'seen-noti';
                    }

                    if (list_notis[i].type_noti == 'userCommentNotification') {
                        var type_noti = 'userCommentNotification';
                        var url_link = '#';
                        var content_noti = '<strong>' + list_notis[i].username_cmt + ' </strong> commented on <strong>' + list_notis[i].lesson_title + ' lesson</strong>';
                    }
                    $('#listNotiArea').append(
                        '<div class="item-notification no-read ' + classReadNoti + '" onclick="#">'
                        + '<a href="' + url_link + '" class="link-to-noti">'
                        + '<span class="img-user-send-noti img-auto-center">'
                        + '<img alt="' + list_notis[i].username_cmt + '" src="/storage/img/users/' + list_notis[i].avatar_user + '" class="img-user-noti-header img-auto-center-inner" />'
                        + '</span>'
                        + '<span class="item-content-noti">'
                        + '<div class="item-body-noti">'
                        +  content_noti
                        + '</div>'
                        + '<div class="item-time-noti">'
                        + '<span class="img-time-noti">'
                        + '<img alt="time-noti" src="/public/imgs/original/time.png" class="img-time-noti" />'
                        + '</span>'
                        + '<span class="time-ago-noti">'
                        + list_notis[i].noti_updated
                        + '</span>'
                        + '</div>'
                        + '</span>'
                        + '<span class="img-auto-center img-lesson-preview">'
                        + '<img alt="' + list_notis[i].lesson_title + '" src="/storage/upload/images/img-feature/' + list_notis[i].image_lesson_feature + '" class="img-lesson-preview-header img-auto-center-inner" />'
                        + '</span>'
                        + '</a>'
                        + '</div>'
                    );
                }
            }
        },
        error: function (data) {
            console.log('Error:', data);
        }
    });
}


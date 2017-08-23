/**
 * Created by nobikun1412 on 27-May-17.
 */
// Notification.requestPermission();
var myId = $('#userNotiAction').data('user-id');
var oldTotalNoti = $('.total-noti').html();
console.log('ID: ' + myId);
console.log('oldTotalNoti: ' + oldTotalNoti);
var baseUrl = document.location.origin;
var socket_connect = baseUrl + ':80';
var socket = io.connect(socket_connect);
console.log('baseUrl: ' + baseUrl);
console.log('socket_connect: ' + socket_connect);
socket.emit('updateSocket', myId);
socket.on('commentNotification', function (data) {
    console.log('data: ' + data);
    var dataJSON = JSON.parse(data);
    var dataUser = dataJSON.user_cmt;
    var readingLesson = dataJSON.readingLesson;

    var url = '#';
    var body = dataUser.username + ' commented on ' + readingLesson.title + ' lesson.';

    var img_feature = '/storage/img/users/' + dataUser.avatar;

    var title_noti = 'New notification from Ucendu!';

    notify = new Notification(
        title_noti,
        {
            body: body,
            icon: img_feature, // Hình ảnh
            tag: url // Đường dẫn
        }
    );

    notify.onclick = function () {
        window.open(this.tag, '_blank');
        // window.location.href = this.tag; // Di chuyển đến trang cho url = tag
        window.focus();
    }
});

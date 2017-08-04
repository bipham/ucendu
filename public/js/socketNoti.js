/**
 * Created by nobikun1412 on 27-May-17.
 */
// Notification.requestPermission();
var socket = io.connect('http://ucendu.dev:8890');
socket.on('commentNotification', function (data) {
    console.log('data: ' + data);
    var url = '#';
    var body = 'Hello';

    var img_feature = '../public/imgs/original/time.png' ;

    notify = new Notification(
        'encendud',
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

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

// $('#myTabReading .tab-reading-control').click(function () {
//     $('#myTabReading .tab-reading-control.active').removeClass('active');
//     $(this).addClass('active');
// });
//
$('#myTabReading a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    alert(e.relatedTarget);
    e.relatedTarget.parent().removeClass('active');
    e.target.parent().addClass('active');

    // e.target // newly activated tab
    // e.relatedTarget // previous active tab
});
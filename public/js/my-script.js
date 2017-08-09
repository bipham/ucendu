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
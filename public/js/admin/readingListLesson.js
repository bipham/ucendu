/**
 * Created by BiPham on 8/17/2017.
 */
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('[name="_token"]').val()
    }
});

var baseUrl = document.location.origin;
var ajaxUpdateInfoBasic = baseUrl + '/updateInfoBasicReadingLesson/';
var img_url = '';
var img_name = '';
var img_extension = '';

$( document ).ready(function() {
    $('.btn-save-info-basic').click(function () {
        var lesson_id = $(this).parents('.modal').data('id');
        var title_lesson = $('#titleLesson').val();
        var ajaxUrl = ajaxUpdateInfoBasic + lesson_id;
        $.ajax({
            type: "POST",
            url: ajaxUrl,
            dataType: "json",
            data: { img_url: img_url, img_name: img_name, title_lesson: title_lesson },
            success: function (data) {
                bootbox.alert({
                    message: "Update info basic success! " + data.result,
                    backdrop: true,
                    callback: function(){
                        location.href= baseUrl + '/listReadingLesson';
                    }
                });
            },
            error: function (data) {
                bootbox.alert({
                    message: "Update info basic fail!",
                    backdrop: true
                });
            }
        });
    });
});

function deleteReadingLesson(id) {
    bootbox.confirm({
        title: "Delete Reading Lesson",
        message: "Do you want to delete this lesson?",
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> Cancel',
                className: 'btn-danger'
            },
            confirm: {
                label: '<i class="fa fa-check"></i> Confirm',
                className: 'btn-success'
            }
        },
        callback: function (result) {
            if(result) {
                var ajaxDelLessonReading = baseUrl + '/deleteLessonReading/' + id;
                $.ajax({
                    type: "GET",
                    url: ajaxDelLessonReading,
                    dataType: "json",
                    // data: { },
                    success: function (data) {
                        bootbox.alert({
                            message: "Delete lesson success! " + data.result,
                            backdrop: true,
                            callback: function(){
                                location.href= baseUrl + '/listReadingLesson';
                            }
                        });
                    },
                    error: function (data) {
                        bootbox.alert({
                            message: "Delete lesson fail!",
                            backdrop: true
                        });
                    }
                });
            }
        }
    });
}

function readURL(input) {
    img_name = $('input[type=file]').val().split('\\').pop();
    img_extension = img_name.substr( (img_name.lastIndexOf('.') + 1) ).toLowerCase();
    var allowedExtensions = ['png', 'jpg', 'jpeg', 'gif'];
    if( allowedExtensions.indexOf(img_extension) == -1 ) {
        bootbox.alert({
            message: "Img not true format!",
            backdrop: true
        });
        $('#imgFeature').val('');
        img_name = '';
        $("#image-main-preview").attr('src', '#');
        $("#image-main-preview").addClass('hidden-class');
        i++;
        return;
    }
    else {
        img_name = $('input[type=file]').val().split('\\').pop();
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $("#" + input.name + "-preview")
                    .attr('src', e.target.result)
                    .width(150);
                img_url = e.target.result;
                $("#" + input.name + "-preview").removeClass('hidden-class');
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
}

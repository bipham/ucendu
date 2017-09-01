/**
 * Created by BiPham on 9/1/2017.
 */
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('[name="_token"]').val()
    }
});

var baseUrl = document.location.origin;
var mainUrl = baseUrl.substring(13);
var ajaxFinishCreateNewVocabulary = baseUrl + '/createNewVocabulary';

$('.btn-finish-new-type-voca').click(function () {
    var name_type_voca = $('#type_voca_name').val().trim();
    var name_icon_type_vocabulary = $('#name_icon_type_vocabulary').val().trim();
    var content_type_voca = CKEDITOR.instances["content_voca"].getData();
    if (name_type_voca == '' || content_type_voca == '') {
        bootbox.alert({
            message: "Please enter data!",
            backdrop: true
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: ajaxFinishCreateNewVocabulary,
            dataType: "json",
            data: { name_type_voca: name_type_voca, content_type_voca: content_type_voca, name_icon_type_vocabulary: name_icon_type_vocabulary },
            success: function (data) {
                bootbox.alert({
                    message: "Create new type vocabulary success!",
                    backdrop: true,
                    callback: function(){
                        location.href= baseUrl + '/createNewVocabulary';
                    }
                });
            },
            error: function (data) {
                bootbox.alert({
                    message: "FAIL CREATE NEW VOCABULARY!",
                    backdrop: true
                });
            }
        });
    }
});
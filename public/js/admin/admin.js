$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('[name="_token"]').val()
    }
});

var baseUrl = document.location.origin;
var mainUrl = baseUrl.substring(13);
var ajaxFinishCreateNewTypeQuestion = baseUrl + '/createNewTypeQuestion';

$('.btn-finish-new-type-question').click(function () {
    var name_type_question = $('#type_question_name').val();
    var introduction_type_question = CKEDITOR.instances["introduction_type_question"].getData();
    if (name_type_question == '' || introduction_type_question == '') {
        bootbox.alert({
            message: "Please enter data!",
            backdrop: true
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: ajaxFinishCreateNewTypeQuestion,
            dataType: "json",
            data: { name_type_question: name_type_question, introduction_type_question: introduction_type_question },
            success: function (data) {
                bootbox.alert({
                    message: "Create new type question success!",
                    backdrop: true,
                    callback: function(){
                        location.href= 'http://' + mainUrl + '/reading';
                    }
                });
            },
            error: function (data) {
                bootbox.alert({
                    message: "FAIL CREATE NEW TYPE QUESTIONS!",
                    backdrop: true
                });
            }
        });
    }
});
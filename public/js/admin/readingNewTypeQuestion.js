$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('[name="_token"]').val()
    }
});

var baseUrl = document.location.origin;
var mainUrl = baseUrl.substring(13);
var ajaxFinishCreateNewTypeQuestion = baseUrl + '/createNewTypeQuestion';
var ajaxFinishCreateNewSectionOfTypeQuestion = baseUrl + '/createNewSectionTypeQuestion';

$('.btn-finish-new-type-question').click(function () {
    var name_type_question = $('#type_question_name').val().trim();
    // var introduction_type_question = CKEDITOR.instances["introduction_type_question"].getData();
    if (name_type_question == '') {
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
            data: { name_type_question: name_type_question },
            success: function (data) {
                bootbox.alert({
                    message: "Create new type question success!",
                    backdrop: true,
                    callback: function(){
                        $('#list_type_questions').append('<option selected value="' + data.new_type_question_id + '">' + name_type_question + '</option>');
                        $('#type_question_name').val('');
                        $('#readingCreateNewTypeQuestion').modal('toggle');
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

$('.btn-create-new-section-type-question').click(function () {
    var type_question_id = $('#list_type_questions').val().trim();
    var title_section = $('#title_section').val().trim();
    var name_icon_section = $('#name_icon_section').val().trim();
    var content_section = CKEDITOR.instances["content_section"].getData().trim();
    if (type_question_id == '' || title_section == '' || name_icon_section == '' || content_section == '') {
        bootbox.alert({
            message: "Please enter data!",
            backdrop: true
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: ajaxFinishCreateNewSectionOfTypeQuestion,
            dataType: "json",
            data: { type_question_id: type_question_id, title_section: title_section, name_icon_section: name_icon_section, content_section: content_section },
            success: function (data) {
                bootbox.alert({
                    message: "Create new section of type question success!",
                    backdrop: true,
                    callback: function(){
                        location.href= baseUrl + '/createNewTypeQuestion';
                    }
                });
            },
            error: function (data) {
                bootbox.alert({
                    message: "FAIL CREATE NEW SECTION OF TYPE QUESTION!",
                    backdrop: true
                });
            }
        });
    }
});
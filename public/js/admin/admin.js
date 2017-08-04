var i = '';
var idremove = '';
var listHl = [];
// var color = 'rgb(100, 214, 29)';
//
// $('#q1').mouseup(function(){
//     if (window.getSelection) {
//         var sel = window.getSelection();
//         if (sel.rangeCount) {
//             var range = sel.getRangeAt(0).cloneRange();
//             sel.removeAllRanges();
//             sel.addRange(range);
//             i = getTest();
//         }
//     }
// });
var noti = false;
var sandbox = document.getElementById('sandbox');
var boolRemove = false;
var hltr = new TextHighlighter(sandbox, {
    onBeforeHighlight: function (range) {
        // ...

        // console.log(hltr);
        // console.log(hltr.options);
        i = prompt("Higlight for answer number:", "");
        // console.log(i)
        hltr.options['highlightedClass'] ='answer tesst-' + i;
        if (jQuery.inArray(i, listHl) == -1) {
            listHl.push(i);
            // console.log(listHl);
        }
        return true;
        // hltr.setColor(color);

        // color = 'rgb(244, 67, 54)';
        // hltr.removeHighlights();
    },
    onAfterHighlight: function (range, hlts) {
        // hltr.contextClass('test-hl');

        // hltr.hi('tesst-' + i);
        // i++;
        $('.answer.tesst-' + i).attr('data-idanwser', i);
        console.log('div: ' + $('.remove-ans-' + i).length);
        if ($('.remove-ans-' + i).length == 0) {
            alert('div not found');
            $('.answer-area').append('<div class="remove-ans-' + i + '">Remove highlight for anwser ' + i + ': <button class="remove" data-removeid="' + i + '">Remove</button></div>');
        }
        else {
            alert('div found');
        }

        console.log($(this));
        // $('.answer').each(function () {
        //     var qnumber = $(this).class('qnumber');
        //     if (jQuery.inArray(qnumber, listQ) == -1) {
        //         listQ.push(qnumber);
        //         var qorder = $(this).attr('name');
        //         // qorder = qorder.split('question-');
        //         qorder = qorder.match(/\d+/);
        //         console.log('Question: ' + listQ);
        //         $('.answer-area').append('<div class="answer-key"><span><strong>Answer ' + qorder + '</strong></span><input class="answer-' + qnumber + '" /></div>');
        //     }
        // });
    },
    onRemoveHighlight: function (hl) {
        // console.log('hl: ' + id_remove);
        var clcus = 'answer tesst-' + idremove;

        if (hl.className == clcus) {
            if (!noti) {
                boolRemove = window.confirm('Do you really want to remove: "' + hl.className + '"');
                noti = true;
            }
            console.log('bnool: ' + boolRemove);
            if (boolRemove) {
                $('.remove-ans-' + idremove).remove();
                // idremove = '';
                return true;
            }
        }
        else return false;
        // var boolRemove = window.confirm('Do you really want to remove: "' + hl.className + '"');
        //     console.log('bnool: ' + boolRemove);
        // return window.confirm('Do you really want to remove: "' + hl.className + '"');
    }
});
$( document ).ready(function() {


    // var searchTerms = $('#collapseProductInfo').val();

    function parseTest() {
        var alist = '';
        for (var x = 0; x < listHl.length; x++) {
            if (x == listHl.length -1) {
                alist += '{' +
                    'text: "' + listHl[x] + '", ' +
                    'value: "' + listHl[x] + '",' +
                    '}'
            }
            else {
                alist += '{' +
                    'text: "' + listHl[x] + '", ' +
                    'value: "' + listHl[x] + '",' +
                    '},'
            }
        }
        // console.log('A LIST: ' + alist);
        return alist;
    }

    function getTest() {
        bootbox.prompt({
            title: "Higlight for answer number: ",
            inputType: 'number',
            callback: function (result) {
                // console.log(result);
                if (jQuery.inArray(result, listHl) == -1) {
                    listHl.push(result);
                    // console.log(listHl);
                }
                return result;
            }
        });
    }

    $('.card').on('shown.bs.collapse', function () {
        // do something…
        $(".detail-desc-product-custom").unmark();
        var $card_block = $(this).find('.card-block');
        var searchTerm = $card_block.text();
        var searchTerms = 'A';
        $(".detail-desc-product-custom").mark(searchTerm, {
            separateWordSearch: false,
            className: 'q1-test',
            "done": function(counter){
                var html = $('.detail-desc-product-custom').html();
                console.log(html);
                $('.q1-test').append("<span class='add'>hello</span>");
            },
        });

    });


    $('.card').on('hidden.bs.collapse', function () {
        // do something…
        $(".detail-desc-product-custom").unmark();
    });
});

$(document).on("click", ".remove",function() {
    idremove = $(this).data('removeid');
    console.log('id_remove: ' + idremove);
    noti = false;
    hltr.removeHighlights();
});
// function removeHL(id_remove) {
//     console.log('id_remove: ' + id_remove);
//     hltr.removeHighlights(id_remove);
// }

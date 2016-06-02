$(document).ready(function() {

    $('#edit').click(function(){
        $(this).remove();

        var editor = $('.summernote');
        editor.summernote({
            callbacks: {
                onInit: function() {
                    editor.summernote('justifyFull');
                },
                onFocus: function() {
                    if(editor.val() == '')
                        editor.summernote('justifyFull');
                },
                onEnter: function() {
                    if(editor.val() == '')
                        editor.summernote('justifyFull');
                }
            },
            height: ($(window).height() - 3*$(window).height()/4),
            focus: false,
            placeholder: 'Your answer here...',
            codemirror: {
                theme: 'monokai'
            },
            prettifyHtml:false,
            toolbar: [
                ['highlight', ['highlight']],
                ['style', ['bold', 'italic', 'underline', 'clear']],
                //['font', ['strikethrough']],
                ['fontsize', ['fontsize']],
                ['para', ['ul', 'ol', 'paragraph']],
                //['height', ['height']],
                ['view', ['fullscreen', 'codeview']]
            ]
        });
      /*  var exp = $(document.createElement('div'));
        exp.after().html('<button id="post_answer" type="submit" class="btn">' +
            "Post Answer!" + '<span class="glyphicon glyphicon-send"></span></button>');
        exp.insertAfter(".note-editor");*/
    });




});

$('#post_answer').click(function(){

    var text = $('.summernote').summernote('code');
    console.log(text);

    $('.note-editor').insertBefore(text);
    /*$('.summernote').summernote('destroy');
     $('#post_answer').remove();*/
});

function validateTextArea(form, text)
{
    var re = /^\w+$/;

    return true;
}
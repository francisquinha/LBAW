$(document).ready(function() {

    $('#edit').click(function(){
        $(this).remove();
        $('.messageAnswer').show();

        setTimeout(function(){
            $('.messageAnswer').remove();
        }, 5000);


            var editor = $('.summernote');
            editor.summernote({
                callbacks: {
                    onInit: function () {
                        editor.summernote('justifyFull');
                    },
                    onFocus: function () {
                        if (editor.val() == '')
                            editor.summernote('justifyFull');
                    },
                    onEnter: function () {
                        if (editor.val() == '')
                            editor.summernote('justifyFull');
                    }
                },
                height: ($(window).height() - 3 * $(window).height() / 4),
                focus: false,
                placeholder: 'Your answer here...',
                codemirror: {
                    theme: 'monokai'
                },
                prettifyHtml: false,
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
            var button = '<button id="post_answer" type="submit" class="btn">Post Answer!<span class="glyphicon glyphicon-send"></span></button>';
            $('.note-resizebar').append(button).html();

    });
});

function send_answer(questionID) {
        var body = $('.summernote').summernote('code');
        $.post(BASE_URL + 'actions/posts/answer.php?questionid=' + questionID, {body: body})
            .done(function () {
                $('.summernote').summernote('destroy');
                window.location.reload();
            });

}
/*$(document).ready(function() {
    var editor = $('#summernote');
    editor.summernote({
        height: ($(window).height() - 500),
        focus: false,
        placeholder: 'Your answer here...',
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
});
*/
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 200,
            tabsize: 2,
            codemirror: {
                theme: 'monokai'
            }
        });
    });

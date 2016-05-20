$(document).ready(function() {
    var editor = $('#summernote');
    editor.summernote({
        height: ($(window).height() - 500),
        focus: false,
        placeholder: 'Your answer here...',
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            //['font', ['strikethrough']],
            ['fontsize', ['fontsize']],
            ['para', ['ul', 'ol', 'paragraph']],
            //['height', ['height']],
            ['view', ['fullscreen', 'codeview']]
        ]
    });
});
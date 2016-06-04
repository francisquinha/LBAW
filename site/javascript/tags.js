
$(document).ready(function() {

    var last_valid_selection = null;

    $('#tagsbox').change(function() {
        if ($(this).val().length > 5) {
            alert('You can only choose 5 tags!');
            $(this).val(last_valid_selection);
        } else {
            last_valid_selection = $(this).val();
        }
    });

});



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

    function changeTab(n) {
        $.ajax({
            type: 'POST',
            url: BASE_URL + 'pages/questions/tab.php',
            data: n
        })
    }

    $('#recent_tab').click(function () {
        $.ajax({
            type: 'POST',
            url: BASE_URL + 'pages/questions/tab.php'
        })
    });

    $('#hot_tab').click(function () {
        $.ajax({
            type: 'POST',
            url: BASE_URL + 'pages/questions/tab.php'
        })
    });

});


function createTag() {
    var tagName = $('.newTagName').val();


    $.ajax({
            type: 'POST',
            url: BASE_URL + 'actions/members/tags.php',
            data: {tagName: tagName}
        })
        .done(function (data) {
                window.location.reload();
        })
        .fail(function () {
            alert(data);
        });
}


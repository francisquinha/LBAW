var buttonID = 'undefined';
$(document).ready(function() {
    $( ".upquestion" ).click(function() {
        buttonID = "up";
    });

    $( ".downquestion" ).click(function() {
        buttonID = "down";
    });
});

function votes(questionID) {
        $.ajax({
            type: 'POST',
            url: BASE_URL + 'actions/posts/votes.php',
            data: {questionid: questionID, buttonid: buttonID}
        })
            .done(function (data) {
                if ((data == 'You already voted on this post') || (data == 'You must login to vote')){
                    alert(data);
                }
                else{
                    var number = $('#questionRating-' + questionID).text();
                    if (buttonID == 'up')
                        number++;
                    else number--;

                    $('#questionRating-' + questionID).fadeOut(600, function(){
                        $('#questionRating-' + questionID).fadeIn().delay(2000);
                        $('#questionRating-' + questionID).text(number);
                    });
                }
                 })
                 .fail(function () {
                 alert("vote failed.");
                 });

// to prevent refreshing the whole page
        return false;
                /*});*/

}
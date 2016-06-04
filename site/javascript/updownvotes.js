var buttonID = 'undefined';
$(document).ready(function() {
    $( ".upquestion" ).click(function() {
        buttonID = "up";
    });

    $( ".downquestion" ).click(function() {
        buttonID = "down";
    });

    $('.linkReportAnswer').click( function(e) {
        e.preventDefault();


        var modal = document.getElementById('myModalAnswer');

        var span = document.getElementsByClassName("closeAnswer")[0];

        modal.style.display = "block";
        modal.style.display
        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        return false;
        
    } );


    $('.linkReportQuestion').click( function(e) {
        e.preventDefault();

        var modal = document.getElementById('myModalQuestion');

        var span = document.getElementsByClassName("closeQuestion")[0];

        modal.style.display = "block";
        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        return false;
    } );

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

function sendReport(postID) {
    var reportBody = $('.reportBody').val();
    alert(reportBody);
    $.ajax({
        type: 'POST',
        url: BASE_URL + '/actions/posts/reports.php',
        data: {postid: postID, reportbody:reportBody}
    })
        .done(function (data) {
            alert(data);
        });
}
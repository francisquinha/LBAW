var buttonID = 'undefined';
$(document).ready(function() {
    $( ".upquestion" ).click(function() {
        buttonID = "up";
    });

    $( ".downquestion" ).click(function() {
        buttonID = "down";
    });

    $('.linkReportQuestion').click( function() {

        $('.reportFormQuestion').css( "display", "inline" );

    } );

    $('.linkReportAnswer').click( function() {

        $('.reportFormAnswer').css( "display", "inline" );

    } );

    $('.linkReportBestAnswer').click( function() {

        $('.reportFormBestAnswer').css( "display", "inline" );

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

}

function sendReport1(postID) {
    var reportBody = $('.reportBody1').val();
    if(reportBody == '') {
        alert('you really want send a message');
        return false;
    }
    $.ajax({
        type: 'POST',
        url: BASE_URL + '/actions/posts/reports.php',
        data: {postid: postID, reportbody: reportBody}
    })
        .done(function (data) {
            window.location.reload();
        });
}

function sendReport2(postID) {
    var reportBody = $('.reportBody2').val();
    if(reportBody == '') {
        alert('you really want send a message');
        return false;
    }
    $.ajax({
        type: 'POST',
        url: BASE_URL + '/actions/posts/reports.php',
        data: {postid: postID, reportbody: reportBody}
    })
        .done(function (data) {
            window.location.reload();
        });
}

function sendReport3(postID) {
    var reportBody = $('.reportBody3').val();
    if(reportBody == '') {
        alert('you really want send a message');
        return false;
    }
    $.ajax({
        type: 'POST',
        url: BASE_URL + '/actions/posts/reports.php',
        data: {postid: postID, reportbody: reportBody}
    })
        .done(function (data) {
            window.location.reload();
        });
}


function deleteAnswer(postID) {
    $.ajax({
        type: 'POST',
        url: BASE_URL + 'actions/posts/delete.php',
        data: {postid: postID}
    })
        .done(function (data) {
            window.location.reload();
        })
        .fail(function () {
            alert(data);
        });
}

function deleteQuestion(postID) {
    $.ajax({
        type: 'POST',
        url: BASE_URL + 'actions/posts/delete.php',
        data: {postid: postID}
    })
        .done(function (data) {
            window.location = BASE_URL
        })
        .fail(function () {
            alert(data);
        });
}
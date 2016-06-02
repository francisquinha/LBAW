$(document).ready(function() {
  /*  $('.updownquestion').submit(function () {
         $.ajax({
         type: 'POST',
         url: BASE_URL + '/actions/posts/votes.php',
         data: $(this).serialize()
         })
         .done(function (data) {
         if (data == 'true') {
             alert("php ok");
         window.location.reload();

         //window.location = BASE_URL + '/pages/questions/list_recent.php'
         } else if (data == 'false') {
         $('#response-login').html('<p class="messageErrorLogin">' + "Invalid username or password" + '</p>');
         }
         else {
         alert("some error");
         }
         })
         .fail(function () {
         alert("vote failed.");
         });
         
    });
    // to prevent refreshing the whole page
    return false;
*/
});

function votes(questionID){
    $.ajax({
        type: 'POST',
        url: BASE_URL + '/actions/posts/votes.php',
        data: { questionid: questionID }
    })
       .done(function (data) {
            /*if (data == 'true') {*/
            alert(data);
            window.location.reload();
            /*
             //window.location = BASE_URL + '/pages/questions/list_recent.php'
             } else if (data == 'false') {
             $('#response-login').html('<p class="messageErrorLogin">' + "Invalid username or password" + '</p>');
             }
             else {
             alert("some error");
             }
        })
        .fail(function () {
            alert("vote failed.");
        });
*/
// to prevent refreshing the whole page
//return false;
});
}
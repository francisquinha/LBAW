function validateLogin(form, username, password){
    if (username.value == '' || password.value == '') {
        alert('You must provide both a username and password');
        return false;
    }
    return true;
}

$(document).ready(function(){
    $('.login-form').submit(function(){

        // show that something is loading
        //$('#response').html("<b>Loading response...</b>");

        /*
         * 'post_receiver.php' - where you will pass the form data
         * $(this).serialize() - to easily read form data
         * function(data){... - data contains the response from post_receiver.php
         */
        $.ajax({
                type: 'POST',
                url: "../../actions/members/login.php", // fix this
                data: $(this).serialize()
            })
            .done(function(data){

                // show the response
                //alert( data );
                if (data == 'true'){
                    alert("Success");
                }else{
                    alert("Invalid");}
                //$('#response').html(data);
                console.log(data);

            })
            .fail(function() {
                // just in case posting your form failed
                alert( "Posting failed." );
            });

        // to prevent refreshing the whole page
        return false;

    });
});
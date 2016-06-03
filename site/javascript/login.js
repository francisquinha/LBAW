
function validateLogin(form, username, password){
    if (username.value == '' || password.value == '') {
        alert('You must provide both a username and password');
        form.username='error'; // fix this
        return false;
    }
    return true;
}


$('.form-username, .form-password, .form-email, .form-name').focus(
    function(){
        $(this).css({'background-color' : 'white'});
    });


function validateRegister(form, username, email, password, name)
{
    var re = /^\w+$/;

    if (!(username.value == '' || email.value == '' || name.value == '' || password.value == '')) {
    } else {
        alert('You must fill all the fields');

        if (username.value == '') {
            form.username = undefined;
            form.username.style.backgroundColor = "#d3d3d3";
        }

        if (email.value == '') {
            form.email = undefined;
            form.email.style.backgroundColor = "#d3d3d3";
        }

        if (password.value == '') {
            form.password.style.backgroundColor = "#d3d3d3";
        }

        if (name.value == '') {
            form.name.style.backgroundColor = "#d3d3d3";
        }

        return false;
    }

    if(!re.test(username.value)) {
        alert("Username must contain only letters, numbers and underscores");
        form.username.style.backgroundColor = "#d3d3d3";
        //form.username.focus();
        return false;
    }

    if (password.value.length < 3) {
        alert("Password must be at least 3 characters long");
        form.password.style.backgroundColor = "#d3d3d3";
        //form.password.focus();
        return false;
    }

    return true;
}


/*
$.getScript("main.js", function(){
    alert("Script loaded but not necessarily executed.");
});*/

$(document).ready(function() {
    $('.login-form').submit(function () {
        $.ajax({
            type: 'POST',
            url: BASE_URL + 'actions/members/login.php', // fix this
            data: $(this).serialize()
        })
            .done(function (data) {
                if (data == 'true') {
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
                alert("Login failed.");
            });
        // to prevent refreshing the whole page
        return false;
    });


    $('.register-form').submit(function(){
        //event.preventDefault();
        $.ajax({
            type: 'POST',
            url: BASE_URL + 'actions/members/register.php', // fix this
            data: $(this).serialize()
        })
            .done(function(data) {
                if (data == 'true') {
                    $('#response-register').html('<p class="messageErrorRegister">' + "Registered with success" + '</p>');
                    setTimeout(function(){$('.nav-tabs a[href="#' + 'login' + '"]').tab('show');}, 2000);//ativaTab('login');
                    //window.location='https://gnomo.fe.up.pt/~lbaw1553/pages/questions/list_recent.php'
                } else if(data == 'false'){
                    $('#response-register').html('<p class="messageErrorRegister">' + "Fill correctly, please" + '</p>');
                }
                else{alert("some error");}
            })
            .fail(function() {
                alert( "Register failed." );
            });
        // to prevent refreshing the whole page
        return false;
});
});

/* $('.register-form').submit(function(){
    $.ajax({
         type: 'POST',
         url: "../../actions/members/register.php", // fix this
         data: $(this).serialize()
     })
         .done(function(data) {
             if (data == 'true') {

                 $('#response-register').html('<p class="messageErrorRegister">' + "Registered with success" + '</p>');
                 ativaTab('login');
                 //window.location='https://gnomo.fe.up.pt/~lbaw1553/pages/questions/list_recent.php'
             } else if(data == 'false'){
               $('#response-register').html('<p class="messageErrorRegister">' + "Fill correctly, please" + '</p>');
             }
             else{alert("some error");}
         })
         .fail(function() {
             alert( "Register failed." );
         });
     // to prevent refreshing the whole page
     return false;
 });
});*/
/*
function ativaTab(tab){
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
}
    */
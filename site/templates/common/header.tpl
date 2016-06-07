<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>OutOfBounds</title>

   <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="{$BASE_URL}font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="{$BASE_URL}css/bootstrap.min.css">
    <link rel="stylesheet" href="{$BASE_URL}css/form-elements.css">
    <link rel="stylesheet" href="{$BASE_URL}css/footer-distributed-with-address-and-phones.css">
    <link rel="stylesheet" href="{$BASE_URL}fonts/font.css">

    <!-- Custom CSS -->
    <link href="{$BASE_URL}css/blog-home.css" rel="stylesheet">
    <link rel="stylesheet" href="{$BASE_URL}css/style.css">
    <link rel="stylesheet" href="{$BASE_URL}css/listquestion.css">
    <link rel="stylesheet" href="{$BASE_URL}css/userpage.css">

    <!-- add summernote -->
    <link href="{$BASE_URL}text_editor/dist/summernote.css" rel="stylesheet">
    <link rel="stylesheet" href="{$BASE_URL}codemirror/lib/codemirror.css">

</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand1" href="{$BASE_URL}index.php">OutOfBounds</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="{$BASE_URL}pages/members/list_all.php?page=1" class="btn btn-link btn-lg">Users</a>
                </li>
                <li>
                    <a href="{$BASE_URL}pages/about/about.php" class="btn btn-link btn-lg">About</a>
                </li>
                <li style="padding-left:1.5rem;">
                    {if $USERNAME}
                        {include file='common/menu_logged_in.tpl'}
                    {else}
                        {include file='common/menu_logged_out.tpl'}
                    {/if}
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

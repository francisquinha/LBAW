<?php /* Smarty version Smarty-3.1.15, created on 2016-06-02 10:31:59
         compiled from "C:\xampp\htdocs\LBAW\site\templates\common\header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:16687574c32954b6688-57042812%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3aae6610118fb4127f7c9987683e33b7bc7de3ee' => 
    array (
      0 => 'C:\\xampp\\htdocs\\LBAW\\site\\templates\\common\\header.tpl',
      1 => 1464856097,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16687574c32954b6688-57042812',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_574c32954d4ff5_71938846',
  'variables' => 
  array (
    'BASE_URL' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_574c32954d4ff5_71938846')) {function content_574c32954d4ff5_71938846($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>OutOfBounds</title>

   <!-- Bootstrap Core CSS -->
    <link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/form-elements.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/footer-distributed-with-address-and-phones.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
fonts/font.css">

    <!-- Custom CSS -->
    <link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/blog-home.css" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/style.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/listquestion.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/question.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/userpage.css">

    <!-- add summernote -->
    <link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
text_editor/dist/summernote.css" rel="stylesheet">

    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
codemirror/lib/codemirror.css">

</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
            <a class="navbar-brand1" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
index.php">OutOfBounds</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/members/list_all.php" class="btn btn-link btn-lg">Users</a>
                </li>
                <li>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/tags/list_all.php" class="btn btn-link btn-lg">Tags</a>
                </li>
                <li>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/about/about.php" class="btn btn-link btn-lg">About</a>
                </li>
                <li>
                    <?php if ($_smarty_tpl->tpl_vars['USERNAME']->value) {?>
                        <?php echo $_smarty_tpl->getSubTemplate ('common/menu_logged_in.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

                    <?php } else { ?>
                        <?php echo $_smarty_tpl->getSubTemplate ('common/menu_logged_out.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

                    <?php }?>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<?php }} ?>

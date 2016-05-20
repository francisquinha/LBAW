<?php /* Smarty version Smarty-3.1.15, created on 2016-05-13 10:15:14
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/contact/contact.tpl" */ ?>
<?php /*%%SmartyHeaderCode:52795593857358565542d41-49078697%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '589d3e6d9b0a7e1cc4e374aa419e675c8a00d957' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/contact/contact.tpl',
      1 => 1463127309,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '52795593857358565542d41-49078697',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_57358565602009_24691257',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57358565602009_24691257')) {function content_57358565602009_24691257($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-7">

    <form class="well form-horizontal" action=" " method="post"  id="contact_form">
        <fieldset>

            <!-- Form Name -->
            <legend>Contact Us !</legend>

            <!-- Text input-->

            <div class="form-group">
                <label class="col-md-12">Name</label>
                <div class="col-md-12 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input  name="first_name" placeholder="Name" class="form-control"  type="text">
                    </div>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-12">E-Mail</label>
                <div class="col-md-12 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input name="email" placeholder="E-Mail Address" class="form-control"  type="text">
                    </div>
                </div>
            </div>

            <!-- Text area -->

            <div class="form-group">
                <label class="col-md-12">Message</label>
                <div class="col-md-12 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                        <textarea class="form-control" name="comment" placeholder="Message" style="min-height: 100px;"></textarea>
                    </div>
                </div>
            </div>


            <!-- Success message
            <div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Thanks for contacting us, we will get back to you shortly.</div>
            -->
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4">
                    <button type="submit" class="btn btn-warning" >Send <span class="glyphicon glyphicon-send"></span></button>
                </div>
            </div>

        </fieldset>
    </form>
            </div>
<!-- /.container -->
<?php }} ?>

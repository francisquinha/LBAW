<?php /* Smarty version Smarty-3.1.15, created on 2016-04-28 17:08:30
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/common/menu_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:24451353457220fe7c8f569-34976299%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9c0d7ab36964c7cc6859761cead9de3594503bd4' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/common/menu_logged_out.tpl',
      1 => 1461856104,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '24451353457220fe7c8f569-34976299',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_57220fe7c9cc43_24300742',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57220fe7c9cc43_24300742')) {function content_57220fe7c9cc43_24300742($_smarty_tpl) {?><a href="#" class="btn btn-link btn-lg" role="button" data-toggle="modal" data-target="#login-modal">Login</a>

</li>
</ul>
</div>
<!-- /.navbar-collapse -->
</div>
<!-- /.container -->
</nav>



<!-- BEGIN # MODAL LOGIN -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Begin # DIV Form -->
            <div id="div-forms">
                <!-- Begin # Login Form -->
                <div class="col-sm-12 col-sm-offset-1 form-box">
                    <div class="form-bottom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#login" data-toggle="tab">Login</a></li>
                            <li><a href="#create" data-toggle="tab">Register</a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="login">
                                <fieldset>
                                    <form role="form" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users/login.php" method="post" class="login-form">
                                        <div class="form-group">
                                            <label class="sr-only" for="form-username">Username</label>
                                            <input type="text" name="username" placeholder="username..."
                                                   class="form-username form-control" id="form-username">
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="form-password">Password</label>
                                            <input type="password" name="password" placeholder="password..."
                                                   class="form-password form-control" id="form-password">
                                        </div>
                                        <button type="submit" class="btn">Login!</button>
                                        <div class="col-sm-11 col-sm-offset-1 form-box">
                                            <a class="btn btn-link-1 btn-link-1-facebook" href="#">
                                                <i class="fa fa-facebook"></i> Facebook
                                            </a>
                                            <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                                                <i class="fa fa-google-plus"></i> Google +
                                            </a>
                                            <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                                                <i class="fa fa-twitter"></i> Twitter
                                            </a>
                                        </div>
                                    </form>
                                </fieldset>
                            </div>
                            <div class="tab-pane fade" id="create">
                                <form role="form" action="" method="post" class="register-form">
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Username</label>
                                        <input type="text" name="form-username" placeholder="Username..."
                                               class="form-username form-control" id="form-username">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Password</label>
                                        <input type="text" name="form-password" placeholder="Password..."
                                               class="form-username form-control" id="form-username">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">First Name</label>
                                        <input type="text" name="form-firstname" placeholder="First Name..."
                                               class="form-username form-control" id="form-username">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Last Name</label>
                                        <input type="text" name="form-lastname" placeholder="Last Name..."
                                               class="form-username form-control" id="form-username">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Email</label>
                                        <input type="text" name="form-email" placeholder="Email..."
                                               class="form-username form-control" id="form-username">
                                    </div>
                                    <button type="submit" class="btn">Submit!</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End # Login Form -->
            </div>
            <!-- End # DIV Form -->
        </div>
    </div>
</div>
<!-- END # MODAL LOGIN -->
<?php }} ?>

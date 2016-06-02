<?php /* Smarty version Smarty-3.1.15, created on 2016-05-30 14:31:17
         compiled from "C:\xampp\htdocs\LBAW\site\templates\common\menu_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:17212574c32954e9415-31701061%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'aeb1aa70c6bb028740b77f230275d2e308d9929b' => 
    array (
      0 => 'C:\\xampp\\htdocs\\LBAW\\site\\templates\\common\\menu_logged_out.tpl',
      1 => 1464610036,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17212574c32954e9415-31701061',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_574c32954ed741_00089536',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_574c32954ed741_00089536')) {function content_574c32954ed741_00089536($_smarty_tpl) {?><a href="#" class="btn btn-link btn-lg" role="button" data-toggle="modal" data-target="#login-modal">Login</a>

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
                                    <form role="form" class="login-form">
                                        <div class="form-group">
                                            <label class="sr-only" for="form-username">Username</label>
                                            <input type="text" name="username" placeholder="Username..."
                                                   class="form-username form-control" id="form-username">
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="form-password">Password</label>
                                            <input type="password" name="password" placeholder="Password..."
                                                   class="form-password form-control" id="form-password">
                                        </div>
                                        <button id="buttonlog" type="submit"
                                                onclick="return validateLogin(this.form, this.form.username, this.form.password);"
                                                class="btn">Login!</button>

                                        <div class="col-sm-11 col-sm-offset-1 form-box">
                                            <a class="btn btn-link-1 btn-link-1-facebook" href="https://www.facebook.com/dialog/oauth?client_id=<b>104463303035318</b>&amp;scope=<b>email,user_website,user_location</b>&amp;redirect_uri=<b>https://gnomo.fe.up.pt/~lbaw1553/pages/questions/list_recent.php</b>">
                                                <i class="fa fa-facebook"></i> Facebook
                                            </a>
                                            <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                                                <i class="fa fa-google-plus"></i> Google +
                                            </a>
                                            <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                                                <i class="fa fa-twitter"></i> Twitter
                                            </a>
                                        </div>
                                        <div id='response-login'></div>
                                    </form>
                                </fieldset>
                            </div>
                            <div class="tab-pane fade" id="create">
                                <form role="form" class="register-form">
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Username</label>
                                        <input type="text" name="username" placeholder="Username..."
                                               class="form-username form-control" id="form-username">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Email</label>
                                        <input type="text" name="email" placeholder="Email..."
                                               class="form-email form-control" id="form-username">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Password</label>
                                        <input type="password" name="password" placeholder="Password..."
                                               class="form-password form-control" id="form-username">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Last Name</label>
                                        <input type="text" name="name" placeholder="Name..."
                                               class="form-name form-control" id="form-username">
                                    </div>
                                    <button id="buttonreg" type="submit"
                                            onclick="return validateRegister(this.form, this.form.username, this.form.email, this.form.password, this.form.name);"
                                            class="btn">Register!
                                    </button>
                                    <div id='response-register'></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End # Login Form -->
            <!-- End # DIV Form -->
        </div>
    </div>
</div>
<!-- END # MODAL LOGIN -->
<?php }} ?>

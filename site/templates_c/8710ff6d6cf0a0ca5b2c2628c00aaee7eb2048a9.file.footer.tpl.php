<?php /* Smarty version Smarty-3.1.15, created on 2016-06-02 10:31:59
         compiled from "C:\xampp\htdocs\LBAW\site\templates\common\footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:22312574c32955d9521-59573129%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8710ff6d6cf0a0ca5b2c2628c00aaee7eb2048a9' => 
    array (
      0 => 'C:\\xampp\\htdocs\\LBAW\\site\\templates\\common\\footer.tpl',
      1 => 1464855231,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '22312574c32955d9521-59573129',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_574c32955ef509_44890548',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_574c32955ef509_44890548')) {function content_574c32955ef509_44890548($_smarty_tpl) {?>
<!-- Footer -->
<footer class="footer-distributed" style="margin-bottom: 0;">

    <div class="footer-left">
        <a href="#">Question</a>
        <a href="#">Admin</a>
        <a href="#">Moderator</a>
        <a href="#">Member</a>
        <h2>OutOfBounds</h2>

        <p class="footer-links">
            <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
index.php">Home</a>
            ·
            <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/about/about.php">About</a>
            ·
            <a href="#">Faq</a>
            ·
            <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/contact/contact.php">Contact</a>
        </p>

        <p class="footer-company-name">OutOfBounds &copy; 2016</p>
    </div>

    <div class="footer-center">

        <div>
            <i class="fa fa-map-marker"></i>
            <p><span>21 Revolution Street</span> Paris, France</p>
        </div>

        <div>
            <i class="fa fa-phone"></i>
            <p>+1 555 123456</p>
        </div>

        <div>
            <i class="fa fa-envelope"></i>
            <p><a href="mailto:support@outofbounds.com">support@company.com</a></p>
        </div>

    </div>

    <div class="footer-right">

        <p class="footer-company-about">
            <span>About the company</span>
            Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
        </p>

        <div class="footer-icons">

            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-github"></i></a>

        </div>

    </div>

</footer>
<!-- /.container -->
<!-- jQuery -->

<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/main.js"></script>

<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/bootstrap.min.js"></script>
<!-- Validate Login JavaScript -->
<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/login.js"></script>
<script>
    $( document ).ready(function() {


        $('.tree-toggle').on('click', function(e) {
            $(this).parent().children('ul.tree').toggle(200);
            e.stopPropagation();
        });

        $(function(){
            $('.tree-toggle').parent().children('ul.tree').toggle(200);

        });

        $('.tree-toggle').click( function(){
            $(this).find('span').toggleClass('glyphicon-menu-right').toggleClass('glyphicon-menu-left');
        });
    });
</script>

<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/text_editor.js"></script>
<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
text_editor/dist/summernote.js"></script>
<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
codemirror/lib/codemirror.js"></script>

</body>
</html><?php }} ?>

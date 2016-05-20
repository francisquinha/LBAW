<?php /* Smarty version Smarty-3.1.15, created on 2016-05-19 17:48:34
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/common/footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1566072680573504c052bdb2-59508113%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b2e0b51fa02c51c42c0cd58bb4adbef820af79cc' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/common/footer.tpl',
      1 => 1463672911,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1566072680573504c052bdb2-59508113',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_573504c05c26a6_08783927',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_573504c05c26a6_08783927')) {function content_573504c05c26a6_08783927($_smarty_tpl) {?>
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

<script src="https://gnomo.fe.up.pt/~lbaw1553/javascript/text_editor.js"></script>
<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
text_editor/dist/summernote.js"></script>

</body>
</html><?php }} ?>

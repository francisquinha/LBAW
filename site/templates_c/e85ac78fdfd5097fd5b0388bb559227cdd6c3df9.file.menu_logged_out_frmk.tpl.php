<?php /* Smarty version Smarty-3.1.15, created on 2016-04-28 15:42:42
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/common/menu_logged_out_frmk.tpl" */ ?>
<?php /*%%SmartyHeaderCode:59969801057221352361f96-96113474%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e85ac78fdfd5097fd5b0388bb559227cdd6c3df9' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/common/menu_logged_out_frmk.tpl',
      1 => 1461850936,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '59969801057221352361f96-96113474',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5722135236f6c1_22495951',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5722135236f6c1_22495951')) {function content_5722135236f6c1_22495951($_smarty_tpl) {?><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/users/register.php">Register</a>
<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users/login.php" method="post">
    <input type="text" placeholder="username" name="username">
    <input type="password" placeholder="password" name="password">
    <input type="submit" value=">">
</form>
<?php }} ?>

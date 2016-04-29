<?php /* Smarty version Smarty-3.1.15, created on 2016-04-22 10:46:23
         compiled from "/opt/lbaw/lbaw1553/public_html/frmk/templates/common/menu_logged_in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8257075635719e4dfd10334-89761053%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ff1b8e010983a7fe4daaba0011fd05c08ebb5691' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/frmk/templates/common/menu_logged_in.tpl',
      1 => 1386927924,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8257075635719e4dfd10334-89761053',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5719e4dfda6729_78500641',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5719e4dfda6729_78500641')) {function content_5719e4dfda6729_78500641($_smarty_tpl) {?><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users/logout.php">Logout</a>
<span class="username"><?php echo $_smarty_tpl->tpl_vars['USERNAME']->value;?>
</span>
<?php }} ?>

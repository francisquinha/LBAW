<?php /* Smarty version Smarty-3.1.15, created on 2016-05-13 01:19:09
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/common/menu_logged_in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:100415425757350f6db5fcd8-66299686%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ed774228cdd38a88224fe9e1510db0e9a58ef3e8' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/common/menu_logged_in.tpl',
      1 => 1462361062,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '100415425757350f6db5fcd8-66299686',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'USERNAME' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_57350f6dbddcd4_02933890',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57350f6dbddcd4_02933890')) {function content_57350f6dbddcd4_02933890($_smarty_tpl) {?><a class="btn btn-link btn-lg" role="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
   aria-expanded="true" style="font-family: 'QuanticoRegular';color: #33cc33; height: 50px;  padding: 15px 0px;  font-size: 20px;  line-height: 20px;  font-weight: bold;">
    <?php echo $_smarty_tpl->tpl_vars['USERNAME']->value;?>

</a>
<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">My Profile</a></li>
    <li><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/members/logout.php" >Logout <span style="color:#cc0000;align:right;padding-bottom:0;"class="glyphicon glyphicon-remove"></span> </a></li>
</ul>
<?php }} ?>

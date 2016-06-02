<?php /* Smarty version Smarty-3.1.15, created on 2016-06-02 10:59:50
         compiled from "C:\xampp\htdocs\LBAW\site\templates\common\menu_logged_in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5549574c329dd17ff5-75554354%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1ff9036b9e95d93070d9052483ed2362678ca313' => 
    array (
      0 => 'C:\\xampp\\htdocs\\LBAW\\site\\templates\\common\\menu_logged_in.tpl',
      1 => 1464856097,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5549574c329dd17ff5-75554354',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_574c329dd3b0f0_21687792',
  'variables' => 
  array (
    'USERNAME' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_574c329dd3b0f0_21687792')) {function content_574c329dd3b0f0_21687792($_smarty_tpl) {?><a class="btn btn-link btn-lg" role="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
   aria-expanded="true" style="font-family: 'QuanticoRegular';color: #33cc33; height: 50px;  padding: 15px 0px;  font-size: 20px;  line-height: 20px;  font-weight: bold;">
    <?php echo $_smarty_tpl->tpl_vars['USERNAME']->value;?>

</a>
<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="margin:0; padding:0; margin-top:0.38rem;">
    <li><a style="padding:1.5rem; font-size: 115%;" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/members/details.php?membersid=<?php echo $_SESSION['userid'];?>
">My Profile</a></li>
    <li><a style="padding:1.5rem; font-size: 115%;" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/members/logout.php" >Logout <span style="color:#cc0000;align:right;padding-bottom:0;"class="glyphicon glyphicon-remove"></span> </a></li>
</ul>
<?php }} ?>

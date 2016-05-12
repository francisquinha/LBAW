<?php /* Smarty version Smarty-3.1.15, created on 2016-05-10 20:00:31
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/common/menu_side.tpl" */ ?>
<?php /*%%SmartyHeaderCode:649875433573221bf316098-52371033%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2d485be7d4e813e244f977c8a63a73b7af034fc5' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/common/menu_side.tpl',
      1 => 1462792178,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '649875433573221bf316098-52371033',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_573221bf31f386_36107578',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_573221bf31f386_36107578')) {function content_573221bf31f386_36107578($_smarty_tpl) {?><!-- Blog Sidebar Widgets Column -->
<div class="col-md-4">
    <!-- Blog Search Well -->


    <div class="well">
        <a id="questiontitle">Search</a>
        <form class="input-group" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_search.php" method="get">
            <input type="text" name="search" class="form-control">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </span>
        </form>
        <!-- /.input-group -->
    </div>

<?php }} ?>

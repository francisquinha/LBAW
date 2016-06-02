<?php /* Smarty version Smarty-3.1.15, created on 2016-05-30 14:31:17
         compiled from "C:\xampp\htdocs\LBAW\site\templates\common\menu_side.tpl" */ ?>
<?php /*%%SmartyHeaderCode:6341574c32954ff6c1-20433184%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1f7d6920bc98d4b9949fcea6d806f5674fa2a607' => 
    array (
      0 => 'C:\\xampp\\htdocs\\LBAW\\site\\templates\\common\\menu_side.tpl',
      1 => 1464610036,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6341574c32954ff6c1-20433184',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_574c32955031a8_38569623',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_574c32955031a8_38569623')) {function content_574c32955031a8_38569623($_smarty_tpl) {?><!-- Blog Sidebar Widgets Column -->
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

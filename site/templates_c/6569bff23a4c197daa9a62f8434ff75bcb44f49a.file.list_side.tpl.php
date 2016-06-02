<?php /* Smarty version Smarty-3.1.15, created on 2016-05-30 14:31:17
         compiled from "C:\xampp\htdocs\LBAW\site\templates\tags\list_side.tpl" */ ?>
<?php /*%%SmartyHeaderCode:16715574c32955b6b77-50179211%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6569bff23a4c197daa9a62f8434ff75bcb44f49a' => 
    array (
      0 => 'C:\\xampp\\htdocs\\LBAW\\site\\templates\\tags\\list_side.tpl',
      1 => 1464610036,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16715574c32955b6b77-50179211',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
    'tags' => 0,
    'tag' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_574c32955c7912_21609240',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_574c32955c7912_21609240')) {function content_574c32955c7912_21609240($_smarty_tpl) {?><!-- Tags Well -->
<div class="well col-md-12">
    <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/tags/list_all.php"  style=" padding:0; padding:0;" id="questiontitle">
        <span style=" padding:0; padding:1rem; margin:0;" class="glyphicon glyphicon-tags"></span>Most Used Tags</a>
    <br>
    <div class="row">
                <?php  $_smarty_tpl->tpl_vars['tag'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['tag']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['tags']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['tag']->key => $_smarty_tpl->tpl_vars['tag']->value) {
$_smarty_tpl->tpl_vars['tag']->_loop = true;
?>
                    <a id="button_tag" style="display:inline-flex; padding-left:0; margin:0;"
                       href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_tag.php?tagid=<?php echo $_smarty_tpl->tpl_vars['tag']->value['tagid'];?>
">
                        </span><?php echo $_smarty_tpl->tpl_vars['tag']->value['tagname'];?>

                    </a>
                <?php } ?>
    </div>
    <!-- /.row -->
</div>

</div>
</div>
<!-- /.row -->
</div>
</div><?php }} ?>

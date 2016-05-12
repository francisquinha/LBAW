<?php /* Smarty version Smarty-3.1.15, created on 2016-05-10 20:00:31
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/tags/list_side.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1228767858573221bf46ff63-79722532%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd628bf968a7f6be3f9d7ff055ff6ef1e23d6f5a3' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/tags/list_side.tpl',
      1 => 1462900172,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1228767858573221bf46ff63-79722532',
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
  'unifunc' => 'content_573221bf4961d3_92141265',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_573221bf4961d3_92141265')) {function content_573221bf4961d3_92141265($_smarty_tpl) {?><!-- Tags Well -->
<div class="well col-md-12">
    <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/tags/list_all.php"  style=" padding:0; padding:0;" id="questiontitle">
        <span style=" padding:0; padding:1rem; margin:0;" class="glyphicon glyphicon-tags"></span>All Tags</a>
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

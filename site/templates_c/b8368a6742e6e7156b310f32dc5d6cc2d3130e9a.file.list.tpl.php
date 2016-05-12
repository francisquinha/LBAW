<?php /* Smarty version Smarty-3.1.15, created on 2016-05-11 01:47:18
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/tags/list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:212555984157327306c53e19-65122026%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b8368a6742e6e7156b310f32dc5d6cc2d3130e9a' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/tags/list.tpl',
      1 => 1462896593,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '212555984157327306c53e19-65122026',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'tags' => 0,
    'BASE_URL' => 0,
    'tag' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_57327306d0c569_02191437',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57327306d0c569_02191437')) {function content_57327306d0c569_02191437($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-12">
            <div class="tab-content">
                <a style=" font-size:150%; padding:0; padding-bottom:4rem;" id="questiontitle">
                    <span style=" padding:0; padding:1rem; margin:0;" class="glyphicon glyphicon-tags">
                    </span>All Tags
                </a>
                <br>
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

            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<?php }} ?>

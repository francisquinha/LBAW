<?php /* Smarty version Smarty-3.1.15, created on 2016-05-31 01:31:57
         compiled from "C:\xampp\htdocs\LBAW\site\templates\tags\list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:27318574ccd6daaf332-24505103%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5d76b68f4e351a9dcd52ee4f26757cf6d1f32899' => 
    array (
      0 => 'C:\\xampp\\htdocs\\LBAW\\site\\templates\\tags\\list.tpl',
      1 => 1464610036,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '27318574ccd6daaf332-24505103',
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
  'unifunc' => 'content_574ccd6daf1878_98476810',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_574ccd6daf1878_98476810')) {function content_574ccd6daf1878_98476810($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-7">
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
<?php }} ?>

<?php /* Smarty version Smarty-3.1.15, created on 2016-05-03 12:04:27
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/common/subheader.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3373500965722a86370b7a6-88864952%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9b0ebe8948e441630e18da9dd8eebed67dec97e4' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/common/subheader.tpl',
      1 => 1462269859,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3373500965722a86370b7a6-88864952',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5722a86370e708_56706603',
  'variables' => 
  array (
    'subtitle' => 0,
    'class_tab1' => 0,
    'style_tab1' => 0,
    'tab1' => 0,
    'class_tab2' => 0,
    'style_tab2' => 0,
    'tab2' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5722a86370e708_56706603')) {function content_5722a86370e708_56706603($_smarty_tpl) {?><br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <h3 id="topquestion"><?php echo $_smarty_tpl->tpl_vars['subtitle']->value;?>
</h3>
            <ul class="nav nav-tabs right-side">
                <li class="active"><a data-toggle="tab" href="#recent" class=<?php echo $_smarty_tpl->tpl_vars['class_tab1']->value;?>
 style=<?php echo $_smarty_tpl->tpl_vars['style_tab1']->value;?>
><?php echo $_smarty_tpl->tpl_vars['tab1']->value;?>
</a></li>
                <li><a data-toggle="tab" href="#hot" class=<?php echo $_smarty_tpl->tpl_vars['class_tab2']->value;?>
 style=<?php echo $_smarty_tpl->tpl_vars['style_tab2']->value;?>
><?php echo $_smarty_tpl->tpl_vars['tab2']->value;?>
</a></li>
            </ul>

            <div class="tab-content" >
                <div id="recent" class=" tab-pane fade in active">
<?php }} ?>

<?php /* Smarty version Smarty-3.1.15, created on 2016-05-13 14:51:00
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/categories/list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:69835629557358e21c87af2-16135740%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4b5016391e32009129aac8b25af84db9fdb7fe99' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/categories/list.tpl',
      1 => 1463143847,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '69835629557358e21c87af2-16135740',
  'function' => 
  array (
    'recursive_children' => 
    array (
      'parameter' => 
      array (
      ),
      'compiled' => '',
    ),
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_57358e21d87059_02489287',
  'variables' => 
  array (
    'child_categories' => 0,
    'BASE_URL' => 0,
    'child_category' => 0,
    'root_categories' => 0,
    'root_category' => 0,
  ),
  'has_nocache_code' => 0,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57358e21d87059_02489287')) {function content_57358e21d87059_02489287($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<?php if (!function_exists('smarty_template_function_recursive_children')) {
    function smarty_template_function_recursive_children($_smarty_tpl,$params) {
    $saved_tpl_vars = $_smarty_tpl->tpl_vars;
    foreach ($_smarty_tpl->smarty->template_functions['recursive_children']['parameter'] as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);};
    foreach ($params as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);}?>
    <ul class="tree noBullets">
        <?php  $_smarty_tpl->tpl_vars['child_category'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['child_category']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['child_categories']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['child_category']->key => $_smarty_tpl->tpl_vars['child_category']->value) {
$_smarty_tpl->tpl_vars['child_category']->_loop = true;
?>
            <li>
                <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_category.php?categoryid=<?php echo $_smarty_tpl->tpl_vars['child_category']->value['categoryid'];?>
"
                   class="force-grey">
                    <?php echo $_smarty_tpl->tpl_vars['child_category']->value['categoryname'];?>

                </a>
                <?php smarty_template_function_recursive_children($_smarty_tpl,array('child_categories'=>$_smarty_tpl->tpl_vars['child_categories_'.($_smarty_tpl->tpl_vars['child_category']->value['categoryid'])]->value));?>

            </li>
        <?php } ?>
    </ul>
<?php $_smarty_tpl->tpl_vars = $saved_tpl_vars;
foreach (Smarty::$global_tpl_vars as $key => $value) if(!isset($_smarty_tpl->tpl_vars[$key])) $_smarty_tpl->tpl_vars[$key] = $value;}}?>


<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-12">
            <div class="tab-content">
                <a style=" font-size:150%; padding:0; padding-bottom:4rem;" id="questiontitle">Categories</a>
                <br>
                <br>
                <ul class="browseAlign noBullets">
                    <?php  $_smarty_tpl->tpl_vars['root_category'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['root_category']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['root_categories']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['root_category']->key => $_smarty_tpl->tpl_vars['root_category']->value) {
$_smarty_tpl->tpl_vars['root_category']->_loop = true;
?>
                        <li>
                            <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_category.php?categoryid=<?php echo $_smarty_tpl->tpl_vars['root_category']->value['categoryid'];?>
"
                               class="force-grey">
                                <?php echo $_smarty_tpl->tpl_vars['root_category']->value['categoryname'];?>

                            </a>
                            <?php smarty_template_function_recursive_children($_smarty_tpl,array('child_categories'=>$_smarty_tpl->tpl_vars['child_categories_'.($_smarty_tpl->tpl_vars['root_category']->value['categoryid'])]->value));?>

                        </li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>
</div>
<?php }} ?>

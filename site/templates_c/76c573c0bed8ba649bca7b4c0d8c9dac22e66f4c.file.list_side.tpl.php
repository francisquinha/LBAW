<?php /* Smarty version Smarty-3.1.15, created on 2016-05-10 20:00:31
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/categories/list_side.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1296717760573221bf387c45-32919095%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '76c573c0bed8ba649bca7b4c0d8c9dac22e66f4c' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/categories/list_side.tpl',
      1 => 1462902147,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1296717760573221bf387c45-32919095',
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
  'variables' => 
  array (
    'child_categories' => 0,
    'child_category' => 0,
    'BASE_URL' => 0,
    'root_categories' => 0,
    'root_category' => 0,
  ),
  'has_nocache_code' => 0,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_573221bf44b034_02451066',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_573221bf44b034_02451066')) {function content_573221bf44b034_02451066($_smarty_tpl) {?><?php if (!function_exists('smarty_template_function_recursive_children')) {
    function smarty_template_function_recursive_children($_smarty_tpl,$params) {
    $saved_tpl_vars = $_smarty_tpl->tpl_vars;
    foreach ($_smarty_tpl->smarty->template_functions['recursive_children']['parameter'] as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);};
    foreach ($params as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);}?>
    <ul class="tree">
        <?php  $_smarty_tpl->tpl_vars['child_category'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['child_category']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['child_categories']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['child_category']->key => $_smarty_tpl->tpl_vars['child_category']->value) {
$_smarty_tpl->tpl_vars['child_category']->_loop = true;
?>
            <li>
                <?php ob_start();?><?php echo count($_smarty_tpl->tpl_vars['child_categories_'.($_smarty_tpl->tpl_vars['child_category']->value['categoryid'])]->value);?>
<?php $_tmp1=ob_get_clean();?><?php if ($_tmp1>0) {?>
                    <label class="tree-toggle nav-header">
                        <span style="font-size:70%;" class="glyphicon glyphicon-menu-right"></span>
                    </label>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_category.php?categoryid=<?php echo $_smarty_tpl->tpl_vars['child_category']->value['categoryid'];?>
"
                       class="force-grey2">
                        <?php echo $_smarty_tpl->tpl_vars['child_category']->value['categoryname'];?>

                    </a>
                <?php } else { ?>
                    <a class="cat" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_category.php?categoryid=<?php echo $_smarty_tpl->tpl_vars['child_category']->value['categoryid'];?>
">
                        <?php echo $_smarty_tpl->tpl_vars['child_category']->value['categoryname'];?>

                    </a>
                <?php }?>
                <?php smarty_template_function_recursive_children($_smarty_tpl,array('child_categories'=>$_smarty_tpl->tpl_vars['child_categories_'.($_smarty_tpl->tpl_vars['child_category']->value['categoryid'])]->value));?>

            </li>
        <?php } ?>
    </ul>
<?php $_smarty_tpl->tpl_vars = $saved_tpl_vars;
foreach (Smarty::$global_tpl_vars as $key => $value) if(!isset($_smarty_tpl->tpl_vars[$key])) $_smarty_tpl->tpl_vars[$key] = $value;}}?>


<div class="well col-md-12">
    <div class="browse">
        <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/categories/list_all.php" style=" padding:0; padding:0;" id="questiontitle">Categories</a>
        <br>
        <ul class="browseAlign">
            <?php  $_smarty_tpl->tpl_vars['root_category'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['root_category']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['root_categories']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['root_category']->key => $_smarty_tpl->tpl_vars['root_category']->value) {
$_smarty_tpl->tpl_vars['root_category']->_loop = true;
?>
                <li>
                    <?php ob_start();?><?php echo count($_smarty_tpl->tpl_vars['child_categories_'.($_smarty_tpl->tpl_vars['root_category']->value['categoryid'])]->value);?>
<?php $_tmp2=ob_get_clean();?><?php if ($_tmp2>0) {?>
                        <label class="tree-toggle nav-header">
                            <span style="font-size:70%;" class="glyphicon glyphicon-menu-right"></span>
                        </label>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_category.php?categoryid=<?php echo $_smarty_tpl->tpl_vars['root_category']->value['categoryid'];?>
"
                           class="force-grey2">
                            <?php echo $_smarty_tpl->tpl_vars['root_category']->value['categoryname'];?>

                        </a>
                    <?php } else { ?>
                        <a class="cat" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_category.php?categoryid=<?php echo $_smarty_tpl->tpl_vars['root_category']->value['categoryid'];?>
">
                            <?php echo $_smarty_tpl->tpl_vars['root_category']->value['categoryname'];?>

                        </a>
                    <?php }?>
                    <?php smarty_template_function_recursive_children($_smarty_tpl,array('child_categories'=>$_smarty_tpl->tpl_vars['child_categories_'.($_smarty_tpl->tpl_vars['root_category']->value['categoryid'])]->value));?>

                </li>
            <?php } ?>
        </ul>
    </div>
</div>


<?php }} ?>

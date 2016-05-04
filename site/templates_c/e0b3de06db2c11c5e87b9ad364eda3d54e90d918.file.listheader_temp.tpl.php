<?php /* Smarty version Smarty-3.1.15, created on 2016-05-03 10:48:24
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/questions/listheader_temp.tpl" */ ?>
<?php /*%%SmartyHeaderCode:238574582572865d81b7bd4-96401435%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e0b3de06db2c11c5e87b9ad364eda3d54e90d918' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/questions/listheader_temp.tpl',
      1 => 1462265259,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '238574582572865d81b7bd4-96401435',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'questions' => 0,
    'question' => 0,
    'tag' => 0,
    'last_question_id' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_572865d82a8588_97841578',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_572865d82a8588_97841578')) {function content_572865d82a8588_97841578($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php $_smarty_tpl->tpl_vars["Subtitle"] = new Smarty_variable("Top Questions", null, 0);?>
<?php echo $_smarty_tpl->getSubTemplate ('common/subheader.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<?php  $_smarty_tpl->tpl_vars['question'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['question']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['questions']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['question']->key => $_smarty_tpl->tpl_vars['question']->value) {
$_smarty_tpl->tpl_vars['question']->_loop = true;
?>
    <div id="question">
        <table class="question-table" style="width:100%;">
            <tr style="padding:1rem;">
                <td style="width:100%; align:center;padding:1rem;"><a href="#"
                                                                      style="font-weight: 900; align:center;font-family: 'QuanticoRegular'; padding-left:1rem; padding-right:1rem; "><?php echo $_smarty_tpl->tpl_vars['question']->value['title'];?>
</a>
                </td>
            </tr>
            <tr>
                <td style="padding:1rem; "><a href="#"
                                              style=" font-weight: 900;font-size:80%;  float:left; color:#00529B;"><?php echo $_smarty_tpl->tpl_vars['question']->value['name'];?>
</a>
                    <p style="padding-left:1rem; font-size:60%; float:left;">asked <?php echo $_smarty_tpl->tpl_vars['question']->value['timeago'];?>
</p></td>
                <td style="width:30px; padding-left:1rem; padding-right:1rem; align:right;"><a href="#"
                                                                                               style=" font-weight: 400;font-size:70%; color: #9F6000;"><?php echo $_smarty_tpl->tpl_vars['question']->value['categoryname'];?>
</a>
                </td>
            </tr>
        </table>

        <div id="questionbuttonsection" style="padding-bottom: 0;">
            <a href="#" class="btn btn-primary btn-sm btn-success"><span
                        class="glyphicon glyphicon-thumbs-up"></span> <?php echo $_smarty_tpl->tpl_vars['question']->value['postrating'];?>
</a>
            <a href="#" class="btn btn-primary btn-sm btn-warning"><span
                        class="fa fa-pencil"></span> <?php echo $_smarty_tpl->tpl_vars['question']->value['answers'];?>
</a>
            <a href="#" class="btn btn-sm btn-primary"><span
                        class="glyphicon glyphicon-eye-open"></span> <?php echo $_smarty_tpl->tpl_vars['question']->value['views'];?>
</a>
        </div>
        <div id="tagsofquestion">
            <?php  $_smarty_tpl->tpl_vars['tag'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['tag']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['question']->value['tagarray']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['tag']->key => $_smarty_tpl->tpl_vars['tag']->value) {
$_smarty_tpl->tpl_vars['tag']->_loop = true;
?>
                <a class="Taag btn btn-danger" role="button"><span class="glyphicon glyphicon-tag"></span><?php echo $_smarty_tpl->tpl_vars['tag']->value;?>
</a>
            <?php } ?>
        </div>
    </div>
    <hr>
<?php } ?>

</div>
</div>
</div>


<script>last_question_id = <?php echo $_smarty_tpl->tpl_vars['last_question_id']->value;?>
</script>

<!--<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/tweets.js"></script>-->
<?php echo $_smarty_tpl->getSubTemplate ('right-side/right-side.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php }} ?>

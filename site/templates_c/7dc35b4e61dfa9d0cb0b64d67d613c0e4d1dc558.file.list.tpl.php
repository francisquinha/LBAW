<?php /* Smarty version Smarty-3.1.15, created on 2016-04-29 02:48:04
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/questions/list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:43455306657223f788144e2-81551863%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7dc35b4e61dfa9d0cb0b64d67d613c0e4d1dc558' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/questions/list.tpl',
      1 => 1461890755,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '43455306657223f788144e2-81551863',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_57223f788fd435_17743976',
  'variables' => 
  array (
    'questions' => 0,
    'question' => 0,
    'tag' => 0,
    'last_question_id' => 0,
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57223f788fd435_17743976')) {function content_57223f788fd435_17743976($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <h3 id="topquestion">Search Results</h3>
            <ul class="nav nav-tabs right-side">
            </ul>

            <div class="tab-content">
                <div id="recent" class=" tab-pane fade in active">

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
                                    <td style="padding:1rem; max-width: 100px;"><a href="#"
                                                                  style=" font-weight: 900;font-size:80%;  float:left; color:#00529B;"><?php echo $_smarty_tpl->tpl_vars['question']->value['name'];?>
</a>
                                        <p style="padding-left:1rem; font-size:60%; float:left;">
                                            asked <?php echo $_smarty_tpl->tpl_vars['question']->value['timeago'];?>
</p></td>
                                    <td style="min-width:200px; padding-left:1rem; padding-right:1rem; align:right;"><a
                                                href="#"
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
                                    <a class="Taag btn btn-danger" role="button"><span
                                                class="glyphicon glyphicon-tag"></span><?php echo $_smarty_tpl->tpl_vars['tag']->value;?>
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

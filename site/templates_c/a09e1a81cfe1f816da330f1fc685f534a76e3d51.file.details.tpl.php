<?php /* Smarty version Smarty-3.1.15, created on 2016-05-04 19:37:04
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/questions/details.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13393423335729f91bb1b297-39000214%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a09e1a81cfe1f816da330f1fc685f534a76e3d51' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/questions/details.tpl',
      1 => 1462383416,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13393423335729f91bb1b297-39000214',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5729f91bc51dc2_40509352',
  'variables' => 
  array (
    'questions' => 0,
    'BASE_URL' => 0,
    'question' => 0,
    'tag' => 0,
    'answers' => 0,
    'answer' => 0,
    'last_question_id' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5729f91bc51dc2_40509352')) {function content_5729f91bc51dc2_40509352($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-12">
            <div class="tab-content">
                <div id="recent" class=" tab-pane fade in active">
                    <?php  $_smarty_tpl->tpl_vars['question'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['question']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['questions']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['question']->key => $_smarty_tpl->tpl_vars['question']->value) {
$_smarty_tpl->tpl_vars['question']->_loop = true;
?>
                        <div id="question">
                            <div id="questiontitlesquare">
                                <a id="qpagequestiontitle"
                                   href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/details.php?questionid=<?php echo $_smarty_tpl->tpl_vars['question']->value['questionid'];?>
">
                                    <?php echo $_smarty_tpl->tpl_vars['question']->value['title'];?>

                                </a>
                            </div>
                            <div id="questionbodysquare">
                                <?php echo $_smarty_tpl->tpl_vars['question']->value['versionbody'];?>

                            </div>
                            <br>
                            <a href="#" class="btn-lg" ><span
                                        class="glyphicon glyphicon-thumbs-up"></span></a>
                            <br>
                            <div id="questionusersquare"><a id="questionusers" href="#"><?php echo $_smarty_tpl->tpl_vars['question']->value['name'];?>
</a>
                                <span id="timeago">asked <?php echo $_smarty_tpl->tpl_vars['question']->value['timeago'];?>
</span></div>
                            <div id="questioncategorysquare"><a href="#"><?php echo $_smarty_tpl->tpl_vars['question']->value['categoryname'];?>
</a>
                            </div>


                            <div id="questionbuttonsection" >
                                <a href="#" class="-success" ><span
                                            class="glyphicon glyphicon-thumbs-up"></span> <?php echo $_smarty_tpl->tpl_vars['question']->value['postrating'];?>
</a>
                                <a href="#" class="-warning"><span
                                            class="fa fa-pencil"></span> <?php echo $_smarty_tpl->tpl_vars['question']->value['answers'];?>
</a>
                                <a href="#" class="-primary"><span
                                            class="glyphicon glyphicon-eye-open"></span> <?php echo $_smarty_tpl->tpl_vars['question']->value['views'];?>
</a>
                            </div>
                            <div id="tagsofquestion">
                                <?php  $_smarty_tpl->tpl_vars['tag'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['tag']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['question']->value['tagarray']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['tag']->key => $_smarty_tpl->tpl_vars['tag']->value) {
$_smarty_tpl->tpl_vars['tag']->_loop = true;
?>
                                    <a id="button_tag" style="display:inline-flex;"><span
                                                class="glyphicon glyphicon-tag"></span><?php echo $_smarty_tpl->tpl_vars['tag']->value;?>
</a>
                                <?php } ?>
                            </div>
                        </div>
                        <br>
                        <hr>
                    <?php } ?>

                    <?php  $_smarty_tpl->tpl_vars['answer'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['answer']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['answers']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['answer']->key => $_smarty_tpl->tpl_vars['answer']->value) {
$_smarty_tpl->tpl_vars['answer']->_loop = true;
?>
                        <div id="answer">
                            <div id="answerbodysquare">
                                <?php echo $_smarty_tpl->tpl_vars['answer']->value['versionbody'];?>

                            </div>
                            <div id="answerusersquare">
                                <a id="answerusers" href="#"><?php echo $_smarty_tpl->tpl_vars['answer']->value['name'];?>
</a>
                                <span id="timeago">answered <?php echo $_smarty_tpl->tpl_vars['answer']->value['timeago'];?>
</span>
                            </div>
                            <div id="questionbuttonsection">
                                <a href="#" class="-success">
                                    <span class="glyphicon glyphicon-thumbs-up"></span>
                                    <?php echo $_smarty_tpl->tpl_vars['answer']->value['postrating'];?>

                                </a>
                            </div>
                        </div>
                        <br>
                        <hr>
                    <?php } ?>

                        <div class="form-group">
                            <textarea id="message" class="form-control" rows="5" placeholder="Enter your message" required></textarea>
                        </div>
                        <button type="submit" id="form-submit" class="btn btn-success btn-lg pull-right ">Answer</button>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
</div>

        <script>last_question_id = <?php echo $_smarty_tpl->tpl_vars['last_question_id']->value;?>
</script>

        <!--<script src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
javascript/tweets.js"></script>-->
<?php }} ?>

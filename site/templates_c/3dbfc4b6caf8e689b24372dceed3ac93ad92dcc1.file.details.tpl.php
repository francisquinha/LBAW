<?php /* Smarty version Smarty-3.1.15, created on 2016-06-02 14:56:06
         compiled from "C:\xampp\htdocs\LBAW\site\templates\questions\details.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3782574c5c5f22d722-22644391%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3dbfc4b6caf8e689b24372dceed3ac93ad92dcc1' => 
    array (
      0 => 'C:\\xampp\\htdocs\\LBAW\\site\\templates\\questions\\details.tpl',
      1 => 1464872159,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3782574c5c5f22d722-22644391',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_574c5c5f2b23e3_32736427',
  'variables' => 
  array (
    'questions' => 0,
    'BASE_URL' => 0,
    'question' => 0,
    'tag' => 0,
    'bestanswers' => 0,
    'bestanswer' => 0,
    'answers' => 0,
    'answer' => 0,
    'last_question_id' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_574c5c5f2b23e3_32736427')) {function content_574c5c5f2b23e3_32736427($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-7">
            <br>
            <?php  $_smarty_tpl->tpl_vars['question'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['question']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['questions']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['question']->key => $_smarty_tpl->tpl_vars['question']->value) {
$_smarty_tpl->tpl_vars['question']->_loop = true;
?>
                <div id="questionpq">
                    <div id="questiontitlesquare">
                        <a id="qpagequestiontitle"
                           href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/details.php?questionid=<?php echo $_smarty_tpl->tpl_vars['question']->value['questionid'];?>
">
                            <?php echo $_smarty_tpl->tpl_vars['question']->value['title'];?>

                        </a>
                    </div>
                    <div id="questionbodysquare" align="left">
                        <?php echo $_smarty_tpl->tpl_vars['question']->value['versionbody'];?>

                    </div>
                    <br>
                    <div id="questionusersquare"><a id="questionusers" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/members/details.php?membersid=<?php echo $_smarty_tpl->tpl_vars['question']->value['postauthorid'];?>
"><?php echo $_smarty_tpl->tpl_vars['question']->value['name'];?>
</a>
                        <span id="timeago">asked <?php echo $_smarty_tpl->tpl_vars['question']->value['timeago'];?>
</span></div>
                    <div id="questioncategorysquare">
                        <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_category.php?categoryid=<?php echo $_smarty_tpl->tpl_vars['question']->value['categoryid'];?>
">
                            <?php echo $_smarty_tpl->tpl_vars['question']->value['categoryname'];?>

                        </a>
                    </div>

                    <div id="questionvotesection">
                        <a href="#" class="btn-lg" style="color:black;"><span
                                    class="glyphicon glyphicon-thumbs-up"
                                    style="padding:0; margin:0;color:#4aaf51;"></span> <?php echo $_smarty_tpl->tpl_vars['question']->value['postrating'];?>

                            <span
                                    class="glyphicon glyphicon-thumbs-down"
                                    style="padding:0; margin:0;color:#c9302c;"></span></a>
                    </div>

                    <div id="tagsofquestion">
                        <?php  $_smarty_tpl->tpl_vars['tag'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['tag']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['question']->value['tagarray']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['tag']->key => $_smarty_tpl->tpl_vars['tag']->value) {
$_smarty_tpl->tpl_vars['tag']->_loop = true;
?>
                            <a id="button_tag" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_tag.php?tagid=<?php echo $_smarty_tpl->tpl_vars['tag']->value['tagid'];?>
"
                               style="display:inline-flex;">
                                <span class="glyphicon glyphicon-tag"></span><?php echo $_smarty_tpl->tpl_vars['tag']->value['tagname'];?>

                            </a>
                        <?php } ?>
                    </div>

                    <div id="questionbuttonsection">
                        <a>
                            <span class="fa fa-pencil"></span>
                            <?php echo $_smarty_tpl->tpl_vars['question']->value['answers'];?>

                        </a>
                        <a>
                            <span class="glyphicon glyphicon-eye-open"></span>
                            <?php echo $_smarty_tpl->tpl_vars['question']->value['views'];?>

                        </a>
                    </div>

                </div>

                <hr style="margin-top:0;">
            <?php } ?>


            <?php  $_smarty_tpl->tpl_vars['bestanswer'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['bestanswer']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['bestanswers']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['bestanswer']->key => $_smarty_tpl->tpl_vars['bestanswer']->value) {
$_smarty_tpl->tpl_vars['bestanswer']->_loop = true;
?>
                <div class="bestanswer">
                    <span class="glyphicon glyphicon-star" style="float:right;color:#4aaf51;"></span>
                    <div id="answerbodysquare" align="left">
                        <?php echo $_smarty_tpl->tpl_vars['bestanswer']->value['versionbody'];?>

                    </div>
                    <br>
                    <div id="answerusersquare">
                        <a id="answerusers" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/members/details.php?membersid=<?php echo $_smarty_tpl->tpl_vars['bestanswer']->value['postauthorid'];?>
"><?php echo $_smarty_tpl->tpl_vars['bestanswer']->value['name'];?>
</a>
                        <span id="timeago">answered <?php echo $_smarty_tpl->tpl_vars['bestanswer']->value['timeago'];?>
</span>
                    </div>
                    <div id="questionvotesection">
                        <a href="#" class="btn-lg" style="color:black;"><span
                                    class="glyphicon glyphicon-thumbs-up"
                                    style="padding:0; margin:0;color:#4aaf51;"></span> <?php echo $_smarty_tpl->tpl_vars['bestanswer']->value['postrating'];?>

                            <span
                                    class="glyphicon glyphicon-thumbs-down"
                                    style="padding:0; margin:0;color:#c9302c;"></span></a>
                    </div>


                </div>
                <hr style="margin-top:0;">
            <?php } ?>

            <?php  $_smarty_tpl->tpl_vars['answer'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['answer']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['answers']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['answer']->key => $_smarty_tpl->tpl_vars['answer']->value) {
$_smarty_tpl->tpl_vars['answer']->_loop = true;
?>
                <div id="answer">
                    <div id="answerbodysquare" align="left">
                        <?php echo $_smarty_tpl->tpl_vars['answer']->value['versionbody'];?>

                    </div>
                    <br>

                    <div id="answerusersquare">
                        <a id="answerusers" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/members/details.php?membersid=<?php echo $_smarty_tpl->tpl_vars['answer']->value['postauthorid'];?>
"><?php echo $_smarty_tpl->tpl_vars['answer']->value['name'];?>
</a>
                        <span id="timeago">answered <?php echo $_smarty_tpl->tpl_vars['answer']->value['timeago'];?>
</span>
                    </div>
                    <div id="questionvotesection">
                        <a href="#" class="btn-lg" style="color:black;"><span
                                    class="glyphicon glyphicon-thumbs-up"
                                    style="padding:0; margin:0;color:#4aaf51;"></span> <?php echo $_smarty_tpl->tpl_vars['answer']->value['postrating'];?>

                            <span
                                    class="glyphicon glyphicon-thumbs-down"
                                    style="padding:0; margin:0;color:#c9302c;"></span></a>
                    </div>

                </div>
                <hr>
            <?php } ?>


                <button id="edit" class="btn btn-primary" type="button">Answer</button>

            <form id="send" action="javascript:send_answer(<?php echo $_GET['questionid'];?>
)" name="confirmationForm">

                  <!--  <textarea id="confirmationText" class="text" cols="86" rows ="20" name="body"></textarea>
                    <input type="submit" value="Post" class="submitButton">-->

                <div class="summernote"></div>
            </form>



        </div>
<!--<script>last_question_id=<?php echo $_smarty_tpl->tpl_vars['last_question_id']->value;?>
</script>-->
<!--<script src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
javascript/tweets.js"></script>--><?php }} ?>

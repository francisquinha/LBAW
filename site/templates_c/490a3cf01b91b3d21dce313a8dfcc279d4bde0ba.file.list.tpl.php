<?php /* Smarty version Smarty-3.1.15, created on 2016-05-30 14:31:17
         compiled from "C:\xampp\htdocs\LBAW\site\templates\questions\list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:782574c3295457160-59418475%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '490a3cf01b91b3d21dce313a8dfcc279d4bde0ba' => 
    array (
      0 => 'C:\\xampp\\htdocs\\LBAW\\site\\templates\\questions\\list.tpl',
      1 => 1464610036,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '782574c3295457160-59418475',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'subtitle' => 0,
    'style_tab1' => 0,
    'class_tab1' => 0,
    'tab1' => 0,
    'class_tab2' => 0,
    'style_tab2' => 0,
    'tab2' => 0,
    'questions' => 0,
    'BASE_URL' => 0,
    'question' => 0,
    'tag' => 0,
    'last_question_id' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_574c32954a35d4_55669742',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_574c32954a35d4_55669742')) {function content_574c32954a35d4_55669742($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<script language="javascript">

    function myFunction(){

            var status=true;

            if(status) {
                $('.alert-success').show();
            }
    }
</script>

<div class = "alert alert-success hide">
    <button type = "button" class = "close" data-dismiss = "alert" aria-hidden = "true">
        &times;
    </button>

    Success! Well done its submitted.
</div>

<div class = "alert alert-unsuccess hide">
    <button type = "button" class = "close" data-dismiss = "alert" aria-hidden = "true">
        &times;
    </button>

    Error ! Change few things.
</div>

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-7">
            <h3 id="topquestion"><?php echo $_smarty_tpl->tpl_vars['subtitle']->value;?>
</h3>
            <ul class="nav nav-tabs right-side">
                <li class="active"><a id="tabname" data-toggle="tab" href="#recent" style=<?php echo $_smarty_tpl->tpl_vars['style_tab1']->value;?>
><span
                                class=<?php echo $_smarty_tpl->tpl_vars['class_tab1']->value;?>
 style=<?php echo $_smarty_tpl->tpl_vars['style_tab1']->value;?>
> </span><?php echo $_smarty_tpl->tpl_vars['tab1']->value;?>
</a></li>
                <li><a id="tabname" data-toggle="tab" href="#hot" style=<?php echo $_smarty_tpl->tpl_vars['style_tab1']->value;?>
><span
                                class=<?php echo $_smarty_tpl->tpl_vars['class_tab2']->value;?>
 style=<?php echo $_smarty_tpl->tpl_vars['style_tab2']->value;?>
> </span><?php echo $_smarty_tpl->tpl_vars['tab2']->value;?>
</a></li>
            </ul>

            <div class="tab-content">
                <div id="recent" class=" tab-pane fade in active">

                    <?php  $_smarty_tpl->tpl_vars['question'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['question']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['questions']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['question']->key => $_smarty_tpl->tpl_vars['question']->value) {
$_smarty_tpl->tpl_vars['question']->_loop = true;
?>
                        <div id="question">
                            <div id="questiontitlesquare">
                                <a id="questiontitle" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/details.php?questionid=<?php echo $_smarty_tpl->tpl_vars['question']->value['questionid'];?>
">
                                    <?php echo $_smarty_tpl->tpl_vars['question']->value['title'];?>

                                </a>
                            </div>
                            <div id="questionusersquare">
                                <a id="questionusers" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/members/details.php?membersid=<?php echo $_smarty_tpl->tpl_vars['question']->value['postauthorid'];?>
">
                                    <?php echo $_smarty_tpl->tpl_vars['question']->value['name'];?>

                                </a>
                                <span id="timeago">
                                    asked <?php echo $_smarty_tpl->tpl_vars['question']->value['timeago'];?>

                                </span>
                            </div>
                            <div id="questioncategorysquare">
                                <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_category.php?categoryid=<?php echo $_smarty_tpl->tpl_vars['question']->value['categoryid'];?>
">
                                    <?php echo $_smarty_tpl->tpl_vars['question']->value['categoryname'];?>

                                </a>
                            </div>
                            <div id="questionbuttonsection">
                                <a class="btn btn-primary btn-sm btn-success">
                                    <span class="glyphicon glyphicon-thumbs-up"></span>
                                    <?php echo $_smarty_tpl->tpl_vars['question']->value['postrating'];?>

                                </a>
                                <a class="btn btn-primary btn-sm btn-warning">
                                    <span class="fa fa-pencil"></span>
                                    <?php echo $_smarty_tpl->tpl_vars['question']->value['answers'];?>

                                </a>
                                <a class="btn btn-sm btn-primary">
                                    <span class="glyphicon glyphicon-eye-open"></span>
                                    <?php echo $_smarty_tpl->tpl_vars['question']->value['views'];?>

                                </a>
                            </div>
                            <div id="tagsofquestion">
                                <?php  $_smarty_tpl->tpl_vars['tag'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['tag']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['question']->value['tagarray']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['tag']->key => $_smarty_tpl->tpl_vars['tag']->value) {
$_smarty_tpl->tpl_vars['tag']->_loop = true;
?>
                                    <a id="button_tag" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_tag.php?tagid=<?php echo $_smarty_tpl->tpl_vars['tag']->value['tagid'];?>
" style="display:inline-flex;">
                                        <span class="glyphicon glyphicon-tag"></span>
                                        <?php echo $_smarty_tpl->tpl_vars['tag']->value['tagname'];?>

                                    </a>
                                <?php } ?>
                            </div>
                        </div>
                        <hr>
                    <?php } ?>

                </div>
            </div>
        </div>


<!--        <script>last_question_id = <?php echo $_smarty_tpl->tpl_vars['last_question_id']->value;?>
</script>-->

        <!--<script src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
javascript/tweets.js"></script>-->
<?php }} ?>

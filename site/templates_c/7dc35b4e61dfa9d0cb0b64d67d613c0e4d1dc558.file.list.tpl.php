<?php /* Smarty version Smarty-3.1.15, created on 2016-05-03 18:13:36
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/questions/list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:43455306657223f788144e2-81551863%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7dc35b4e61dfa9d0cb0b64d67d613c0e4d1dc558' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/questions/list.tpl',
      1 => 1462292001,
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
    'subtitle' => 0,
    'style_tab1' => 0,
    'class_tab1' => 0,
    'tab1' => 0,
    'class_tab2' => 0,
    'style_tab2' => 0,
    'tab2' => 0,
    'questions' => 0,
    'question' => 0,
    'tag' => 0,
    'last_question_id' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57223f788fd435_17743976')) {function content_57223f788fd435_17743976($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-7">
            <h3 id="topquestion"><?php echo $_smarty_tpl->tpl_vars['subtitle']->value;?>
</h3>
            <ul class="nav nav-tabs right-side">
                <li  class="active"><a id="tabname" data-toggle="tab" href="#recent" style=<?php echo $_smarty_tpl->tpl_vars['style_tab1']->value;?>
><span class=<?php echo $_smarty_tpl->tpl_vars['class_tab1']->value;?>
 style=<?php echo $_smarty_tpl->tpl_vars['style_tab1']->value;?>
> </span><?php echo $_smarty_tpl->tpl_vars['tab1']->value;?>
</a></li>
                <li><a id="tabname" data-toggle="tab" href="#hot" style=<?php echo $_smarty_tpl->tpl_vars['style_tab1']->value;?>
><span class=<?php echo $_smarty_tpl->tpl_vars['class_tab2']->value;?>
 style=<?php echo $_smarty_tpl->tpl_vars['style_tab2']->value;?>
> </span><?php echo $_smarty_tpl->tpl_vars['tab2']->value;?>
</a></li>
            </ul>

            <div class="tab-content" >
                <div id="recent" class=" tab-pane fade in active">

<?php  $_smarty_tpl->tpl_vars['question'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['question']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['questions']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['question']->key => $_smarty_tpl->tpl_vars['question']->value) {
$_smarty_tpl->tpl_vars['question']->_loop = true;
?>
    <div id="question">
        <div id="questiontitlesquare"><a id="questiontitle" href="#"><?php echo $_smarty_tpl->tpl_vars['question']->value['title'];?>
</a>
        </div>



        <div id="questionusersquare"><a id="questionusers" href="#"
            ><?php echo $_smarty_tpl->tpl_vars['question']->value['name'];?>
</a>
            <span id="timeago">asked <?php echo $_smarty_tpl->tpl_vars['question']->value['timeago'];?>
</span></div>
        <div id="questioncategorysquare"><a href="#"><?php echo $_smarty_tpl->tpl_vars['question']->value['categoryname'];?>
</a>
        </div>





        <div id="questionbuttonsection">
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
                    <a id="button_tag" style="display:inline-flex;"><span class="glyphicon glyphicon-tag"></span><?php echo $_smarty_tpl->tpl_vars['tag']->value;?>
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

<!--<script src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
javascript/tweets.js"></script>-->
<?php }} ?>

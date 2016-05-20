<?php /* Smarty version Smarty-3.1.15, created on 2016-05-19 14:05:30
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/users/list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:12031350415735954f5e0d15-72149531%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bd806a4e0254c46a55bd0186aa8306efaf03cffd' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/users/list.tpl',
      1 => 1463659522,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12031350415735954f5e0d15-72149531',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5735954f69bf73_27496858',
  'variables' => 
  array (
    'all' => 0,
    'BASE_URL' => 0,
    'member' => 0,
    'membersa' => 0,
    'membersb' => 0,
    'membersc' => 0,
    'membersd' => 0,
    'memberse' => 0,
    'membersf' => 0,
    'membersg' => 0,
    'membersh' => 0,
    'membersi' => 0,
    'membersj' => 0,
    'membersk' => 0,
    'membersl' => 0,
    'membersm' => 0,
    'membersn' => 0,
    'memberso' => 0,
    'membersp' => 0,
    'membersq' => 0,
    'membersr' => 0,
    'memberss' => 0,
    'memberst' => 0,
    'membersu' => 0,
    'membersv' => 0,
    'membersw' => 0,
    'membersx' => 0,
    'membersy' => 0,
    'membersz' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5735954f69bf73_27496858')) {function content_5735954f69bf73_27496858($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-7">


            <a style=" font-size:150%; padding:0; padding-bottom:4rem;" id="questiontitle">
                Users
            </a>

            <br>
            <br>
            <ul class="pagination" style="font-size: 80%; padding:0;margin:0;">
                <li class="active"><a data-toggle="tab" href="#ALL">ALL</a></li>
                <li><a data-toggle="tab" href="#A">A</a></li>
                <li><a data-toggle="tab" href="#B">B</a></li>
                <li><a data-toggle="tab" href="#C">C</a></li>
                <li><a data-toggle="tab" href="#D">D</a></li>
                <li><a data-toggle="tab" href="#E">E</a></li>
                <li><a data-toggle="tab" href="#F">F</a></li>
                <li><a data-toggle="tab" href="#G">G</a></li>
                <li><a data-toggle="tab" href="#H">H</a></li>
                <li><a data-toggle="tab" href="#I">I</a></li>
                <li><a data-toggle="tab" href="#J">J</a></li>
                <li><a data-toggle="tab" href="#K">K</a></li>
                <li><a data-toggle="tab" href="#L">L</a></li>
                <li><a data-toggle="tab" href="#M">M</a></li>
                <li><a data-toggle="tab" href="#N">N</a></li>
                <li><a data-toggle="tab" href="#O">O</a></li>
                <li><a data-toggle="tab" href="#P">P</a></li>
                <li><a data-toggle="tab" href="#Q">Q</a></li>
                <li><a data-toggle="tab" href="#R">R</a></li>
                <li><a data-toggle="tab" href="#S" style="margin-left: 45px;">S</a></li>
                <li><a data-toggle="tab" href="#T">T</a></li>
                <li><a data-toggle="tab" href="#U">U</a></li>
                <li><a data-toggle="tab" href="#V">V</a></li>
                <li><a data-toggle="tab" href="#W">W</a></li>
                <li><a data-toggle="tab" href="#X">X</a></li>
                <li><a data-toggle="tab" href="#Y">Y</a></li>
                <li><a data-toggle="tab" href="#Z">Z</a></li>
            </ul>


            <div class="tab-content">
                <div id="ALL" class="tab-pane fade in active">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['all']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
/img/members/member3.png" height="80" width="80">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>

                </div>
                <div id="A" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersa']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
/img/members/member2.png" height="80" width="80">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="B" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersb']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="C" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersc']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="D" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersd']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="E" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['memberse']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="F" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersf']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="G" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersg']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="H" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersh']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="I" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersi']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="J" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersj']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="K" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersk']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="L" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersl']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="M" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersm']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="N" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersn']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="O" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['memberso']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="P" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersp']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="Q" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersq']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="R" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersr']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="S" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['memberss']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="T" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['memberst']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="U" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersu']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="V" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersv']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="W" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersw']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="X" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersx']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="Y" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersy']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>
                <div id="Z" class="tab-pane fade">
                    <br>
                    <br>

                    <?php  $_smarty_tpl->tpl_vars['member'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['member']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['membersz']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['member']->key => $_smarty_tpl->tpl_vars['member']->value) {
$_smarty_tpl->tpl_vars['member']->_loop = true;
?>
                        <ul class="userlist">
                            <li class="userlistusername"><a><?php echo $_smarty_tpl->tpl_vars['member']->value['username'];?>
</a></li>
                            <li class="userlistmemberrating"><?php echo $_smarty_tpl->tpl_vars['member']->value['memberrating'];?>
</li>
                        </ul>
                    <?php } ?>
                </div>


            </div>
        </div>



<?php }} ?>

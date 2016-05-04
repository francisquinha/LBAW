<?php /* Smarty version Smarty-3.1.15, created on 2016-05-04 13:30:36
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/common/menu_side.tpl" */ ?>
<?php /*%%SmartyHeaderCode:21047243155728c25c620839-27304064%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2d485be7d4e813e244f977c8a63a73b7af034fc5' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/common/menu_side.tpl',
      1 => 1462361420,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '21047243155728c25c620839-27304064',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5728c25c699e67_82450566',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5728c25c699e67_82450566')) {function content_5728c25c699e67_82450566($_smarty_tpl) {?><!-- Blog Sidebar Widgets Column -->
<div class="col-md-4">
    <!-- Blog Search Well -->


    <div class="well">
        <a id="questiontitle">Search</a>
        <form class="input-group" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/list_search.php" method="post">
            <input type="text" name="search" class="form-control">
         <span class="input-group-btn">
            <button class="btn btn-default" type="submit">
                <span class="glyphicon glyphicon-search"></span>
            </button>
         </span>
        </form>
        <!-- /.input-group -->
    </div>
    <div class="well col-md-12">
        <div class="browse">
            <a id="questiontitle">Categories</a>
            <ul class="browseAlign">
                <li><label class="tree-toggle nav-header"><span class="glyphicon glyphicon-menu-right"></span>Bootstrap</label>
                    <ul class="tree">
                        <li><a href="#">JavaScript</a></li>
                        <li><a href="#">CSS</a></li>
                        <li><label class="tree-toggle nav-header"><span class="glyphicon glyphicon-menu-right"></span>Buttons</label>
                            <ul class="tree">
                                <li><a href="#">Colors</a></li>
                                <li><a href="#">Sizes</a></li>
                                <li><label class="tree-toggle nav-header"><span
                                                class="glyphicon glyphicon-menu-right"></span>Forms</label>
                                    <ul class="tree">
                                        <li><a href="#">Horizontal</a></li>
                                        <li><a href="#">Vertical</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="divider"></li>
                <li><label class="tree-toggle nav-header"><span class="glyphicon glyphicon-menu-right"></span>Responsive</label>
                    <ul class="tree">
                        <li><a href="#">Overview</a></li>
                        <li><a href="#">CSS</a></li>
                        <li><label class="tree-toggle nav-header"><span class="glyphicon glyphicon-menu-right"></span>Media
                                Queries</label>
                            <ul class="tree">
                                <li><a href="#">Text</a></li>
                                <li><a href="#">Images</a></li>
                                <li><label class="tree-toggle nav-header"><span
                                                class="glyphicon glyphicon-menu-right"></span>Mobile Devices</label>
                                    <ul class="tree">
                                        <li><a href="#">iPhone</a></li>
                                        <li><a href="#">Samsung</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><label class="tree-toggle nav-header"><span class="glyphicon glyphicon-menu-right"></span>Coding</label>
                            <ul class="tree">
                                <li><a href="#">JavaScript</a></li>
                                <li><a href="#">jQuery</a></li>
                                <li><label class="tree-toggle nav-header"><span
                                                class="glyphicon glyphicon-menu-right"></span>HTML DOM</label>
                                    <ul class="tree">
                                        <li><a href="#">DOM Elements</a></li>
                                        <li><a href="#">Recursive</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

<?php }} ?>

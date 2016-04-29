<?php /* Smarty version Smarty-3.1.15, created on 2016-04-29 01:53:08
         compiled from "/opt/lbaw/lbaw1553/public_html/templates/right-side/right-side.tpl" */ ?>
<?php /*%%SmartyHeaderCode:42377209157225d302f14e2-78697301%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '78dae7ee7b56cd5d1cd019bf9a498ecb804217d9' => 
    array (
      0 => '/opt/lbaw/lbaw1553/public_html/templates/right-side/right-side.tpl',
      1 => 1461887574,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '42377209157225d302f14e2-78697301',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_57225d302f8d08_88723732',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57225d302f8d08_88723732')) {function content_57225d302f8d08_88723732($_smarty_tpl) {?><!-- Blog Sidebar Widgets Column -->
<div class="col-md-4">
    <!-- Blog Search Well -->


    <div class="well">
        <h4>Search</h4>
        <form class="input-group" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/questions/search.php" method="post">
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
            <h4>Categories</h4><br>
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
    <!-- Tags Well -->
    <div class="well">
        <a href="#" class="btn" role="button"> <span class="glyphicon glyphicon-tags"></span> All Tags</a>
        <br>
        <div class="row">
            <div class="col-lg-4">
                <ul class="list-unstyled">
                    <li><a class="Taag btn btn-danger" role="button"><span
                                    class="glyphicon glyphicon-tag"></span>c++</a>
                    </li>
                    <li><a class="Taag btn btn-danger" role="button"><span
                                    class="glyphicon glyphicon-tag"></span>java</a>
                    </li>
                    <li><a class="Taag btn btn-danger" role="button"><span class="glyphicon glyphicon-tag"></span>c</a>
                    </li>
                    <li><a class="Taag btn btn-danger" role="button"><span class="glyphicon glyphicon-tag"></span>eclipse</a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-4">
                <ul class="list-unstyled">
                    <li><a class="Taag btn btn-danger" role="button"><span class="glyphicon glyphicon-tag"></span>c#</a>
                    </li>
                    <li><a class="Taag btn btn-danger" role="button"><span
                                    class="glyphicon glyphicon-tag"></span>ajax</a>
                    </li>
                    <li><a class="Taag btn btn-danger" role="button"><span
                                    class="glyphicon glyphicon-tag"></span>json</a>
                    </li>
                    <li><a class="Taag btn btn-danger" role="button"><span
                                    class="glyphicon glyphicon-tag"></span>cdt</a>
                    </li>
                </ul>
            </div>
            <!-- /.col-lg-6 -->
            <div class="col-lg-4">
                <ul class="list-unstyled">
                    <li><a class="Taag btn btn-danger" role="button"><span class="glyphicon glyphicon-tag"></span>overflow</a>
                    </li>
                    <li><a class="Taag btn btn-danger" role="button"><span
                                    class="glyphicon glyphicon-tag"></span>html</a>
                    </li>
                    <li><a class="Taag btn btn-danger" role="button"><span
                                    class="glyphicon glyphicon-tag"></span>css</a>
                    </li>
                    <li><a class="Taag btn btn-danger" role="button"><span class="glyphicon glyphicon-tag"></span>jquery</a>
                    </li>
                </ul>
            </div>
            <!-- /.col-lg-6 -->
        </div>
        <!-- /.row -->
    </div>
</div>
</div>
<!-- /.row -->
</div>
</div><?php }} ?>

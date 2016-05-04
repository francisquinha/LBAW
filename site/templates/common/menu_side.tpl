<!-- Blog Sidebar Widgets Column -->
<div class="col-md-4">
    <!-- Blog Search Well -->


    <div class="well">
        <a id="questiontitle">Search</a>
        <form class="input-group" action="{$BASE_URL}pages/questions/list_search.php" method="get">
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
                                <li><label class="tree-toggle nav-header">
                                        <span class="glyphicon glyphicon-menu-right"></span>Mobile Devices
                                    </label>
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


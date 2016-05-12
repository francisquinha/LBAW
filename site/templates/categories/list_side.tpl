{function recursive_children}
    <ul class="tree">
        {foreach $child_categories as $child_category}
            <li>
                {if {$child_categories_{$child_category.categoryid}|@count} gt 0}
                    <label class="tree-toggle nav-header">
                        <span style="font-size:70%;" class="glyphicon glyphicon-menu-right"></span>
                    </label>
                    <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$child_category.categoryid}"
                       class="force-grey2">
                        {$child_category.categoryname}
                    </a>
                {else}
                    <a class="cat" href="{$BASE_URL}pages/questions/list_category.php?categoryid={$child_category.categoryid}">
                        {$child_category.categoryname}
                    </a>
                {/if}
                {recursive_children child_categories=$child_categories_{$child_category.categoryid}}
            </li>
        {/foreach}
    </ul>
{/function}

<div class="well col-md-12">
    <div class="browse">
        <a href="{$BASE_URL}pages/categories/list_all.php" style=" padding:0; padding:0;" id="questiontitle">Categories</a>
        <br>
        <ul class="browseAlign">
            {foreach $root_categories as $root_category}
                <li>
                    {if {$child_categories_{$root_category.categoryid}|@count} gt 0}
                        <label class="tree-toggle nav-header">
                            <span style="font-size:70%;" class="glyphicon glyphicon-menu-right"></span>
                        </label>
                        <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$root_category.categoryid}"
                           class="force-grey2">
                            {$root_category.categoryname}
                        </a>
                    {else}
                        <a class="cat" href="{$BASE_URL}pages/questions/list_category.php?categoryid={$root_category.categoryid}">
                            {$root_category.categoryname}
                        </a>
                    {/if}
                    {recursive_children child_categories=$child_categories_{$root_category.categoryid}}
                </li>
            {/foreach}
        </ul>
    </div>
</div>



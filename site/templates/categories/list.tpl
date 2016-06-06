{include file='common/header.tpl'}
{function recursive_children_sel}
    {foreach $child_categories as $child_category}
        <option value={$child_category.categoryid}>
            {for $i = 0 to $level} &nbsp &nbsp &nbsp {/for}
            {$child_category.categoryname}
            {recursive_children_sel child_categories=$child_categories_{$child_category.categoryid} level = $level + 1}
        </option>
    {/foreach}
{/function}

<script language="JavaScript">
    function setVisibility(id, visibility) {
        document.getElementById(id).style.display = visibility;
    }
</script>

<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="tab-content">
                {function recursive_children_all}
                    <ul class="tree noBullets">
                        {foreach $child_categories as $child_category}
                            <li>
                                <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$child_category.categoryid}&page=1"
                                   class="force-grey">
                                    {$child_category.categoryname}
                                </a>
                                {recursive_children_all child_categories=$child_categories_{$child_category.categoryid}}
                            </li>
                        {/foreach}
                    </ul>
                {/function}
                <a style=" font-size:150%; padding:0; padding-bottom:4rem;" id="questiontitle">Categories</a>
                <br>
                {if $USERNAME}
                    {if $smarty.session.permissiontype eq 'administrator'}
                        <br>
                        <button class="btn-xs" style="background-color: #33cc33; color:white;" type=button name=type value='Show Layer'
                                onclick="setVisibility('createcategory', 'inline');" ;>Add Category <span
                                    class="glyphicon glyphicon-plus"
                                    style="padding:0; margin:0;color:white; font-size: 70%;"></span></button>
                        <button class="btn-xs" style="background-color: #33cc33; color:white;" type=button name=type value='Show Layer'
                                onclick="setVisibility('deletetag', 'inline');" ;>Remove Category <span
                                    class="glyphicon glyphicon-minus"
                                    style="padding:0; margin:0;color:white; font-size: 70%;"></span></button>
                        <div id="createcategory">
                            <br><br>
                            <form role="form" action="{$BASE_URL}actions/members/createnewcategory.php" method="post">
                                <div class="col-md-6">
                                    <select name="parentcategoryid" class="form-control">
                                        <option disabled selected>Choose Parent Category</option>
                                        <option value=''>None</option>
                                        {foreach $root_categories as $root_category}
                                            <option value={$root_category.categoryid}>
                                                {$root_category.categoryname}
                                                {recursive_children_sel child_categories=$child_categories_{$root_category.categoryid} level = 0}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-md-6">
                                <input type="text" class="newCategoryName" name="newCategory" placeholder="new category">
                                <input class="btn-xs" type="submit" value="Create">
                                </div>
                            </form>
                        </div>
                        <div id="removecategory">
                        </div>
                    {/if}
                {/if}
                <br><br><br>
                <ul class="browseAlign noBullets">
                    {foreach $root_categories as $root_category}
                        <li>
                            <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$root_category.categoryid}&page=1"
                               class="force-grey">
                                {$root_category.categoryname}
                            </a>
                            {recursive_children_all child_categories=$child_categories_{$root_category.categoryid}}
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>



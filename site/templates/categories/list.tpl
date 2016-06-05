{include file='common/header.tpl'}
{function recursive_children}
    {foreach $child_categories as $child_category}
        <option value={$child_category.categoryid}>
            {for $i = 0 to $level} &nbsp &nbsp &nbsp {/for}
            {$child_category.categoryname}
            {recursive_children child_categories=$child_categories_{$child_category.categoryid} level = $level + 1}
        </option>
    {/foreach}
{/function}
<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="tab-content">
                {function recursive_children2}
                    <ul class="tree noBullets">
                        {foreach $child_categories as $child_category}
                            <li>
                                <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$child_category.categoryid}"
                                   class="force-grey">
                                    {$child_category.categoryname}
                                </a>
                                {recursive_children2 child_categories=$child_categories_{$child_category.categoryid}}
                            </li>
                        {/foreach}
                    </ul>
                {/function}
                <a style=" font-size:150%; padding:0; padding-bottom:4rem;" id="questiontitle">Categories</a>
                <br>
                {if $USERNAME}
                    {if $smarty.session.permissiontype eq 'administrator'}
                        <div id="createcategory">
                            <form role="form" action="{$BASE_URL}actions/members/createnewcategory.php" method="post">

                                <div class="col-md-4">
                                        <select name="parentcategoryid" class="form-control">
                                            <option disabled selected>Choose Parent Category</option>
                                            <option value=''>None</option>
                                            {foreach $root_categories as $root_category}
                                                <option value={$root_category.categoryid}>
                                                    {$root_category.categoryname}
                                                    {recursive_children child_categories=$child_categories_{$root_category.categoryid} level = 0}
                                                </option>
                                            {/foreach}
                                        </select>
                                        <input  style="display:none;" class="form-control" type="text">
                                </div>

                                <input type="text" class="newCategoryName" name="newCategory">
                                <input type="submit" value="Create New Category">
                            </form>
                        </div>
                    {/if}
                {/if}
                <br>
                <ul class="browseAlign noBullets">
                    {foreach $root_categories as $root_category}
                        <li>
                            <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$root_category.categoryid}"
                               class="force-grey">
                                {$root_category.categoryname}
                            </a>
                            {recursive_children2 child_categories=$child_categories_{$root_category.categoryid}}
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>



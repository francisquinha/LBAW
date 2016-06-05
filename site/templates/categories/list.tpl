{include file='common/header.tpl'}
<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="tab-content">
                {function recursive_children}
                    <ul class="tree noBullets">
                        {foreach $child_categories as $child_category}
                            <li>
                                <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$child_category.categoryid}"
                                   class="force-grey">
                                    {$child_category.categoryname}
                                </a>
                                {recursive_children child_categories=$child_categories_{$child_category.categoryid}}
                            </li>
                        {/foreach}
                    </ul>
                {/function}
                <a style=" font-size:150%; padding:0; padding-bottom:4rem;" id="questiontitle">Categories</a>
                <br>
                {if $USERNAME}
                    {if $smarty.session.permissiontype eq 'administrator'}
                        <div id="createcategory">
                            <form role="form" action="javascript:createCategory();">
                                <input type="text" class="newCategoryName" name="newCategory">

                                <div class="col-md-4">
                                    <form action="{$BASE_URL}actions/members/changecategoryquestion.php" method="post">
                                        <div class="form-group">
                                            <select class="form-control" name="category" title="category">
                                                <option disabled selected>Category</option>
                                                {foreach $root_categories as $root_category}
                                                    <option value={$root_category.categoryid}>
                                                        {$root_category.categoryname}
                                                        {recursive_children child_categories=$child_categories_{$root_category.categoryid} level = 0}
                                                    </option>
                                                {/foreach}
                                            </select>
                                            <input  Style="display:none;" class="form-control" type="text" id="questionid" name="questionid" value="{$question.questionid}">
                                            <button class="btn-xs btn-primary " style="background-color: #33cc33; border-color: #33cc33;" name="submit" type="submit">
                                                Edit
                                            </button>
                                        </div>
                                    </form>
                                </div>

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
                            {recursive_children child_categories=$child_categories_{$root_category.categoryid}}
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>



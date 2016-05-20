{include file='common/header.tpl'}

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

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-12">
            <div class="tab-content">
                <a style=" font-size:150%; padding:0; padding-bottom:4rem;" id="questiontitle">Categories</a>
                <br>
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
    </div>
</div>

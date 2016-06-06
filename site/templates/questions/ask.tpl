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
        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <form action="{$BASE_URL}actions/posts/question.php" method="post">
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
                </div>
                <div class="form-group">
                    <select multiple size="5" id="tagsbox" name="tags[]" class="form-control" title="Tags">
                        {foreach $all_tags as $tag}
                            <option value={$tag.tagid}>
                                {$tag.tagname}
                            </option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <input class="form-control" name="title" placeholder="Subject" type="text"/>
                </div>
                <div class="form-group">
                    <textarea class="form-control" name="body" placeholder="Question" rows="8"></textarea>
                </div>
                <div class="form-group">
                    <div>
                        <button class="btn-xs "  style="background-color: #33cc33; color:white;" name="submit" type="submit">
                            Submit
                        </button>
                    </div>
                </div>
            </form>
        </div>

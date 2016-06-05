{include file='common/header.tpl'}

<script language="JavaScript">
    function setVisibility(id, visibility) {
        document.getElementById(id).style.display = visibility;
    }
</script>

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <div class="tab-content">
                <a style=" font-size:150%; padding:0;" id="questiontitle">
                    <span style=" padding:0; padding:1rem; margin:0;" class="glyphicon glyphicon-tags">
                    </span>All Tags
                </a>
                <br>
                {if $USERNAME}
                    {if $smarty.session.permissiontype eq 'moderator'}
                        <br>
                        <button class="btn-xs" style="background-color: #33cc33; color:white;" type=button name=type value='Show Layer'
                                onclick="setVisibility('createtag', 'inline');" ;>Add Tag <span
                                    class="glyphicon glyphicon-plus"
                                    style="padding:0; margin:0;color:white; font-size: 70%;"></span></button>
                        <button class="btn-xs" style="background-color: #33cc33; color:white;" type=button name=type value='Show Layer'
                                onclick="setVisibility('deletetag', 'inline');" ;>Remove Tag <span
                                    class="glyphicon glyphicon-minus"
                                    style="padding:0; margin:0;color:white; font-size: 70%;"></span></button>
                        <div id="createtag" style="display:none;">
                            <br>
                            <form role="form" action="javascript:createTag();" style="overflow: auto; padding:4rem; padding-bottom: 0;">
                                <input type="text" class="newTagName" name="newTag" placeholder="new tag">
                                <input class="btn-xs" type="submit" value="Add">
                            </form>
                        </div>
                        <div id="deletetag" style="display:none;">
                            <br>
                            <form action="{$BASE_URL}actions/tags/deletetag.php"  method="post" role="form" style="overflow: auto; padding:4rem; padding-bottom: 0;">
                                <select class="form-control" name="tagtodelete" title="tagtodelete">
                                    <option disabled selected>tag to delete</option>
                                    {foreach $tags as $tag}
                                        <option value={$tag.tagid}>{$tag.tagname}
                                        </option>
                                    {/foreach}
                                </select>
                                <input class="btn-xs" type="submit" value="Delete">
                            </form>
                        </div>
                    {/if}
                {/if}
                <br>
                <br>
                <div class="row">
                    {foreach $tags as $tag}
                        <a id="button_tag" style="display:inline-flex; padding-left:0; margin:0;"
                           href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}">
                            </span>{$tag.tagname}
                        </a>
                    {/foreach}
                </div>

            </div>
        </div>
        <!-- /.row -->

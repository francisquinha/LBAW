{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-7">
            <div class="tab-content">
                <a style=" font-size:150%; padding:0; padding-bottom:4rem;" id="questiontitle">
                    <span style=" padding:0; padding:1rem; margin:0;" class="glyphicon glyphicon-tags">
                    </span>All Tags
                </a>
                <br>
                {if $USERNAME}
                    {if $smarty.session.permissiontype eq 'administrator' || $smarty.session.permissiontype eq 'moderator'}
                        <div id="createtag">
                            <button class="newtag" type="button" data-toggle="tab">Create New Tag</button>

                        </div>
                    {/if}
                {/if}
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

<!-- Tags Well -->
<div class="well col-md-12">
    <a href="{$BASE_URL}pages/tags/list_all.php"  style=" padding:0; padding:0;" id="questiontitle">
        <span style=" padding:0; padding:1rem; margin:0;" class="glyphicon glyphicon-tags"></span>Tags</a>
    <br>
    <div class="row">
                {foreach $tags as $tag}
                    <a id="button_tag" style="display:inline-flex; padding-left:0; margin:0;"
                       href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}&page=1">
                        </span>{$tag.tagname}
                    </a>
                {/foreach}
    </div>
    <!-- /.row -->
</div>

</div>
</div>
<!-- /.row -->
</div>
</div>
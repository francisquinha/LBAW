{include file='common/header.tpl'}

<script language="javascript">

    function myFunction(){

            var status=true;

            if(status) {
                $('.alert-success').show();
            }
    }
</script>

<div class = "alert alert-success hide">
    <button type = "button" class = "close" data-dismiss = "alert" aria-hidden = "true">
        &times;
    </button>

    Success! Well done its submitted.
</div>

<div class = "alert alert-unsuccess hide">
    <button type = "button" class = "close" data-dismiss = "alert" aria-hidden = "true">
        &times;
    </button>

    Error ! Change few things.
</div>

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <h3 id="topquestion">{$subtitle}</h3>
            <ul class="nav nav-tabs right-side">
                <li class="active"><a id="tabname" data-toggle="tab" onclick="changeTab(0)" href="#recent" style={$style_tab1}><span
                                class={$class_tab1} style={$style_tab1}> </span>{$tab1}</a></li>
                <li><a id="tabname" data-toggle="tab" onclick="changeTab(1)" href="#hot" style={$style_tab1}><span
                                class={$class_tab2} style={$style_tab2}> </span>{$tab2}</a></li>
            </ul>

            <div class="tab-content">
                {if {$smarty.session.tab} == 0}
                    <div id="recent" class=" tab-pane fade in active">
                {else}
                    <div id="recent" class=" tab-pane fade">
                {/if}
                    {foreach $questions as $question}
                        <div id="question">
                            <div id="questiontitlesquare">
                                <a id="questiontitle" href="{$BASE_URL}pages/questions/details.php?questionid={$question.questionid}">
                                    {$question.title}
                                </a>
                                <br>
                                <br>
                            </div>
                            <div id="questionusersquare">
                                <a id="questionusers" href="{$BASE_URL}pages/members/details.php?membersid={$question.postauthorid}">
                                    {$question.name}
                                </a>
                                <span id="timeago">
                                    asked {$question.timeago}
                                </span>
                            </div>
                            <div id="questioncategorysquare">
                                <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$question.categoryid}">
                                    {$question.categoryname}
                                </a>
                            </div>
                            <div id="questionbuttonsection">
                                <a class="btn btn-primary btn-sm btn-success">
                                    <span class="glyphicon glyphicon-thumbs-up"></span>
                                    {$question.postrating}
                                </a>
                                <a class="btn btn-primary btn-sm btn-warning">
                                    <span class="fa fa-pencil"></span>
                                    {$question.answers}
                                </a>
                                <a class="btn btn-sm btn-primary">
                                    <span class="glyphicon glyphicon-eye-open"></span>
                                    {$question.views}
                                </a>
                            </div>
                            <div id="tagsofquestion">
                                {foreach $question.tagarray as $tag}
                                    <a id="button_tag" href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}" style="display:inline-flex;">
                                        <span class="glyphicon glyphicon-tag"></span>
                                        {$tag.tagname}
                                    </a>
                                {/foreach}
                            </div>
                        </div>
                        <hr>
                    {/foreach}
                </div>

                        {if {$smarty.session.tab} == 1}
                        <div id="hot" class=" tab-pane fade in active">
                            {else}
                            <div id="hot" class=" tab-pane fade">
                                {/if}
                    {foreach $questionsH as $question}
                        <div id="question">
                            <div id="questiontitlesquare">
                                <a id="questiontitle" href="{$BASE_URL}pages/questions/details.php?questionid={$question.questionid}">
                                    {$question.title}
                                </a>
                            </div>
                            <div id="questionusersquare">
                                <a id="questionusers" href="{$BASE_URL}pages/members/details.php?membersid={$question.postauthorid}">
                                    {$question.name}
                                </a>
                                <span id="timeago">
                                    asked {$question.timeago}
                                </span>
                            </div>
                            <div id="questioncategorysquare">
                                <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$question.categoryid}">
                                    {$question.categoryname}
                                </a>
                            </div>
                            <div id="questionbuttonsection">
                                <a class="btn btn-primary btn-sm btn-success">
                                    <span class="glyphicon glyphicon-thumbs-up"></span>
                                    {$question.postrating}
                                </a>
                                <a class="btn btn-primary btn-sm btn-warning">
                                    <span class="fa fa-pencil"></span>
                                    {$question.answers}
                                </a>
                                <a class="btn btn-sm btn-primary">
                                    <span class="glyphicon glyphicon-eye-open"></span>
                                    {$question.views}
                                </a>
                            </div>
                            <div id="tagsofquestion">
                                {foreach $question.tagarray as $tag}
                                    <a id="button_tag" href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}" style="display:inline-flex;">
                                        <span class="glyphicon glyphicon-tag"></span>
                                        {$tag.tagname}
                                    </a>
                                {/foreach}
                            </div>
                        </div>
                        <hr>
                    {/foreach}
                </div>

            </div>

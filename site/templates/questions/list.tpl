{include file='common/header.tpl'}

<br>
<br>

{if $kids|@count == 0 && $questions|@count == 0 && $smarty.session.permissiontype=="administrator"}
    <form role="form" action="{$BASE_URL}actions/members/deletecategory.php" method="get">
        <input type="hidden" name="categoryid" value={$smarty.get.categoryid}>
        <button class="btn-primary " type="submit" value="dsa"> Delete</button>
    </form>
{/if}

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
                <!--tab={$smarty.session.tab}-->
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
                                <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$question.categoryid}&page=1">
                                    {$question.categoryname}
                                </a>
                            </div>
                            <div id="questionbuttonsection">
                                <a class="btn btn-primary btn-sm btn-success">
                                    <span class="glyphicon glyphicon-thumbs-up" title="Likes"></span>
                                    {$question.postrating}
                                </a>
                                <a class="btn btn-primary btn-sm btn-warning">
                                    <span class="fa fa-pencil" title="Answers"></span>
                                    {$question.answers}
                                </a>
                                <a class="btn btn-sm btn-primary">
                                    <span class="glyphicon glyphicon-eye-open" title="Views"></span>
                                    {$question.views}
                                </a>
                            </div>
                            <div id="tagsofquestion">
                                {foreach $question.tagarray as $tag}
                                    <a id="button_tag" href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}&page=1" style="display:inline-flex;">
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
                                <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$question.categoryid}&page=1">
                                    {$question.categoryname}
                                </a>
                            </div>
                            <div id="questionbuttonsection">
                                <a class="btn btn-primary btn-sm btn-success">
                                    <span class="glyphicon glyphicon-thumbs-up" title="Like"></span>
                                    {$question.postrating}
                                </a>
                                <a class="btn btn-primary btn-sm btn-warning">
                                    <span class="fa fa-pencil" title="Answers"></span>
                                    {$question.answers}
                                </a>
                                <a class="btn btn-sm btn-primary">
                                    <span class="glyphicon glyphicon-eye-open" title="Views"></span>
                                    {$question.views}
                                </a>
                            </div>
                            <div id="tagsofquestion">
                                {foreach $question.tagarray as $tag}
                                    <a id="button_tag" href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}&page=1" style="display:inline-flex;">
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

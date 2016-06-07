{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <br>
            {if $smarty.session.permissiontype eq 'moderator'}
                <h3>Post</h3>
                {if !empty($answer)}
                    <div id="answer">
                        <div id="answerbodysquare" align="left">
                            {$answer.versionbody}
                        </div>
                        <br>

                        <div id="answerusersquare">
                            <a id="answerusers"
                               href="{$BASE_URL}pages/members/details.php?membersid={$answer.postauthorid}">{$answer.name}</a>
                            <span class="timeago">answered {$answer.timeago}</span>
                        </div>
                        <div id="questionvotesection">
                            <a href="#" class="btn-lg" style="color:black;"><span
                                        class="glyphicon glyphicon-thumbs-up"
                                        style="padding:0; margin:0;color:#4aaf51;"></span> {$answer.postrating}
                                <span
                                        class="glyphicon glyphicon-thumbs-down"
                                        style="padding:0; margin:0;color:#c9302c;"></span></a>
                        </div>

                    </div>
                    <hr>
                {else}
                    <div id="questionpq">
                        <div class="questiontitlesquare">
                            <a class="qpagequestiontitle"
                               href="{$BASE_URL}pages/questions/details.php?questionid={$question.questionid}">
                                {$question.title}
                            </a>
                        </div>
                        <div id="questionbodysquare" align="left">
                            {$question.versionbody}
                        </div>
                        <br>
                        <div class="questionusersquare"><a class="questionusers"
                                                        href="{$BASE_URL}pages/members/details.php?membersid={$question.postauthorid}">{$question.name}</a>
                            <span class="timeago">asked {$question.timeago}</span></div>
                        <div class="questioncategorysquare">
                            <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$question.categoryid}">
                                {$question.categoryname}
                            </a>
                        </div>

                        <div id="questionvotesection">
                            <a href="#" class="btn-lg" style="color:black;"><span
                                        class="glyphicon glyphicon-thumbs-up"
                                        style="padding:0; margin:0;color:#4aaf51;"></span> {$question.postrating}
                                <span
                                        class="glyphicon glyphicon-thumbs-down"
                                        style="padding:0; margin:0;color:#c9302c;"></span></a>
                        </div>

                        <div class="tagsofquestion">
                            {foreach $question.tagarray as $tag}
                                <a class="button_tag" href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}"
                                   style="display:inline-flex;">
                                    <span class="glyphicon glyphicon-tag"></span>{$tag.tagname}
                                </a>
                            {/foreach}
                        </div>

                        <div class="questionbuttonsection">
                            <a>
                                <span class="fa fa-pencil"></span>
                                {$question.answers}
                            </a>
                            <a>
                                <span class="glyphicon glyphicon-eye-open"></span>
                                {$question.views}
                            </a>
                        </div>

                    </div>
                    <hr style="margin-top:0;">
                {/if}
                <h3>Reports</h3>
                {foreach $reports as $report}
                    <div id="report">
                        <p>{$report.reportbody}</p>
                        <div class="questionusersquare"><a class="questionusers"
                                                        href="{$BASE_URL}pages/members/details.php?membersid={$report.authorid}">{$report.username}</a>
                            <span class="timeago">reported {$report.timeago}</span></div>
                    </div>
                    <hr style="margin-top:0;">
                {/foreach}
            {/if}
        </div>









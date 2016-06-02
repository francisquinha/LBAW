{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-7">
            <br>
            {if $smarty.session.permissiontype eq 'moderator'}
                <h3>Post</h3>
                {if empty($answers)}
                {else}
                    {foreach $answers as $answer}
                        <div id="answer">
                            <div id="answerbodysquare" align="left">
                                {$answer.versionbody}
                            </div>
                            <br>

                            <div id="answerusersquare">
                                <a id="answerusers" href="{$BASE_URL}pages/members/details.php?membersid={$answer.postauthorid}">{$answer.name}</a>
                                <span id="timeago">answered {$answer.timeago}</span>
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
                    {/foreach}
                {/if}


                {if empty($bestanswers)}
                {else}
                    {foreach $bestanswers as $bestanswer}
                        <div class="bestanswer">
                            <span class="glyphicon glyphicon-star" style="float:right;color:#4aaf51;"></span>
                            <div id="answerbodysquare" align="left">
                                {$bestanswer.versionbody}
                            </div>
                            <br>
                            <div id="answerusersquare">
                                <a id="answerusers" href="{$BASE_URL}pages/members/details.php?membersid={$bestanswer.postauthorid}">{$bestanswer.name}</a>
                                <span id="timeago">answered {$bestanswer.timeago}</span>
                            </div>
                            <div id="questionvotesection">
                                <a href="#" class="btn-lg" style="color:black;"><span
                                            class="glyphicon glyphicon-thumbs-up"
                                            style="padding:0; margin:0;color:#4aaf51;"></span> {$bestanswer.postrating}
                                    <span
                                            class="glyphicon glyphicon-thumbs-down"
                                            style="padding:0; margin:0;color:#c9302c;"></span></a>
                            </div>


                        </div>
                        <hr style="margin-top:0;">
                    {/foreach}
                {/if}


                {if empty($questions)}
                {else}
                    {foreach $questions as $question}
                        <div id="questionpq">
                            <div id="questiontitlesquare">
                                <a id="qpagequestiontitle"
                                   href="{$BASE_URL}pages/questions/details.php?questionid={$question.questionid}">
                                    {$question.title}
                                </a>
                            </div>
                            <div id="questionbodysquare" align="left">
                                {$question.versionbody}
                            </div>
                            <br>
                            <div id="questionusersquare"><a id="questionusers" href="{$BASE_URL}pages/members/details.php?membersid={$question.postauthorid}">{$question.name}</a>
                                <span id="timeago">asked {$question.timeago}</span></div>
                            <div id="questioncategorysquare">
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

                            <div id="tagsofquestion">
                                {foreach $question.tagarray as $tag}
                                    <a id="button_tag" href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}"
                                       style="display:inline-flex;">
                                        <span class="glyphicon glyphicon-tag"></span>{$tag.tagname}
                                    </a>
                                {/foreach}
                            </div>

                            <div id="questionbuttonsection">
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
                    {/foreach}
                {/if}

                <h3>Reports</h3>

                {if empty($reports)}
                {else}
                    {foreach $reports as $report}
                        <div id="report">
                            <p>{$report.reportbody}</p>
                            <div id="questionusersquare">
                                <p><span id="timeago">{$report.reportdate}</span></p>
                            </div>
                            <div id="questioncategorysquare">
                                <a id="questionusers" href="{$BASE_URL}pages/members/details.php?membersid={$report.authorid}">{$report.username}</a>
                            </div>
                        </div>
                        <hr style="margin-top:0;">


                    {/foreach}
                {/if}
            {/if}


        </div>








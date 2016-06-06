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
            <div id="questionpq" class="well">
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
                <div id="questionusersquare"><a id="questionusers"
                                                href="{$BASE_URL}pages/members/details.php?membersid={$question.postauthorid}">{$question.name}</a>
                    <span id="timeago">asked {$question.timeago}</span></div>
                <div id="questioncategorysquare">
                    <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$question.categoryid}">
                        {$question.categoryname}
                    </a>
                </div>
                {if $smarty.session.permissiontype eq 'moderator'}
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
                {/if}

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

                <div id="tagsofquestion">
                    {foreach $question.tagarray as $tag}
                        <a id="button_tag" href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}"
                           style="display:inline-flex;">
                            <span class="glyphicon glyphicon-tag"></span>{$tag.tagname}
                        </a>
                    {/foreach}
                </div>

                <div class="questionvotesection">
                    <form role="form" action="javascript:votes({$question.questionid})" class="updownquestion">
                        <button class="upquestion" type="submit" >
                        <span
                                class="glyphicon glyphicon-thumbs-up"
                                style="padding:0; margin:0;color:#4aaf51;"></span>

                        </button>
                        <span id="questionRating-{$question.questionid}">{$question.postrating}</span>
                        <button class="downquestion" type="submit">
                            <span
                                    class="glyphicon glyphicon-thumbs-down"
                                    style="padding:0; margin:0;color:#c9302c;"></span>
                        </button>

                        {if {$smarty.session.userid}}
                            <!-- Button trigger modal -->
                            <button type="button" class="linkReportQuestion">
                                <span class="reportPost glyphicon glyphicon-flag"></span>
                            </button>
                        {/if}

                        {if {$smarty.session.permissiontype} == "moderator"}
                            <button type="submit" formaction="javascript:deleteQuestion({$question.questionid})" class="linkDeletePost">
                                <span class="deletePost glyphicon glyphicon-remove"></span>
                            </button>
                        {/if}

                    </form>
                </div>

            </div>

            <hr style="margin-top:0;">

            {if  $bestanswer.answerid != NULL}
                <div class="bestanswer">
                    <span class="glyphicon glyphicon-star" style="float:right;color:#4aaf51;"></span>
                    <div id="answerbodysquare" align="left">
                        {$bestanswer.versionbody}
                    </div>
                    <br>
                    <div id="answerusersquare">
                        <a id="answerusers"
                           href="{$BASE_URL}pages/members/details.php?membersid={$bestanswer.postauthorid}">{$bestanswer.name}</a>
                        <span id="timeago">answered {$bestanswer.timeago}</span>
                    </div>
                    <div class="questionvotesection">

                        <form role="form" action="javascript:votes({$bestanswer.answerid})" class="updownanswer">
                            <button class="upquestion" type="submit" >
                        <span
                                class="glyphicon glyphicon-thumbs-up"
                                style="padding:0; margin:0;color:#4aaf51;"></span>

                            </button>
                            <span id="questionRating-{$bestanswer.answerid}">{$bestanswer.postrating}</span>
                            <button class="downquestion" type="submit">
                            <span
                                    class="glyphicon glyphicon-thumbs-down"
                                    style="padding:0; margin:0;color:#c9302c;"></span>
                            </button>

                            {if {$smarty.session.userid}}
                                <!-- Button trigger modal -->
                                <button type="button" class="linkReportBestAnswer">
                                    <span class="reportPost glyphicon glyphicon-flag"></span>
                                </button>
                            {/if}

                            {if {$smarty.session.permissiontype} == "moderator"}
                                <button type="submit" formaction="javascript:deleteAnswer({$bestanswer.answerid})" class="linkDeletePost">
                                    <span class="deletePost glyphicon glyphicon-remove"></span>
                                </button>
                            {/if}

                        </form>
                    </div>

                </div>
                <hr style="margin-top:0;">
            {/if}

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

                    <div class="questionvotesection">

                        <form role="form" action="javascript:votes({$answer.answerid})" class="updownanswer">
                            <button class="upquestion" type="submit" >
                        <span
                                class="glyphicon glyphicon-thumbs-up"
                                style="padding:0; margin:0;color:#4aaf51;"></span>

                            </button>
                            <span id="questionRating-{$answer.answerid}">{$answer.postrating}</span>
                            <button class="downquestion" type="submit">
                            <span
                                    class="glyphicon glyphicon-thumbs-down"
                                    style="padding:0; margin:0;color:#c9302c;"></span>
                            </button>

                            {if {$smarty.session.userid}}
                                <!-- Button trigger modal -->
                                <button type="button" class="linkReportAnswer">
                                    <span class="reportPost glyphicon glyphicon-flag"></span>
                                </button>
                            {/if}

                            {if {$smarty.session.permissiontype} == "moderator"}
                                <button type="submit" formaction="javascript:deleteAnswer({$answer.answerid})" class="linkDeletePost">
                                    <span class="deletePost glyphicon glyphicon-remove"></span>
                                </button>
                            {/if}

                        </form>

                        <!-- The Modal -->
                        <div id="myModalBestAnswer" class="modalAnswer">

                            <!-- Modal content -->
                            <div class="modal-contentAnswer">
                                <span class="closeAnswer">×</span>
                                <form class="reportArea" role="form" action="javascript:sendReport({$bestanswer.answerid})">
                                    <input type="text" class="reportBody">
                                    <input type="submit" value="Submit">
                                </form>
                            </div>

                        </div>

                      <!-- The Modal -->
                        <div id="myModalAnswer" class="modalAnswer">

                            <!-- Modal content -->
                            <div class="modal-contentAnswer">
                                <span class="closeAnswer">×</span>
                                <form class="reportArea" role="form" action="javascript:sendReport({$answer.answerid})">
                                    <input type="text" class="reportBody">
                                    <input type="submit" value="Submit">
                                </form>
                            </div>

                        </div>

                        <!-- The Modal -->
                        <div id="myModalQuestion" class="modalQuestion">

                            <!-- Modal content -->
                            <div class="modal-contentQuestion">
                                <span class="closeQuestion">×</span>
                                <form class="reportArea" role="form" action="javascript:sendReport({$question.questionid})">
                                    <input type="text" class="reportBody">
                                    <input type="submit" value="Submit">
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <hr>
            {/foreach}

            <button data-toggle="tooltip" title="Make login!" id="edit" class="btn btn-primary" type="button">Answer</button>
            {if {$smarty.session.userid}}

                <form id="send" action="javascript:send_answer({$smarty.get.questionid})" name="confirmationForm">
                    <!--  <textarea id="confirmationText" class="text" cols="86" rows ="20" name="body"></textarea>
                      <input type="submit" value="Post" class="submitButton">-->

                    <div class="summernote"></div>
                </form>
            {else}
                <div class="messageAnswer">Please, make login</div>
            {/if}

        </div>

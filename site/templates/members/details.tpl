{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-12">
            <br>

            {foreach $member as $membern}
                <div id="user-top">
                    <div id="left">
                        <ul>
                            <li><img src="http://www.gravatar.com/avatar/{$membern.emailhash}?s=80&d=retro"></li>
                            <li><a href="#" id="username">{$membern.username}</a></li>

                        </ul>

                    </div>
                    <div id="right">
                        <ul>
                            <li><span>Name: </span>{$membern.name}</li>
                            {if $USERNAME}
                                <li><span>E-mail: </span>{$membern.email}</li>
                            {else}
                            {/if}
                            <li><span>Registered: </span>{$membern.timeago}</li>
                            {if $membern.memberrating > 0}
                                <li style="color: #4aaf51;"><span style="color: #888;">Rating: </span>{$membern.memberrating}</li>
                            {else}
                                {if $membern.memberrating < 0}
                                    <li style="color: #c9302c;"><span style="color: #888;">Rating: </span>{$membern.memberrating}</li>
                                {else}
                                    <li><span style="color: #888;">Rating: </span>{$membern.memberrating}</li>
                                {/if}
                            {/if}
                            {if {$membern.permissiontype} eq 'member'}
                            {else}
                                {if $USERNAME}
                                    <li><span>Permission: </span>{$membern.permissiontype}</li>
                                {else}
                                {/if}
                            {/if}
                        </ul>
                    </div>


                </div>
            {/foreach}

            {foreach $member as $membern}
                {if $smarty.session.permissiontype neq 'member'}
                    {if $USERNAME neq $membern.username}
                        {if {$membern.permissiontype} eq 'administrator'}
                            {if $smarty.session.permissiontype eq 'administrator'}
                                <a href="{$BASE_URL}actions/members/promotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                    <button type="button" class="btn-xs">Moderator</button>
                                </a>
                                <a href="{$BASE_URL}actions/members/demotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                    <button type="button" class="btn-xs">Membern</button>
                                </a>
                                <a href="{$BASE_URL}actions/members/ban.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                    <button type="button" class="btn-xs">Ban</button>
                                </a>
                                <a href="{$BASE_URL}actions/members/disabled.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                    <button type="button" class="btn-xs">Disable</button>
                                    </button>
                                </a>
                                <a href="{$BASE_URL}actions/members/suspended.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                    <button type="button" class="btn-xs">Suspend</button>
                                    </button>
                                </a>
                            {/if}
                        {else}
                            {if {$membern.permissiontype} eq 'moderator'}
                                {if $smarty.session.permissiontype eq 'administrator'}
                                    <a href="{$BASE_URL}actions/members/promoteadmin.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                        <button type="button" class="btn-xs">Administrator</button>
                                    </a>
                                    <a href="{$BASE_URL}actions/members/demotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                        <button type="button" class="btn-xs">Member</button>
                                    </a>
                                    <a href="{$BASE_URL}actions/members/ban.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                        <button type="button" class="btn-xs">Ban</button>
                                    </a>
                                    <a href="{$BASE_URL}actions/members/disabled.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                        <button type="button" class="btn-xs">Disable</button>
                                        </button>
                                    </a>
                                    <a href="{$BASE_URL}actions/members/suspended.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                        <button type="button" class="btn-xs">Suspend</button>
                                        </button>
                                    </a>
                                {/if}
                            {else}
                                {if {$membern.permissiontype} eq 'member'}
                                    {if $smarty.session.permissiontype eq 'administrator'}
                                        <a href="{$BASE_URL}actions/members/promoteadmin.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                            <button type="button" class="btn-xs">Administrator</button>
                                        </a>
                                        <a href="{$BASE_URL}actions/members/promotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                            <button type="button" class="btn-xs">Moderator</button>
                                        </a>
                                        <a href="{$BASE_URL}actions/members/ban.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                            <button type="button" class="btn-xs">Ban</button>
                                        </a>
                                        <a href="{$BASE_URL}actions/members/disabled.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                            <button type="button" class="btn-xs">Disable</button>
                                            </button>
                                        </a>
                                        <a href="{$BASE_URL}actions/members/suspended.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                            <button type="button" class="btn-xs">Suspend</button>
                                            </button>
                                        </a>
                                    {/if}
                                    {if $smarty.session.permissiontype eq 'moderator'}
                                        <a href="{$BASE_URL}actions/members/ban.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                            <button type="button" class="btn-xs">Ban</button>
                                            </button>
                                        </a>
                                        <a href="{$BASE_URL}actions/members/disabled.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                            <button type="button" class="btn-xs">Disable</button>
                                            </button>
                                        </a>
                                        <a href="{$BASE_URL}actions/members/suspended.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                            <button type="button" class="btn-xs">Suspend</button>
                                            </button>
                                        </a>
                                    {/if}
                                {else}
                                    {if {$membern.permissiontype} eq 'banned'}
                                        {if $smarty.session.permissiontype eq 'administrator'}
                                            <a href="{$BASE_URL}actions/members/demotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                                <button type="button" class="btn-xs">Rehabilitate
                                                </button>
                                            </a>
                                        {/if}
                                        {if $smarty.session.permissiontype eq 'moderator'}
                                            <a href="{$BASE_URL}actions/members/demotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                                <button type="button" class="btn-xs">Rehabilitate
                                                </button>
                                            </a>
                                        {/if}
                                    {else}
                                        {if {$membern.permissiontype} eq 'disabled'}
                                            {if $smarty.session.permissiontype eq 'administrator'}
                                                <a href="{$BASE_URL}actions/members/demotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                                    <button type="button" class="btn-xs">Activate
                                                    </button>
                                                </a>
                                            {/if}
                                            {if $smarty.session.permissiontype eq 'moderator'}
                                                <a href="{$BASE_URL}actions/members/demotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                                    <button type="button" class="btn-xs">Activate
                                                    </button>
                                                </a>
                                            {/if}
                                        {else}
                                            {if {$membern.permissiontype} eq 'suspended'}
                                                {if $smarty.session.permissiontype eq 'administrator'}
                                                    <a href="{$BASE_URL}actions/members/demotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                                        <button type="button" class="btn-xs">Activate
                                                        </button>
                                                    </a>
                                                {/if}
                                                {if $smarty.session.permissiontype eq 'moderator'}
                                                    <a href="{$BASE_URL}actions/members/demotemoderator.php?giverid={$smarty.session.userid}&ownerid={$membern.memberid}">
                                                        <button type="button" class="btn-xs">Activate
                                                        </button>
                                                    </a>
                                                {/if}
                                            {/if}
                                        {/if}
                                    {/if}
                                {/if}
                            {/if}
                        {/if}
                    {/if}
                {/if}
            {/foreach}


            <div>
                <br>
                <br>
                <ul class="nav nav-tabs right-side">
                    <li class="active"><a data-toggle="tab" href="#Questions">Questions</a></li>
                    {foreach $member as $membern}
                        {if $USERNAME eq $membern.username}
                            {if {$membern.permissiontype} eq 'administrator'}
                                <li><a data-toggle="tab" href="#Moderators">Moderators</a></li>
                            {/if}
                            {if {$membern.permissiontype} eq 'moderator'}
                                <li><a data-toggle="tab" href="#Reports">Reports</a></li>
                            {/if}
                        {/if}
                    {/foreach}
                </ul>
            </div>

            <div class="tab-content">

                <div id="Questions" class="tab-pane fade in active">
                    <div class="col-md-10 col-md-offset-1">

                        <br>
                        {if empty($questions)}
                        {else}
                            <table class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Creation date</th>
                                    <th>Rating</th>
                                    <th>Views</th>
                                    <th>Answers</th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach $questions as $question}
                                    <tr>
                                        <td>
                                            <a href="{$BASE_URL}pages/questions/details.php?questionid={$question.questionid}">{$question.title}</a>
                                        </td>
                                        <td>{$question.timeago}</td>
                                        <td>{$question.postrating}</td>
                                        <td>{$question.views}</td>
                                        <td>{$question.answers}</td>
                                    </tr>
                                {/foreach}

                                </tbody>
                            </table>
                        {/if}
                    </div>
                </div>


                <div id="Reports" class="tab-pane fade">
                    <div class="col-md-10 col-md-offset-1">

                        {foreach $member as $membern}
                            {if $USERNAME eq $membern.username}
                                {if $smarty.session.permissiontype eq 'moderator'}
                                    {if empty($reports)}
                                    {else}
                                        <br>
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                            <tr>
                                                <th>Post</th>
                                                <th>Author</th>
                                                <th>Age</th>
                                                <th>Reports</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            {foreach $reports as $report}
                                                <tr>
                                                    <td>
                                                        <a href="{$BASE_URL}pages/report/details.php?postid={$report.postid}">{$report.title}</a>
                                                    <td>                                                        <a href="{$BASE_URL}pages/members/details.php?membersid={$report.postauthorid}">{$report.name}</a>
                                                    </td>
                                                    </td>
                                                    <td>{$report.timeago}</td>
                                                    <td>{$report.numberreports}</td>
                                                </tr>
                                            {/foreach}
                                            </tbody>
                                        </table>
                                    {/if}
                                {/if}
                            {/if}
                        {/foreach}
                    </div>
                </div>


                <div id="Moderators" class="tab-pane fade">
                    <div class="col-md-10 col-md-offset-1">

                        {foreach $member as $membern}
                            {if $USERNAME eq $membern.username}
                                {if $smarty.session.permissiontype eq 'administrator'}
                                    {if empty($moderators)}
                                    {else}
                                        <br>
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                            <tr>
                                                <th>Moderator</th>
                                                <th>Rating</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            {foreach $moderators as $moderator}
                                                <tr>
                                                    <td>
                                                        <a href="{$BASE_URL}pages/members/details.php?membersid={$moderator.memberid}">{$moderator.username}</a>
                                                    </td>
                                                    <td>{$moderator.memberrating}</td>
                                                </tr>
                                            {/foreach}
                                            </tbody>
                                        </table>
                                    {/if}
                                {/if}
                            {/if}
                        {/foreach}
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>









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
                            <li><span>Regist on: </span>{$membern.registrationdate}</li>
                            <li><span>Rating: </span>{$membern.memberrating}</li>
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


            {if $USERNAME}
                <div id="user-bottom">
                    <br>
                    <br>
                    <div class="tab-content">
                        <div id="ALL" class="tab-pane fade in active">
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
                                            <td>{$question.postcreationdate}</td>
                                            <td>{$question.postrating}</td>
                                            <td>{$question.views}</td>
                                            <td>{$question.answers}</td>
                                        </tr>
                                    {/foreach}

                                    </tbody>
                                </table>
                            {/if}
                            {foreach $member as $membern}
                                {if $USERNAME eq $membern.username}
                                    {if $smarty.session.permissiontype eq 'moderator'}
                                        {if empty($reports)}
                                        {else}
                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>ReportID</th>
                                                    <th>Times</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                {foreach $reports as $report}
                                                    <tr>
                                                        <td><a href="">{$report.postid}</a></td>
                                                        <td>{$report.numberreports}</td>

                                                    </tr>
                                                {/foreach}

                                                </tbody>
                                            </table>
                                        {/if}
                                    {/if}
                                {/if}

                            {/foreach}

                            {foreach $member as $membern}
                                {if $USERNAME eq $membern.username}
                                    {if $smarty.session.permissiontype eq 'administrator'}
                                        {if empty($moderators)}
                                        {else}
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

                            {foreach $member as $membern}
                                {if $smarty.session.permissiontype neq 'member'}
                                    {if $USERNAME neq $membern.username}
                                        {if {$membern.permissiontype} eq 'administrator'}
                                            {if $smarty.session.permissiontype eq 'administrator'}
                                                <button type="button" class="btn-xs">Moderator</button>
                                                <button type="button" class="btn-xs">Member</button>
                                                <button type="button" class="btn-xs">Ban</button>
                                                <button type="button" class="btn-xs">Disable</button>
                                                <button type="button" class="btn-xs">Suspend</button>
                                            {/if}
                                        {else}
                                            {if {$membern.permissiontype} eq 'moderator'}
                                                {if $smarty.session.permissiontype eq 'administrator'}
                                                    <button type="button" class="btn-xs">Administrator</button>
                                                    <button type="button" class="btn-xs">Member</button>
                                                    <button type="button" class="btn-xs">Ban</button>
                                                    <button type="button" class="btn-xs">Disable</button>
                                                    <button type="button" class="btn-xs">Suspend</button>
                                                {/if}
                                            {else}
                                                {if {$membern.permissiontype} eq 'member'}
                                                    {if $smarty.session.permissiontype eq 'administrator'}
                                                        <button type="button" class="btn-xs">Administrator</button>
                                                        <button type="button" class="btn-xs">Moderator</button>
                                                        <button type="button" class="btn-xs">Ban</button>
                                                        <button type="button" class="btn-xs">Disable</button>
                                                        <button type="button" class="btn-xs">Suspend</button>
                                                    {/if}
                                                    {if $smarty.session.permissiontype eq 'moderator'}
                                                        <button type="button" class="btn-xs">Ban</button>
                                                        <button type="button" class="btn-xs">Disable</button>
                                                        <button type="button" class="btn-xs">Suspend</button>
                                                    {/if}
                                                {else}
                                                    {if {$membern.permissiontype} eq 'banned'}
                                                        {if $smarty.session.permissiontype eq 'administrator'}
                                                            <button type="button" class="btn-xs">Rehabilitate</button>
                                                        {/if}
                                                        {if $smarty.session.permissiontype eq 'moderator'}
                                                            <button type="button" class="btn-xs">Rehabilitate</button>
                                                        {/if}
                                                    {else}
                                                        {if {$membern.permissiontype} eq 'disabled'}
                                                            {if $smarty.session.permissiontype eq 'administrator'}
                                                                <button type="button" class="btn-xs">Activate</button>
                                                            {/if}
                                                            {if $smarty.session.permissiontype eq 'moderator'}
                                                                <button type="button" class="btn-xs">Activate</button>
                                                            {/if}
                                                        {else}
                                                            {if {$membern.permissiontype} eq 'disabled'}
                                                                {if $smarty.session.permissiontype eq 'administrator'}
                                                                    <button type="button" class="btn-xs">Activate</button>
                                                                {/if}
                                                                {if $smarty.session.permissiontype eq 'moderator'}
                                                                    <button type="button" class="btn-xs">Activate</button>
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
                        </div>
                    </div>
                </div>
            {else}
                <div style="height: 500px;">
                </div>
            {/if}
        </div>
    </div>

</div>









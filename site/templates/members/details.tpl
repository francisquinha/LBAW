{include file='common/header.tpl'}

{function recursive_children_sel}
    {foreach $child_categories as $child_category}
        <option value={$child_category.categoryid}>
            {for $i = 0 to $level}  > {/for}
            {$child_category.categoryname}
            {recursive_children_sel child_categories=$child_categories_{$child_category.categoryid} level = $level + 1}
        </option>
    {/foreach}
{/function}

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

                        <script language="JavaScript">
                            function setVisibility(id, visibility) {
                                document.getElementById(id).style.display = visibility;
                            }
                        </script>

                        <ul>
                            {if $USERNAME eq $membern.username}
                                <li><span>Name: </span>{$membern.name}
                                    <button class="btn-xs" style="background-color: #33cc33; color:white;" type=button name=type value='Show Layer'
                                            onclick="setVisibility('divhide1', 'inline');" ;><span
                                                class="glyphicon glyphicon-pencil"
                                                style="padding:0; margin:0;color:white; font-size: 70%;"></span></button>
                                    <form id="divhide1" action="{$BASE_URL}actions/members/updatename.php?newname={$newname}&membersid=membersid" class="form-horizontal" role="form" method="get">
                                        <div class="form-group">
                                            <div class="col-lg-4">
                                                <br>
                                                <input class="form-control" type="text" placeholder="new name" id="newname" name="newname" value="">
                                                <input  Style="display:none;" class="form-control" type="text" id="membersid" name="membersid" value="{$membern.memberid}">
                                                <input class="btn-xs" type="submit" value="Edit" style="font-family: 'QuanticoRegular';">
                                            </div>
                                        </div>
                                    </form>
                                </li>
                            {else}
                                <li><span>Name: </span>{$membern.name}</li>
                            {/if}
                            {if $USERNAME}
                                <li><span>E-mail: </span>{$membern.email}</li>
                            {else}
                            {/if}
                            <li><span>Registered: </span>{$membern.timeago}</li>
                            {if $membern.memberrating > 0}
                                <li style="color: #4aaf51;"><span
                                            style="color: #888;">Rating: </span>{$membern.memberrating}</li>
                            {else}
                                {if $membern.memberrating < 0}
                                    <li style="color: #c9302c;"><span
                                                style="color: #888;">Rating: </span>{$membern.memberrating}</li>
                                {else}
                                    <li><span style="color: #888;">Rating: </span>{$membern.memberrating}</li>
                                {/if}
                            {/if}
                            {if {$membern.permissiontype} eq 'moderator'}
                                {if empty($categorymod)}
                                {else}
                                    <li><span>Manage: </span>
                                        {foreach $categorymod as $categorymodn}
                                            {$categorymodn.categoryname}
                                        {/foreach}
                                    </li>
                                {/if}
                            {/if}
                            {if {$membern.permissiontype} eq 'member'}
                            {else}
                                {if $USERNAME}
                                    <li><span>Permission: </span>{$membern.permissiontype}</li>
                                {else}
                                {/if}
                            {/if}
                            {if $USERNAME eq $membern.username}
                                <button class="btn-xs"  style="background-color: #33cc33; color:white;" type=button name=type value='Show Layer'
                                        onclick="setVisibility('divhide2', 'inline');" ;>Change Password <span
                                            class="fa fa-key" aria-hidden="true"
                                            style="padding:0; margin:0;color:white; font-size: 70%;"></span></button>
                                <div id="divhide2">
                                    <form role="form"  action="{$BASE_URL}actions/members/updatepass.php" class="form-horizontal updatePass" >
                                        <div class="form-group">
                                            <div class="col-lg-4">
                                                <br>
                                                <input class="form-control" type="password" id="oldpass" name="oldpass" value="" placeholder="password">
                                                <input class="form-control" type="password" id="newpass1" name="newpass1" value="" placeholder="new password">
                                                <input class="form-control" type="password" id="newpass2" name="newpass2" value="" placeholder="new password">
                                                <input  Style="display:none;" class="form-control" type="text" id="membersid" name="membersid" value="{$membern.memberid}">
                                                <button class="btn-xs" type="submit" value=" Edit " style="font-family: 'QuanticoRegular';"> Edit </button>
                                                <div class="responseupdatePass">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

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
                                    <br>
                                    <br><br>
                                    <div class="col-md-6">


                                        <form action="{$BASE_URL}actions/members/addcategorymod.php" method="post">
                                            <div class="form-group">
                                                <select class="form-control" name="category" title="category">
                                                    <option disabled selected>Category</option>
                                                    {foreach $root_categories as $root_category}
                                                        <option value={$root_category.categoryid}>
                                                            {$root_category.categoryname}
                                                            {recursive_children_sel child_categories=$child_categories_{$root_category.categoryid} level = 0}
                                                        </option>
                                                    {/foreach}
                                                </select>
                                                <input  Style="display:none;" class="form-control" type="text" id="moderatorid" name="moderatorid" value="{$membern.memberid}">
                                            </div>
                                            <div class="form-group">
                                                <div>
                                                    <button class="btn-xs btn-primary " style="background-color: #33cc33; border-color: #33cc33;" name="submit" type="submit">
                                                        Add
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="col-md-6">


                                        <form action="{$BASE_URL}actions/members/removecategorymod.php" method="post">
                                            <div class="form-group">
                                                <select class="form-control" name="category" title="category">
                                                    <option disabled selected>Category</option>
                                                    {foreach $root_categories as $root_category}
                                                        <option value={$root_category.categoryid}>
                                                            {$root_category.categoryname}
                                                            {recursive_children_sel child_categories=$child_categories_{$root_category.categoryid} level = 0}
                                                        </option>
                                                    {/foreach}
                                                </select>
                                                <input  Style="display:none;" class="form-control" type="text" id="moderatorid" name="moderatorid" value="{$membern.memberid}">
                                            </div>
                                            <div class="form-group">
                                                <div>
                                                    <button class="btn-xs btn-danger" style="background-color: #ed5249" name="submit" type="submit">
                                                        Remove
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>


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
                                                    <td>
                                                        <a href="{$BASE_URL}pages/members/details.php?membersid={$report.postauthorid}">{$report.name}</a>
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









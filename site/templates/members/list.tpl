{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-8">


            <a style=" font-size:150%; padding:0;" class="questiontitle">
                Users
            </a>

            <br>
            <br>
            <ul class="pagination" style="font-size: 80%; padding:0;margin:0;">
                <li class="active"><a data-toggle="tab" href="#ALL">ALL</a></li>
                <li><a data-toggle="tab" href="#A">A</a></li>
                <li><a data-toggle="tab" href="#B">B</a></li>
                <li><a data-toggle="tab" href="#C">C</a></li>
                <li><a data-toggle="tab" href="#D">D</a></li>
                <li><a data-toggle="tab" href="#E">E</a></li>
                <li><a data-toggle="tab" href="#F">F</a></li>
                <li><a data-toggle="tab" href="#G">G</a></li>
                <li><a data-toggle="tab" href="#H">H</a></li>
                <li><a data-toggle="tab" href="#I">I</a></li>
                <li><a data-toggle="tab" href="#J">J</a></li>
                <li><a data-toggle="tab" href="#K">K</a></li>
                <li><a data-toggle="tab" href="#L">L</a></li>
                <li><a data-toggle="tab" href="#M">M</a></li>
                <li><a data-toggle="tab" href="#N">N</a></li>
                <li><a data-toggle="tab" href="#O">O</a></li>
                <li><a data-toggle="tab" href="#P">P</a></li>
                <li><a data-toggle="tab" href="#Q">Q</a></li>
                <li><a data-toggle="tab" href="#R">R</a></li>
                <li><a data-toggle="tab" href="#S">S</a></li>
                <li><a data-toggle="tab" href="#T">T</a></li>
                <li><a data-toggle="tab" href="#U">U</a></li>
                <li><a data-toggle="tab" href="#V">V</a></li>
                <li><a data-toggle="tab" href="#W">W</a></li>
                <li><a data-toggle="tab" href="#X">X</a></li>
                <li><a data-toggle="tab" href="#Y">Y</a></li>
                <li><a data-toggle="tab" href="#Z">Z</a></li>
            </ul>


            <div class="tab-content">
                <div id="ALL" class="tab-pane fade in active">
                    <br>
                    {foreach $members as $member}
                        <ul class="userlist">
                            <a href="{$BASE_URL}pages/members/details.php?membersid={$member.memberid}"><img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro"></a>
                            <li class="userlistusername"><a href="{$BASE_URL}pages/members/details.php?membersid={$member.memberid}">{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}


<a class="btn btn-link btn-lg" role="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
   aria-expanded="true" style="font-family: 'QuanticoRegular';color: #33cc33; height: 50px;  padding: 15px 0px;  font-size: 20px;  line-height: 20px;  font-weight: bold;">
    {$USERNAME}
</a>
<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="margin:0; padding:0; margin-top:0.38rem;">
    <li><a style="padding:1.5rem; font-size: 115%;" href="{$BASE_URL}pages/members/details.php?membersid={$smarty.session.userid}">My Profile</a></li>
    <li><a style="padding:1.5rem; font-size: 115%;" href="{$BASE_URL}pages/questions/ask.php">Ask Question</a></li>
    <li><a style="padding:1.5rem; font-size: 115%;" href="{$BASE_URL}actions/members/logout.php" >Logout <span style="color:#cc0000;align:right;padding-bottom:0;"class="glyphicon glyphicon-remove"></span> </a></li>
</ul>

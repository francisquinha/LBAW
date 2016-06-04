<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/tags.php');

$tags = getTopTags([25]);

$smarty->assign('tags', $tags);
$smarty->display('tags/list_side.tpl');

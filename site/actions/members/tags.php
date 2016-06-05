<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/tags.php');

$tagName = $_POST['tagName'];
try{
createNewTag($tagName);
    echo 'Tag created';}
catch(PDOException $e) {
    echo 'Duplicate Tag';
}
exit;
?>
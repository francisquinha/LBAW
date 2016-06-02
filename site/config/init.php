<?php

//session_set_cookie_params(3600, '/~lbaw1553'); //FIXME
session_set_cookie_params(3600, '/'); //FIXME
//session_set_cookie_params(3600, '/~ei12168'); //FIXME
//session_set_cookie_params(3600, '/~up200204376'); //FIXME
//session_set_cookie_params(3600, '/~ei01020'); //FIXME

session_start();

error_reporting(E_ERROR | E_WARNING); // E_NOTICE by default

//$BASE_DIR = '/opt/lbaw/lbaw1553/public_html/'; //FIXME
$BASE_DIR = 'C:/xampp/htdocs/LBAW/site/'; //FIXME
//$BASE_DIR = '/usr/users2/mieic2002/ei12168/public_html/'; //FIXME
//$BASE_DIR = '/usr/users2/mieic2002/up200204376/public_html/'; //FIXME
//$BASE_DIR = '/usr/users2/mieic2002/ei01020/public_html/'; //FIXME

//$BASE_URL = '/~lbaw1553/'; //FIXME
$BASE_URL = '/LBAW/site/'; //FIXME
//$BASE_URL = '/~ei12168/'; //FIXME
//$BASE_URL = '/~up200204376/'; //FIXME
//$BASE_URL = '/~ei01020/'; //FIXME

//$conn = new PDO('pgsql:host=dbm;dbname=lbaw1553', 'lbaw1553', 'TC97M7B8'); //FIXME
$conn = new PDO('pgsql:host=localhost;dbname=postgres', 'postgres', '0509'); //FIXME
$conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$conn->exec('SET SCHEMA \'public\''); //FIXME

include_once($BASE_DIR.'lib/smarty/Smarty.class.php');

$smarty = new Smarty;
$smarty->template_dir = $BASE_DIR . 'templates/';
$smarty->compile_dir = $BASE_DIR . 'templates_c/';
$smarty->assign('BASE_URL', $BASE_URL);

$smarty->assign('ERROR_MESSAGES', $_SESSION['error_messages']);
$smarty->assign('FIELD_ERRORS', $_SESSION['field_errors']);
$smarty->assign('SUCCESS_MESSAGES', $_SESSION['success_messages']);
$smarty->assign('FORM_VALUES', $_SESSION['form_values']);
$smarty->assign('USERNAME', $_SESSION['username']);

unset($_SESSION['success_messages']);
unset($_SESSION['error_messages']);
unset($_SESSION['field_errors']);
unset($_SESSION['form_values']);
?>
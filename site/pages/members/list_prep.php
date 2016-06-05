<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');
include_once($BASE_DIR . 'pages/pagination/pagination.php');
/*
* @param int $currentPage - current page
* @param int $itemCount - number of items to paginate, used to calculate total number of pages
* @param int $itemsPerPage - number of items per page, used to calculate total number of pages
* @param int $adjacentCount - half the number of page links displayed adjacent to the current page
* @param (string|callable) $pageLinkTemplate - pagination URL string containing %d placeholder or a callable function that accepts page number and returns page URL
* @param boolean $showPrevNext - whether to show previous and next page links
* @return void
*/

?>
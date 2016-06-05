<?php
/**
 * Displays pagination links based on given parameters
 *
 * @param int $currentPage - current page
 * @param int $itemCount - number of items to paginate, used to calculate total number of pages
 * @param int $itemsPerPage - number of items per page, used to calculate total number of pages
 * @param int $adjacentCount - half the number of page links displayed adjacent to the current page
 * @param (string|callable) $pageLinkTemplate - pagination URL string containing %d placeholder or a callable function that accepts page number and returns page URL
 * @param boolean $showPrevNext - whether to show previous and next page links
 * @return void
 *
 * taken from: http://salman-w.blogspot.pt/2014/04/stackoverflow-like-pagination.html
 */
function pagination($currentPage, $itemCount, $itemsPerPage, $adjacentCount, $pageLinkTemplate, $showPrevNext = true) {
    $firstPage = 1;
    $lastPage  = ceil($itemCount / $itemsPerPage);
    if ($lastPage == 1) {
        return;
    }
    if ($currentPage <= $adjacentCount + $adjacentCount) {
        $firstAdjacentPage = $firstPage;
        $lastAdjacentPage  = min($firstPage + $adjacentCount + $adjacentCount, $lastPage);
    } elseif ($currentPage > $lastPage - $adjacentCount - $adjacentCount) {
        $lastAdjacentPage  = $lastPage;
        $firstAdjacentPage = $lastPage - $adjacentCount - $adjacentCount;
    } else {
        $firstAdjacentPage = $currentPage - $adjacentCount;
        $lastAdjacentPage  = $currentPage + $adjacentCount;
    }
    echo '<div>';
    if ($showPrevNext) {
        if ($currentPage == $firstPage) {
            echo '<span>&lt;</span>';
        } else {
            echo '<a href="' . (is_callable($pageLinkTemplate) ? $pageLinkTemplate($currentPage - 1) : sprintf($pageLinkTemplate, $currentPage - 1)) . '">&lt;</a>';
        }
    }
    if ($firstAdjacentPage > $firstPage) {
        echo '<a href="' . (is_callable($pageLinkTemplate) ? $pageLinkTemplate($firstPage) : sprintf($pageLinkTemplate, $firstPage)) . '">' . $firstPage . '</a>';
        if ($firstAdjacentPage > $firstPage + 1) {
            echo '<span>...</span>';
        }
    }
    for ($i = $firstAdjacentPage; $i <= $lastAdjacentPage; $i++) {
        if ($currentPage == $i) {
            echo '<b>' . $i . '</b>';
        } else {
            echo '<a href="' . (is_callable($pageLinkTemplate) ? $pageLinkTemplate($i) : sprintf($pageLinkTemplate, $i)) . '">' . $i . '</a>';
        }
    }
    if ($lastAdjacentPage < $lastPage) {
        if ($lastAdjacentPage < $lastPage - 1) {
            echo '<span>...</span>';
        }
        echo '<a href="' . (is_callable($pageLinkTemplate) ? $pageLinkTemplate($lastPage) : sprintf($pageLinkTemplate, $lastPage)) . '">' . $lastPage . '</a>';
    }
    if ($showPrevNext) {
        if ($currentPage == $lastPage) {
            echo '<span>&gt;</span>';
        } else {
            echo '<a href="' . (is_callable($pageLinkTemplate) ? $pageLinkTemplate($currentPage + 1) : sprintf($pageLinkTemplate, $currentPage + 1)) . '">&gt;</a>';
        }
    }
    echo '</div>';
    echo '</div>';
}
?>
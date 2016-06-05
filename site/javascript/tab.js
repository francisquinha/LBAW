
function changeTab(n) {
    $.ajax({
        type: 'POST',
        url: BASE_URL + 'pages/questions/tab.php',
        data: {n:n}
    })
}

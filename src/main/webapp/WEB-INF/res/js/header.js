//加载整个首页
$(window).load(
    function () {
        $('body').addClass('loaded');
    }
);

/*
* 部分1：头部
* */
//加载头部Header
$(document).ready(function () {
    $(".memenu").memenu();
});

// //头部Header转换focus
// // $(document).ready(function () {
// //     $('ul.top > li').click(function () {
// //         $('ul.top > li').removeClass('currentLi');
// //         $(this).addClass('currentLi');
// //     });
// // })
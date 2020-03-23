$(document).ready(function () {
    $('.adminnav').each(function () {
        $(this).click(function () {
            $(this).addClass('navselected');
            $(this).siblings().removeClass('navselected');
        });
    });
});
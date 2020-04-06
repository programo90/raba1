$(document).ready(function () {
    $('.navli').each(function () {
        $(this).click(function () {
            $(this).addClass('navliselected');
            $(this).siblings().removeClass('navliselected');
        });
    });

    let nav = $('.navbox').offset();
    $(window).scroll(function () {
        if ($(document).scrollTop() > nav.top) {
            $('.navbox').addClass('navboxFixed');
        } else {
            $('.navbox').removeClass('navboxFixed');
        }
    });

});
function openNav() {
  document.getElementById("myNav").style.width = "50%";
}

function closeNav() {
  document.getElementById("myNav").style.width = "0%";
}
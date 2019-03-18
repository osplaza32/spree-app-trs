function sticky_relocate() {
    var window_top = $(window).scrollTop();
    var div_top = $('.bottom-navBarSeparator').offset().top;
    if (window_top > div_top) {
        if (!$('#bottom-navBar').hasClass('stick')) {
            $('#bottom-navBar').addClass('stick');
            $('#bottom-navBar').css('top',$('#top-navBar').outerHeight());
        }
    } else {
        if ($('#bottom-navBar').hasClass('stick')) {
            $('#bottom-navBar').removeClass('stick');
        }
    }
}

$(document).ready(function(){
    $(window).scroll(sticky_relocate);
    sticky_relocate();
});

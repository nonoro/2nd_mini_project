<script src="jquery-3.6.0.min"></script>
$(document).on('mouseover', '.topMenu span', function() {
    $('.dept01').slideDown(300);

});
$(document).on('mouseleave', 'div', function () {
    if (!$(this).hasClass('topMenu')) {
        $('.dept01').slideUp(300);
    }
});

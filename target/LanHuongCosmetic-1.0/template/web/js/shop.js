$(document).ready(function () {
    $("body").fadeIn(400);

    $('#myCarousel').carousel()
    $('#newProductCar').carousel()

    /* Home page item price animation */
    $('.thumbnail').mouseenter(function () {
        $(this).children('.zoomTool').fadeIn();
    });

    $('.thumbnail').mouseleave(function () {
        $(this).children('.zoomTool').fadeOut();
    });

// Show/Hide Sticky "Go to top" button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            $(".gotop").fadeIn(200);
        } else {
            $(".gotop").fadeOut(200);
        }
    });
// Scroll Page to Top when clicked on "go to top" button
    $(".gotop").click(function (event) {
        event.preventDefault();
        $.scrollTo('#gototop', 1500, {
            easing: 'easeOutCubic'
        });
    });
// Active Elements
    $( '.alignR a' ).on( 'click', function () {
        $( '.alignR' ).find( 'a.active' ).removeClass( 'active' );
        $( this ).addClass( 'active' );
    });

    /*$( '.nav-collapse .nav li' ).on( 'click', function () {
        $( '.nav-collapse .nav' ).find( 'li.active' ).removeClass( 'active' );
        $( this ).addClass( 'active' );
    });*/
});

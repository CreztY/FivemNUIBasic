$(document).ready(function (){
    window.addEventListener('message', function (event) {
        var data = event.data;
        if (data.action == "openUI") {
            openMenu();
        }
        if (data.action == "closeUI") {
            $('.container').fadeOut(250);
            closeAll();
        }
    })
});

$(document).on('keydown', function(event) {
    switch(event.keyCode) {
        case 27: // ESC
            $.post('https://LVMRP_nuevo/Close');
            break;
    }
});

function closeAll(){
    $('.container').fadeOut(250);
	$(".WelcomeContainer").css("display", "none");
}

function openMenu(){
    $('.container').fadeIn(250);
	$(".WelcomeContainer").css("display", "block");
}
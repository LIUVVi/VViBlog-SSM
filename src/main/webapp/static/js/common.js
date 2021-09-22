$("#head").click(function () {
    $("#head-menu").slideToggle(200);
})

$(".show-menu").click(function () {
    $("#fa-bars").toggleClass("fa-close").toggleClass("fa-bars");
    $(".nav").slideToggle();
})

$(window).scroll(function(){
    if($(window).scrollTop()>300){
        $('#top').fadeIn(300);
    } else{
        $('#top').fadeOut(200);
    }

})

$("#top").click(function(){
    $('body,html').animate({scrollTop:0},1500);
        return false;
    })

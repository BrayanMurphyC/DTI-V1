
function validarRegistro(){

  $("#subscriber_password_confirmation").after("<i class='icon icon-close' id='icon_error'></i>");
  $("#subscriber_password_confirmation").after("<i class='icon icon-check' id='icon_validation'></i>");

  $("#contraseña").after("<i class='icon icon-close' id='icon_error2'></i>");
  $("#contraseña").after("<i class='icon icon-check' id='icon_validation2'></i>");

  $("#icon_validation").hide();
  $("#icon_error").hide();
;
  $("#icon_validation2").hide();
  $("#icon_error2").hide();

  $("#contraseña ").keyup(function() {

    if($("#contraseña").val().length < 6 ){

    $("#icon_validation2").hide();
    $("#icon_error2").show();

    $("#contraseña").removeClass("Validation");
    $("#contraseña").addClass("ErrorValidation");

  }else{
      $("#contraseña").removeClass("ErrorValidation");
      $("#contraseña").addClass("Validation");
      $("#icon_error2").hide();
      $("#icon_validation2").show();
  }

  });



  $("#subscriber_password_confirmation, #contraseña ").keyup(function() {

    if($("#contraseña").val().length >= 6 ){

      if($("#subscriber_password_confirmation").val() !== $("#contraseña").val() ){
      $("#icon_validation").hide()
      $("#icon_error").show()

      $("#subscriber_password_confirmation").removeClass("Validation");
      $("#subscriber_password_confirmation").addClass("ErrorValidation");

      }else{
          $("#subscriber_password_confirmation").removeClass("ErrorValidation");
          $("#subscriber_password_confirmation").addClass("Validation");
          $("#icon_error").hide()
          $("#icon_validation").show()
      }
      }else{

        $("#subscriber_password_confirmation").removeClass("Validation");
        $("#subscriber_password_confirmation").removeClass("ErrorValidation");
        $("#icon_validation").hide();
        $("#icon_error").hide();
      }
  });

}


function smoothScroll (duration) {
$('a[href^="#"]').on('click', function(event) {

var target = $( $(this).attr('href') );

if( target.length ) {
event.preventDefault();
$('html, body').animate({
scrollTop: target.offset().top
}, duration);
}
});
}



function Contador()
{
$('.count').each(function () {

$(this).prop('Counter',0).animate({
Counter: $(this).text()
}, {
duration: 4000,
easing: 'swing',
step: function (now) {
$(this).text(Math.ceil(now));
}
});
});
}

function areaShow()
{
$(window).scroll(function(){
var areaTop = $("#areas").offset().top;
var wTop = $(window).scrollTop();
var wHeigth = $(window).height();
if((wTop + wHeigth) > (areaTop + 300)){

$(".area").addClass("show");
$(".area >  i").addClass("show");
$(".area >  p").addClass("show");
$(".area >  span").addClass("show");

}

});

}


function eventoShow()
{

$(window).scroll(function(){
var eventoTop = $("#eventos").offset().top;
var wTop = $(window).scrollTop();
var wHeigth = $(window).height();

if((wTop + wHeigth) > (eventoTop + 450)){

$(".evento-content").each(function( index ) {
setTimeout(function(){
$(".evento-content").eq(index).addClass("show");
}, index*200);

});

}

});
}

function articuloShow()
{

$(window).scroll(function(){
var articuloTop = $("#pub").offset().top;
var wTop = $(window).scrollTop();
var wHeigth = $(window).height();

if((wTop + wHeigth) > (articuloTop + 450)){

$(".pub-content").each(function( index ) {
setTimeout(function(){
$(".pub-content").eq(index).addClass("show");
}, index*200);

});

}

});
}

function equipoShow()
{

$(window).scroll(function(){
var equipoTop = $("#equipo").offset().top;
var wTop = $(window).scrollTop();
var wHeigth = $(window).height();

if((wTop + wHeigth) > (equipoTop + 500)){

$(".miembro").each(function( index ) {
setTimeout(function(){
$(".miembro").eq(index).addClass("show");
}, index*200);

});

}

});
}

function showMenu()
{

$('.toggle').click(function(){
$('.toggle').hide();
$('.close').show();

$(".item").each(function( index ) {
setTimeout(function(){
$(".item").eq(index).removeClass('hide').addClass("show");
}, index*50);

});

});
}

function closeMenu()
{

$('.close').click(function(){
$('.close').hide();
$('.toggle').show();

var sizeMenu = $(".item").length

$(".item").each(function( index ) {
setTimeout(function(){
$(".item").eq(sizeMenu-1-index).removeClass('show').addClass("hide");
}, index*50);

});

});
}




function aboutSlide()
{

$('.msg-btn').click(function(){

var $this = $(this),
$siblings = $this.parent().children(),
position = $siblings.index($this);
$('.about-wrap').removeClass('show').eq(position).addClass('show');
$('.shape').removeClass('show').eq(position).addClass('show');
$('.slide-button').removeClass('show').eq(position).addClass('show');

});


}


function moveLeft(left)
{
$('.pub-move').css({
"margin-left" : left
});
}


function parallax(){
$(window).scroll(function(){
var wTop = $(window).scrollTop();
var headerHeight = $(window).height();
$('#about').css({
"margin-top" : -wTop
})
if(wTop < headerHeight/4){
$('nav').css({
"transition" : "none",
"margin-top" : (wTop/40)+wTop,
});
}else {
$('nav').css({
"transition" : "all ease-in-out .3s",
"margin-top" : "0"
});
}

});
}

function modal()
{
$('#ingresar').click(function(){
$('#modal-ingresar, .modal .modal-wrap').addClass('showModal')
});

$('.icon-cancel').click(function(){
$('#modal-ingresar, .modal .modal-wrap').removeClass('showModal')
})
}

function modal2()
{
$('#registrarse').click(function(){
$('#modal-registrarse, .modal .modal-wrap').addClass('showModal')
});

$('.icon-cancel').click(function(){
$('#modal-registrarse, .modal .modal-wrap').removeClass('showModal')
})
}


function modal3()
{
  $('#modal-alert').removeClass('hideModal')
  $('#modal-alert').addClass('showModal')
  $('.icon-cancel').click(function(){
  $('#modal-alert').removeClass('showModal')
  $('#modal-alert').addClass('hideModal')
})
}

function modal4()
{
$('#add-ponente').click(function(){
$('#modal-add-ponente, .modal .modal-wrap').addClass('showModal')
});

$('.icon-cancel').click(function(){
$('#modal-add-ponente, .modal .modal-wrap').removeClass('showModal')
})
}

function modal5()
{
$('#btn-confirm').click(function(){
$('#modal-confirm, .modal .modal-wrap').addClass('showModal')
});

$('.icon-cancel').click(function(){
$('#modal-confirm, .modal .modal-wrap').removeClass('showModal')
})
}


function menuArea(){

  $('#menu-area-show').click(function(){
    $(".items-area").removeClass("hide");
    $(".items-area").addClass("show");
    $('#menu-area-show').hide();
    $('#menu-area-hide').show();
    $(".nav-areas").css({
      "background-color" : "rgba(29, 38, 47, 0.97)"
    });
  })

  $('#menu-area-hide').click(function(){
    $(".items-area").removeClass("show");
    $(".items-area").addClass("hide");
    $('#menu-area-hide').hide();
    $('#menu-area-show').show();
    $(".nav-areas").css({
      "background-color" : "transparent"
    });
  })


}

function menuTema(){

  $('.display-tema').click(function(){
    $(this).parent().parent().siblings().removeClass("hide");
    $(this).parent().parent().siblings().addClass("show");
    $(this).hide();
    $(this).siblings(".hide-tema").show();
    $(this).parent().addClass("ponente-active")
  })

  $('.hide-tema').click(function(){
    $(this).parent().parent().siblings().removeClass("show");
    $(this).parent().parent().siblings().addClass("hide");
    $(this).hide();
    $(this).siblings(".display-tema").show();
    $(this).parent().removeClass("ponente-active")
  })


}

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require jquery.stellar
//= require turbolinks-compatibility
//= require jquery.countdown
//= require jquery.countdown-es
//= require select2
//= require masonry.pkgd
//= require_tree .
//= require turbolinks
//= require ckeditor/init


$.turbo.use('turbolinks:load', 'turbolinks:request-start')

$(document).on('page:change', function() {
  initialize();
  regillas();
});

document.addEventListener("turbolinks:before-cache", function() {
  initialize();
  regillas();
})


function initialize() {
  $.stellar({
		horizontalScrolling:false
	});
}



function regillas(){
  var $container = $('#articulos-list');
  $container.masonry({
    itemSelector: '.articulo-item',
    gutter: 10
  });
}

function previewFile() {
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
}

function previewFile2() {
  var output = document.getElementById('photo-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
}

function previewFile3() {
  var output = document.getElementById('cover_article-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
}

function previewFile4() {
  var output = document.getElementById('profile-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
}

function previewFile5() {
  var output = document.getElementById('profile-preview2');
  output.src = URL.createObjectURL(event.target.files[0]);
}

(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = '//dti-unheval.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();


$(function() {

  validarRegistro();
  initialize();
  regillas();
  showMenu();
  closeMenu();
  areaShow();
  eventoShow();
  aboutSlide();
  // equipoShow();
  moveLeft();
  smoothScroll(600);
  modal();
  modal2();
  modal4();
  modal5();
  menuArea();
  articuloShow();
  menuTema();

  $(".hide-tema").hide();
  $(".display-tema").show();

  $('#ponentes_table, #registro_evento, #documentos').dataTable({
  // "bPaginate": false,
  "oLanguage": { "sSearch": "" },
  "pageLength": 3
  });


  var i=0, j=1, left=0;
  $(window).scroll(function(){
    var numeroTop = $("#numeros").offset().top;
    var wTop = $(window).scrollTop();
    var wHeigth = $(window).height();
    if((wTop + wHeigth) > (numeroTop + 350) && i==0){
    $(".count").addClass("show");
    $(".numero > i").addClass("show");
    $(".numero > p").addClass("show");
    Contador()
    i++
    }
  });

  if($(window).width() < 760) {
    $('.toggle').show();
    $('#menu-area-hide').hide();
    $('#menu-area-show').show();
  }





  if($("#mensaje").text()!=0){
      modal3();
      // setTimeout(function(){
      //   $('#modal-alert').removeClass('showModal')
      //   $('#modal-alert').addClass('hideModal')
      // }, 5000);
  }

  $("#selecttwo").select2({
    maximumSelectionLength: 4
  });
  $("#selecttwo2").select2({
    maximumSelectionLength: 4
  });
   $("#selecttwo3").select2({
      maximumSelectionLength: 4
  });

  setInterval(function()
  {
    if( j  < 4) {
    $('.about-wrap').removeClass('show').eq(j).addClass('show');
    $('.shape').removeClass('show').eq(j).addClass('show');
    $('.slide-button').removeClass('show').eq(j).addClass('show');
    j++;
    }else {
    $('.about-wrap').removeClass('show').first().addClass('show');
    $('.shape').removeClass('show').first().addClass('show');
    $('.slide-button').removeClass('show').first().addClass('show');

    j=1;
    }
  },20000,j);




  $('.move-left').click(function(){

  if($(window).width() > 975) {
  var numeroPub = $('.pub-content').length - 2
  }
  if($(window).width() < 975 && $(window).width() > 710 ) {
  var numeroPub = $('.pub-content').length - 1
  }
  if($(window).width() < 710) {
  var numeroPub = $('.pub-content').length
  }
  var longitudPub = numeroPub * -280;
  left=left-280;
  if(left > longitudPub ){
  moveLeft(left)
  }else{
  left=0;
  moveLeft(left)
  }


  });

  $('.move-right').click(function(){

  if($(window).width() > 975) {
  var numeroPub = $('.pub-content').length - 2
  }
  if($(window).width() < 975 && $(window).width() > 710 ) {
  var numeroPub = $('.pub-content').length - 1
  }
  if($(window).width() < 710) {
  var numeroPub = $('.pub-content').length
  }


  var longitudPub = numeroPub * 280;

  left=left+280;

  if(left < longitudPub && left < 0 ){
  moveLeft(left)
  }else{
  left=0;
  moveLeft(left)
  }
  });
  });

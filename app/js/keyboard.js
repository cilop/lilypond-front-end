console.log('keyboard loaded!')

$(function(){

  $(document).keypress(function(event){
    console.log(helper.keycode(event.which));
  });

  $('#leftPanel').on('scroll', function(){
    $('#main').scrollTop($(this).scrollTop());
  });

  $('#main').on('scroll', function(){
    $('#leftPanel').scrollTop($(this).scrollTop());
  });



})


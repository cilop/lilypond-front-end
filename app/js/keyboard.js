"use strict";

$(function(){

  $(document).keypress(function(event){
    helper.events(helper.keycode(event.which));
  });

  $('#leftPanel').on('scroll', function(){
    $('#main').scrollTop($(this).scrollTop());
  });

  $('#main').on('scroll', function(){
    $('#leftPanel').scrollTop($(this).scrollTop());
  });

});


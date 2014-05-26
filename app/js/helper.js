"use strict";

window.helper = {};

helper.animateKey = function(key){
  var element = $('.' + helper.class(helper.keycode(key)));
  element.toggleClass('dark');
  setTimeout(function(){
    element.toggleClass('dark');
  }, 50);
};

helper.layer = "<div id='layer' ng-model='layer" + helper.staves + "'>layer<div id='meta'>meta</div><div id='staff'>staff<input><div ng-model='staff" + helper.staves + "'> {{ note }} </div></div></div>";

helper.events = function(key){
  helper.animateKey(key);
};

helper.keycode = function(code){
  
  if (code === 59) {
    return ';';
  }
  else if (code === 44){
    return ',';
  }
  else if (code === 46){
    return '.';
  }
  else if (code === 47){
    return '/';
  }

  var letters = 'abcdefghijklmnopqrstuvwxyz';
  return letters[code - 65];
};

helper.class = function(char){
  if (char === ';'){
    return 'semc';
  }
  else if (char === '.'){
    return 'dot';
  }
  else if (char === '/'){
    return 'slash';
  }
  else if (char === ','){
    return 'comma';
  }

  return char;
};

"use strict";

window.helper = {};

helper.staves = 0;

helper.animateKey = function(key){
  // console.log('.' + helper.class(helper.keycode(key)))
  var element = $('.' + helper.class(helper.keycode(key)));
  // console.log(helper.class(key))
  // console.log(element)
  element.toggleClass('dark');
  setTimeout(function(){
    element.toggleClass('dark');
  }, 50);
}

helper.addStaff = function(){
  $('#main').append(helper.layer);
  helper.staves++;
};

helper.layer = "<div id='layer' ng-model='layer" + helper.staves + "'>layer<div id='meta'>meta</div><div id='staff'>staff<input><div ng-model='staff" + helper.staves + "'> {{ note }} </div></div></div>";

helper.events = function(key){
  console.log(key)
  helper.animateKey(key);

  if (key === 'z'){
    // helper.addStaff();

  }
}

helper.keycode = function(code){
  console.log(code)
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
  console.log(letters[code - 65])
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
}

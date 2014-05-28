"use strict";

// - Fraction object (this one maybe not)
// - staffEvent
// - staffMeasure
// - metaEvent
// - metaMeasure

window.helper = {};

helper.fraction = function(n,d){
  this.n = n;
  this.d = d;
};

helper.staffEvent = function(clef){
  this.clef = clef;
};

helper.staffMeasure = function(events, notes){
  this.events = events;
  this.notes = notes;
};

helper.metaEvent = function(key, time, barline) {
  this.key = key;
  this.time = time;
  this.barline = barline;
};

helper.metaMeasure = function(events) {
  this.events = events;
};


helper.animateKey = function(key){
  var key = helper.class(helper.keycode(key));
  var element = $('.' + key);
  element.toggleClass('dark');
  setTimeout(function(){
    element.toggleClass('dark');
  }, 50);
  return key;
};

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

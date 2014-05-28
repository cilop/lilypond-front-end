# "use strict";

# // - Fraction object (this one maybe not)
# // - staffEvent
# // - staffMeasure
# // - metaEvent
# // - metaMeasure

# window.helper = {};

# helper.note = function(pitch, duration) {
#   this.pitch = pitch;
#   this.duration = duration;
# };

# helper.staffMeasure = function(events, notes){
#   this.events = events;
#   this.notes = notes;
# };

# helper.metaMeasure = function(events) {
#   this.events = events;
# };


# helper.animateKey = function(key){
#   var key = helper.class(helper.keycode(key));
#   var element = $('.' + key);
#   element.toggleClass('dark');
#   setTimeout(function(){
#     element.toggleClass('dark');
#   }, 50);
#   return key;
# };

# helper.events = function(key){
#   helper.animateKey(key);
# };

# helper.keycode = function(code){
  
#   if (code === 59) {
#     return ';';
#   }
#   else if (code === 44){
#     return ',';
#   }
#   else if (code === 46){
#     return '.';
#   }
#   else if (code === 47){
#     return '/';
#   }

#   var letters = 'abcdefghijklmnopqrstuvwxyz';
#   return letters[code - 65];
# };

# helper.class = function(char){
#   if (char === ';'){
#     return 'semc';
#   }
#   else if (char === '.'){
#     return 'dot';
#   }
#   else if (char === '/'){
#     return 'slash';
#   }
#   else if (char === ','){
#     return 'comma';
#   }

#   return char;
# };



window.helper = {}

helper.note = (pitch, duration)->
  this.pitch = pitch
  this.duration = duration

helper.staffMeasure = (events, notes)->
  this.events = events
  this.notes = notes

helper.metaMeasure = (events)->
  this.events = events

helper.animateKey = (key)->
  key = helper.class(helper.keycode(key))
  element = $('.' + key)
  element.toggleClass('dark')
  setTimeout(->
    element.toggleClass('dark')
  ,50)
  key

helper.events = (key)->
  helper.animateKey(key)

helper.keycode = (code)->
  if code is 59 then return ';'
  else if code is 44 then return ','
  else if code is 46 then return '.'
  else if code is 47 then return '/'

  'abcdefghijklmnopqrstuvwxyz'[code - 65]

helper.class = (char)->
  if char is ';' then return 'semc'
  else if char is '.' then return 'dot'
  else if char is '/' then return 'slash'
  else if char is ',' then return 'comma'

  char



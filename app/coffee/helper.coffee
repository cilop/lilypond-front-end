window.helper = {}

helper.note = (pitch, num, den)->
  this.pitch = pitch
  this.duration = 
    n: num
    d: den
  this

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
  ,100)
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



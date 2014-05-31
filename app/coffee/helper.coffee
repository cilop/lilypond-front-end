window.helper = {}



helper.getDuration = (str) ->

  try
    notes = str.split(',')
  catch e
    return 0
  
  duration = 0

  if notes.length is 1 then return 0

  for note in notes
    check = helper.checkNoteString(note)
    if check[0] then duration += check[1]

  duration

helper.noteString = (num) ->
  num++
  "[Note #{num} ready!] "

helper.checkNoteString = (str) ->

  try
    splitted = str.split(' ')
    pitch = splitted[0]
    duration = splitted[1]
    numbers = duration.split('/')
  catch e
    return [false]

  n = numbers[0]
  d = numbers[1]

  if parseInt(pitch) and parseInt(n) and parseInt(d) then return [true, parseInt(n) / parseInt(d)]
  else return [false]

helper.parseIncomplete = (str) ->
  
  try
    splitted = str.split(',')
  catch e
    return 'rendering note ..'
  
  phrase = ''

  if splitted.length is 1 then return 'rendering note ..'

  for num in [0...splitted.length]
    if helper.checkNoteString(splitted[num])[0] then phrase += helper.noteString(num)
    else phrase += 'rendering note ..'
    
  phrase


helper.parseNotes = (noteString) ->
  splitted = noteString.split(',')
  notes = []

  for note in splitted
    splittedInside = note.split(' ')

    pitch = splittedInside[0]
    numbers = splittedInside[1].split('/')

    n = numbers[0]
    d = numbers[1]
    notes.push(new helper.note(pitch,n,d))

  notes


helper.addDuration = (duration) ->
  parseInt(duration.n) + parseInt(duration.d)

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
  else if code is 13 then return 'enter'

  'abcdefghijklmnopqrstuvwxyz'[code - 65]

helper.class = (char)->
  if char is ';' then return 'semc'
  else if char is '.' then return 'dot'
  else if char is '/' then return 'slash'
  else if char is ',' then return 'comma'

  char



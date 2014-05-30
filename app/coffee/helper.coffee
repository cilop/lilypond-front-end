window.helper = {}

helper.noteString = (num) ->
  "[Note #{num} ready!] "

helper.checkNoteString = (str) ->
  try
    splitted = str.split(' ')
    pitch = splitted[0]
    dur = splitted[1]
    n = dur.split('/')[0]
    d = dur.split('/')[1]

    if parseInt(pitch) and parseInt(n) and parseInt(d) then return true
    else return false

  catch e
    return false
  

helper.parseIncomplete = (str) ->
  
  try
    splitted = str.split(',')
  catch e
    return 'rendering note ..'
  
  phrase = ''

  if splitted.length is 1 then return 'rendering note ..'

  for num in [0...splitted.length]
    if helper.checkNoteString(splitted[num]) then phrase += helper.noteString(num)
    else phrase += 'rendering note ..'
    
  phrase


helper.parseNotes = (noteString) ->
  splitted = noteString.split(',')
  notes = []

  # Lots of room for improvement, but readable for now:
  for note in splitted
    pitch = note.split(' ')[0]
    n = note.split(' ')[1].split('/')[0]
    d = note.split(' ')[1].split('/')[1]
    notes.push(new helper.note(pitch,n,d))

  notes


helper.addDuration = (duration) ->
  parseInt(duration.n) + parseInt(duration.d)

# helper.insertNote = (measure, addNote)->
#   notesArray = measure.notes
#   duration = 0

#   for note in notesArray
#     duration += helper.addDuration(note.duration)

#   duration += helper.addDuration(addNote.duration)

#   if duration > 1
#     return false
#   else
#     notesArray.push(addNote)
#     return true

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



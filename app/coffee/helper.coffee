window.helper = {}

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



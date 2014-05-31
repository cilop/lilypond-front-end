fs = require('fs')

require('nw.gui').Window.get().showDevTools()

angular.module('app', ['leftBar','documentView'])

.controller('mainCtrl', ($scope, dataFactory) ->

  $('#loadFile').on('click', ->
    LZADialog.selectFile({}, (file) ->
      path = file.path
      filename = file.name
      dir = path.replace(filename, '')
      data = new FileReader()
      data.readAsText(file)

      data.onloadend = ->
        try
          console.log(dataFactory)
          fileContents = JSON.parse(data.result)
          # alert 'Read file OK'
          dataFactory = fileContents
          alert 'Load file OK'
          console.log(dataFactory)
        catch e
          alert 'Unreadable file: ' + e
        
      )
    )


  $('#saveFile').on('click', ->
    console.log 'Saving file'
    console.log dataFactory
    LZADialog.saveFileAs((file) ->
      path = file.path
      filename = file.name
      dir = path.replace(filename,'')
      if not filename.match('.json') then filename = filename + '.json'

      fs.writeFile(dir + filename, JSON.stringify(dataFactory), (err) ->
        if err
          alert err
        else
          alert 'Saved file in: ' + dir + filename
        )
      )
    )

  # $scope.$on('leftChange', (value) ->
  #   console.log 'App listened!'
  #   timeSig = value.targetScope.ngModel.time
  #   key = value.targetScope.ngModel.key
  #   # todo: remove hardcoded 0
  #   dataFactory.meta.measures[0].events.time = 
  #     n: timeSig.top
  #     d: timeSig.bottom
  #     key: key
  #   )

  $scope.$on('dataChanged', (value) ->
    console.log(value.targetScope.model)
    # console.log(dataFactory)
    dataFactory = value.targetScope.model
    # console.log(dataFactory)
    console.log 'Updated store'
    )

  $scope.click = (event) ->
    key = event.target.className
    helper.animateKey(key)

  $scope.leftBarModel = 
    key: 0
    time:
      top: 4
      bottom: 4
    staves: [{
      clef: 'treble'
      }]

  # $scope.documentModel = {}
  )

# .directive('ngTrack', ->
#   staffNum = 0
#   restrict: 'EA'
#   replace: true
#   scope: true
#   templateUrl: 'staff.html'
#   controller: ($scope, $element, $compile) ->
#     $element.keydown((event) ->
#       key = helper.animateKey(event.which)
#       if key is 'z'
#         el = $compile('<div ng-track tabindex="0"></div>')($scope)
#         $element.parent().append(el)
#       else
#         console.log(key)
#         $scope.test += key
#       )
#     link: (scope) ->
#       scope.test = ++staffNum
#   )

.factory('dataFactory', ->
  pitch = 52
  clef = 'treble'
  barline = 'some string'
  time = 
    n: 3
    d: 4

  key = -3

  data = {}
  duration = {}
  note = 
    pitch: pitch
    duration: duration

  events = 
    clef: clef

  notes = [note]
  measure = 
    events: events
    notes: notes

  measures = [measure]
  staff = 
    measures: measures

  staves = [staff]

  data.staves = staves
  events = 
    key: key
    time: time
    barline: barline

  measure = 
    events: events

  measures = [measure]

  meta = 
    measures: measures

  data.meta = meta

  window.data = data

  data
  
  )

.controller('IOCtrl', (dataFactory) ->

  # $('#loadFile').on('click', ->
  #   LZADialog.selectFile({}, (file) ->
  #     path = file.path
  #     filename = file.name
  #     dir = path.replace(filename, '')
  #     data = new FileReader()
  #     data.readAsText(file)

  #     data.onloadend = ->
  #       try
  #         console.log(dataFactory)
  #         fileContents = JSON.parse(data.result)
  #         # alert 'Read file OK'
  #         dataFactory = fileContents
  #         alert 'Load file OK'
  #         console.log(dataFactory)
  #       catch e
  #         alert 'Unreadable file: ' + e
        
  #     )
  #   )


  # $('#saveFile').on('click', ->
  #   console.log 'Saving file'
  #   console.log dataFactory
  #   LZADialog.saveFileAs((file) ->
  #     path = file.path
  #     filename = file.name
  #     dir = path.replace(filename,'')
  #     if not filename.match('.json') then filename = filename + '.json'

  #     fs.writeFile(dir + filename, JSON.stringify(dataFactory), (err) ->
  #       if err
  #         alert err
  #       else
  #         alert 'Saved file in: ' + dir + filename
  #       )
  #     )
  #   )


  )


















fs = require('fs')

angular.module('app', ['leftBar','documentView'])

.controller('mainCtrl', ($scope, dataFactory) ->

  $scope.$on('leftChange', (value) ->
    timeSig = value.targetScope.ngModel.time
    key = value.targetScope.ngModel.key
    # todo: remove hardcoded 0
    dataFactory.meta.measures[0].events.time = 
      n: timeSig.top
      d: timeSig.bottom
      key: key

    console.log('New meta is: ')
    console.log(dataFactory.meta)
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

.directive('ngTrack', ->
  staffNum = 0
  restrict: 'EA'
  replace: true
  scope: true
  templateUrl: 'staff.html'
  controller: ($scope, $element, $compile) ->
    $element.keydown((event) ->
      key = helper.animateKey(event.which)
      if key is 'z'
        el = $compile('<div ng-track tabindex="0"></div>')($scope)
        $element.parent().append(el)
      else
        console.log(key)
        $scope.test += key
      )
    link: (scope) ->
      scope.test = ++staffNum
  )

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

  data
  
  )

.controller('IOCtrl', (dataFactory) ->
  $('#saveFile').on('click', ->
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
  )


















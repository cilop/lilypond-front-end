musicSVG = angular.module 'musicSVG', []

musicSVG.directive 'ngPath', ->
  restrict: 'A'
  scope:
    name: '@', x: '@', y: '@'
  link: (scope, $element, $attrs) ->
    $element.attr
      d: paths[scope.name]?.d or 'M 0 0'
      transform: "translate(#{scope.x or 0}, #{scope.y or 0})
        scale(#{paths[scope.name]?.scale?.x or 0}, #{paths[scope.name]?.scale?.y or 0})"
      stroke: 'currentColor'
    scope.$watch 'name', (newName) ->
      $element.attr
        d: paths[scope.name]?.d or 'M 0 0'
        transform: "translate(#{scope.x or 0}, #{scope.y or 0})
          scale(#{paths[scope.name]?.scale?.x or 0}, #{paths[scope.name]?.scale?.y or 0})"

musicSVG.directive 'ngStaff', ->
  restrict: 'A'
  scope:
    width: '@', x: '@', y: '@'
  link: (scope, $element, $attrs) ->
    $element.attr transform: "translate(#{scope.x or 0}, #{scope.y or 0})"
    for height in [-2..2]
      line = document.createElementNS svgNamespace, 'line'
      angular.element(line).attr
        x1: 0, y1: height, x2: scope.width, y2: height
        'stroke-width': 0.1, stroke: 'currentColor'
      $element.append line

musicSVG.directive 'ngLine', ->
  restrict: 'A'
  scope:
    width: '@', x: '@', y: '@'
  link: (scope, $element, $attrs) ->
    $element.attr
      transform: "translate(#{scope.x or 0}, #{scope.y or 0})"
      x1: 0, y1: 0, x2: scope.width, y2: 0
      'stroke-width': 0.1, stroke: 'currentColor'

musicSVG.directive 'ngKeySignature', ->
  restrict: 'A'
  scope:
    value: '@', x: '@', y: '@'
  controller: ['$scope', ($scope) ->
    $scope.paths = _.memoize (value) -> # Memoizing prevents infinite digest loops
      name = if value >= 0 then 'sharp' else 'flat'
      sharpHeights = [-1.5, 0, -2, -0.5, 1, -1, 0.5]
      flatHeights = [0.5, -1, 1, -0.5, 1.5, 0, 2]
      heights = if name is 'sharp' then sharpHeights else flatHeights
      ({name: name, x: i, y: heights[i]} for i in [0...Math.abs(value)] when i < 7)
  ]
  template: '<path ng-path ng-repeat="path in paths(value)"
    name="{{path.name}}" x="{{path.x}}" y="{{path.y}}"/>'
  link: (scope, $element, $attrs) ->
    $element.attr transform: "translate(#{scope.x or 0}, #{scope.y or 0})"

musicSVG.directive 'ngTimeSignature', ->
  restrict: 'A'
  scope:
    top: '@', bottom: '@', x: '@', y: '@'
  template: '<path ng-path name="{{top}}"/><path ng-path name="{{bottom}}" y="2"/>'
  link: (scope, $element, $attrs) ->
    $element.attr transform: "translate(#{scope.x or 0}, #{scope.y or 0})"
  
musicSVG.directive 'ngStem', ->
  restrict: 'A'
  scope:
    direction: '@'
  link: (scope, $element, $attrs) ->
    $element.attr
      x: if scope.direction is 'up' then 1.2512 else 0
      y: if scope.direction is 'up' then -3.5 else 0.1878
      width: 0.13, height: 3.3122, ry: 0.04, fill: 'currentColor'

musicSVG.directive 'ngNote', ->
  restrict: 'A'
  scope:
    type: '@', stem: '@', x: '@', y: '@'
  controller: ['$scope', ($scope) ->
    $scope.noteHeadName = (type) ->
      switch type
        when '1' then 'wholeNoteHead'
        when '2' then 'halfNoteHead'
        else 'solidNoteHead'
  ]
  template: '<path ng-path name="{{noteHeadName(type)}}"/>
    <rect ng-stem direction="{{stem}}" ng-hide="type == 1"/>'
  link: (scope, $element, $attrs) ->
    $element.attr transform: "translate(#{scope.x or 0}, #{scope.y or 0})"

musicSVG.directive 'ngPositionedNote', ->
  restrict: 'A'
  scope:
    type: '@', position: '@', x: '@', y: '@'
  template: '<g ng-note type="{{type}}" y="{{position}}"
    stem="{{position > 0 ? \'up\' : \'down\'}}"/>'
  link: (scope, $element, $attrs) ->
    $element.attr transform: "translate(#{scope.x or 0}, #{scope.y or 0})"

musicSVG.directive 'ngBarLine', ->
  restrict: 'A'
  scope:
    type: '@', position: '@', size: '@'
  link: (scope, $element, $attrs) ->
    $element.attr
      transform: "translate(#{scope.position or 0}, 0)"
      x: -0.19, y: -(scope.size or 2)
      width: 0.19, height: 2 * (scope.size or 2), fill: 'currentColor'

musicSVG.directive 'ngMeasure', ->
  restrict: 'A'
  require: 'ngModel'
  scope: 
    ngModel: '=', size: '@'
  template: '<g ng-staff width="{{size}}"/>
    <g ng-positioned-note ng-repeat="note in ngModel.notes"
      position="{{-1/2 * (note.pitch - 71)}}" type="{{note.duration.d}}" x="{{2 * $index + 1}}"/>
    <rect ng-bar-line type="|" position="{{size}}"/>'
  link: (scope, $element, $attrs) ->
    $element.attr
      width: scope.size * 8, height: 64
    $element[0].setAttribute 'viewBox', "0 -4 #{scope.size} 8"

musicSVG.directive 'ngMetaMeasure', ->
  restrict: 'A'
  require: 'ngModel'
  scope: 
    ngModel: '=', size: '@'
  template: '<line ng-line width="{{size}}"/>
    <rect ng-bar-line type="|" size="1" position="{{size}}"/>'
  link: (scope, $element, $attrs) ->
    $element.attr
      width: scope.size * 8, height: 64
    $element[0].setAttribute 'viewBox', "0 -4 #{scope.size} 8"

svgNamespace = 'http://www.w3.org/2000/svg'

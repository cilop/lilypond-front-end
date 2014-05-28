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
  

svgNamespace = 'http://www.w3.org/2000/svg'


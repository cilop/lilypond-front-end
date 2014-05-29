documentView = angular.module 'documentView', ['musicSVG']

documentView.directive 'documentView', ->
  restrict: 'A'
  require: 'ngModel'
  scope: 
    ngModel: '='
  controller: ['$scope', ($scope) ->
    $scope.test = ''
    $scope.model =
      meta:
        measures: [{},{}]
      staves: [
        measures: [
          {notes: [
            {pitch: 69, duration: {n: 1, d: 4}}
            {pitch: 70, duration: {n: 1, d: 2}}
            {pitch: 71, duration: {n: 1, d: 4}}
          ]}
          {notes: [
            {pitch: 71, duration: {n: 1, d: 2}}
            {pitch: 72, duration: {n: 1, d: 4}}
            {pitch: 73, duration: {n: 1, d: 4}}
          ]}
          {notes: [
            {pitch: 69, duration: {n: 1, d: 4}}
            {pitch: 70, duration: {n: 1, d: 2}}
            {pitch: 71, duration: {n: 1, d: 4}}
          ]}
        ]
      ]
    $scope.width = (measureIndex) ->
      _.max _($scope.model.staves).map (staff) ->
        2 * staff.measures[measureIndex].notes.length + 1
  ]
  template:
    '<div class="staff">
      <svg ng-meta-measure ng-repeat="measure in model.meta.measures"
        ng-model="measure" size="{{width($index)}}" class="document staff"/>
    </div>
    <br>
    <div class="staff">
      <svg ng-measure ng-repeat="measure in model.staves[0].measures"
        ng-model="measure" size="{{width($index)}}" class="document staff"/>
    </div>
    <input class="staffInput" type="text" ng-model="model.test">'
  link: ($scope) ->
    window.data = $scope.model
    console.log($scope.model)
    $scope.$watch('model', ->
      console.log('model changed')
    , true)

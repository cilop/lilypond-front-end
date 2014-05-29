documentView = angular.module 'documentView', ['musicSVG']

documentView.directive 'documentView', ->
  restrict: 'A'
  require: 'ngModel'
  scope: 
    ngModel: '='
  controller: ['$scope', ($scope) ->
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
            {pitch: 69.5, duration: {n: 1, d: 2}}
            {pitch: 70.5, duration: {n: 1, d: 4}}
            {pitch: 71.5, duration: {n: 1, d: 4}}
          ]}
        ]
      ]
    $scope.width = (measure) ->
      2 * measure.notes.length + 1
  ]
  template:
    '<div class="staff">
      <svg ng-meta-measure ng-repeat="measure in model.staves[0].measures"
        ng-model="measure" class="document staff"/>
    </div>
    <br>
    <div class="staff">
      <svg ng-measure ng-repeat="measure in model.staves[0].measures"
        ng-model="measure" class="document staff"/>
    </div>'

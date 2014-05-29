documentView = angular.module 'documentView', ['musicSVG']

documentView.directive 'documentView', ->
  restrict: 'A'
  require: 'ngModel'
  scope: 
    ngModel: '='
  controller: ['$scope', ($scope) ->
    $scope.model =
      notes: [
        {pitch: 69, duration: {n: 1, d: 4}}
        {pitch: 70, duration: {n: 1, d: 2}}
        {pitch: 71, duration: {n: 1, d: 4}}
      ]
    $scope.model2 =
      notes: [
        {pitch: 69, duration: {n: 1, d: 4}}
        {pitch: 70, duration: {n: 1, d: 2}}
        {pitch: 71, duration: {n: 1, d: 4}}
      ]
    $scope.width = (measure) ->
      2 * measure.notes.length + 1
  ]
  template:
    '<div class="staff">
      <svg class="document staff" width="56" height="64" viewBox="0 -4 7 8">
        <line ng-line width="7"/>
      </svg>
    </div>
    <br>
    <div class="staff">
      <svg ng-measure ng-model="model" class="document staff"/>
      <svg ng-measure ng-model="model2" class="document staff"/>
    </div>'

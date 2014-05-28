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
  ]
  template: '<svg class="staff" width="480" height="60" viewBox="0 -4 64 8">
      <line ng-line width="64"/>
    </svg>
    <svg ng-measure ng-model="model" class="staff" width="480" height="60" viewBox="0 -4 64 8"/>'

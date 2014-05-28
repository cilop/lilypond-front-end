leftBar = angular.module 'leftBar', ['musicSVG']

leftBar.directive 'leftBar', ->
  restrict: 'A'
  require: ['^ngModel']
  scope: 
    ngModel: '='
  template:
    '<svg class="staff" width="120" height="60" viewBox="0 -4 16 8">
      <line ng-line width="16"/>
      <g ng-key-signature value="{{ngModel.key}}" x="4" y="0"/>
      <g ng-time-signature
        top="{{ngModel.time.top}}" bottom="{{ngModel.time.bottom}}" x="12"/>
    </svg>
    <svg class="staff" width="120" height="60" viewBox="0 -4 16 8">
      <g ng-staff width="16"/>
      <path ng-path name="trebleClef" x="1" y="1"/>
      <g ng-key-signature value="{{ngModel.key}}" x="4" y="-0.5"/>
      <g ng-time-signature
        top="{{ngModel.time.top}}" bottom="{{ngModel.time.bottom}}" x="12"/>
    </svg>'
  link: ($scope) ->
    console.log $scope.ngModel
    $scope.$watch('ngModel', ->  
      $scope.$emit('leftChange', $scope.ngModel)
    , true)


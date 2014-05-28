documentView = angular.module 'documentView', ['musicSVG']

documentView.directive 'documentView', ->
  restrict: 'A'
  require: ['^ngModel']
  scope: 
    ngModel: '='
  template:
    '<svg class="staff" width="480" height="60" viewBox="0 -4 64 8">
      <line ng-line width="64"/>
    </svg>
    <svg class="staff" width="480" height="60" viewBox="0 -4 64 8">
      <g ng-staff width="64"/>
    </svg>'


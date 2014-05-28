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
      <g ng-repeat="height in [-2,-1,0,1,2]"
        ng-positioned-note type="4" position="{{height}}" x="{{2 * (height + 2)}}"/>
    </svg>'


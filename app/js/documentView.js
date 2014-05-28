// Generated by CoffeeScript 1.7.1
(function() {
  var documentView;

  documentView = angular.module('documentView', ['musicSVG']);

  documentView.directive('documentView', function() {
    return {
      restrict: 'A',
      require: ['^ngModel'],
      scope: {
        ngModel: '='
      },
      template: '<svg class="staff" width="480" height="60" viewBox="0 -4 64 8"> <line ng-line width="64"/> </svg> <svg class="staff" width="480" height="60" viewBox="0 -4 64 8"> <g ng-staff width="64"/> <g ng-note type="1" x="3" y="-1"/> <g ng-note type="2" stem="up" x="5" y="1"/> <g ng-note type="4" stem="down" x="7"/> </svg>'
    };
  });

}).call(this);

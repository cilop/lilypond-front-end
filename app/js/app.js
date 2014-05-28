"use strict";
require('nw.gui').Window.get().showDevTools();
angular.module('app', ['leftBar', 'documentView'])

.controller('mainCtrl', function($scope, $compile){

  // var html = "<div ng-click='add()' id='layer'>layer<div id='meta'>meta</div><div id='staff'>staff<input><div>{{ note }}</div></div></div>";

  $scope.click = function(event){
    var key = event.target.className;
    helper.animateKey(key);
  };

  $scope.leftBarModel = {
    key: 0,
    time: {
      top: 4,
      bottom: 4
    },
    staves: [
      {
        clef: 'treble'
      }
    ]
  };

  $scope.documentModel = {};

})

.directive('ngTrack', function() {
  var staffNum = 0;

  return {
    restrict: 'EA',
    // require: ['^ngModel'],
    replace: true,
    scope: true,
    templateUrl: 'staff.html',
    controller: function($scope, $element, $compile){

      // $scope.test = 'hello world';

      $element.keydown(function(event){
        var key = helper.animateKey(event.which);
        if (key === 'z') {
          var el = $compile('<div ng-track tabindex="0"></div>')($scope);
          $element.parent().append(el);
        } else {
          console.log(key);
          $scope.test = $scope.test + key;
        }
      });

    },
    link: function(scope, ele, attr) {

      scope.test = ++staffNum;
      
    }
  };

})




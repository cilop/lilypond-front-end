"use strict";

// var gui = require('nw.gui');
//   var win = gui.Window.get();
//   var menubar = new gui.Menu({ type: 'menubar' });
//   var file = new gui.Menu();
//   var help = new gui.Menu();
//   win.menu = menubar;
//   win.menu.insert(new gui.MenuItem({ label: 'File', submenu: file}), 1);
//   win.menu.append(new gui.MenuItem({ label: 'Help', submenu: help}));

angular.module('app',[])

.controller('mainCtrl', function($scope, $compile){

  // var html = "<div ng-click='add()' id='layer'>layer<div id='meta'>meta</div><div id='staff'>staff<input><div>{{ note }}</div></div></div>";

  $scope.click = function(event){
    var key = event.target.className;
    helper.animateKey(key);
  };


})

.directive('ngTrack', function($compile) {
  var staffNum = 0;

  return {
    restrict: 'EA',
    require: ['^ngModel'],
    replace: true,
    scope: {
      ngModel: '=',
      select: '&'
      // staffNum: staffNum++
    },
    templateUrl: 'staff.html',
    controller: function($scope, $element, $compile){

      $element.keydown(function(event){
        var key = helper.animateKey(event.which);
        if (key === 'z') {
          var el = $compile('<div ng-model="staff" ng-track tabindex="0"></div>')($scope);
          $element.parent().append(el);
        }
      });

    },
    link: function(scope, ele, attr) {

      staffNum++;
      scope.staffNum = staffNum;
      // console.log('link called');
      // ele.bind('keydown keypress', function(event){
      //   console.log(event)
      //   if (event.which === 122) {
      //     var el = $compile('<div ng-model="staff" ng-staff></div>')(scope);
      //     ele.parent().append(el);
      //   }
      // });
      
    }
  };

})


// .directive('ngLayer', function( $compile ){

//   var html = "<div ng-click='add()' id='layer'>layer<div id='meta'>meta</div><div id='staff'>staff<input><div>{{ note }}</div></div></div>";

//   return {
//     restrict: "E",
//     require: '^ngModel',
//     template: html,
//     scope: {
//       ngModel: '=',
//       scope: true
//     },
//     link: function(scope, iElement, iAttrs){
//       console.log(scope)
//       console.log(iElement)
//       console.log(iAttrs)
//       scope.note = '';
//     },
//     controller: function($scope, $element){
//       $scope.add = function(){
//         console.log('inside add')
//         var el = $compile("<ng-layer></ng-layer>");
//         $element.parent().append(el);
//       };
//     }
//   };

// })

// .controller('layerCtrl', function(){

// })



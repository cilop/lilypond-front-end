"use strict";
angular.module('app', ['leftBar'])

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



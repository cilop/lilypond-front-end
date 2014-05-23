"use strict";
angular.module('app',[])

.controller('mainCtrl', function($scope, $animate, $timeout){

  var animateKey = function(key){
    var element = $('.' + helper.class(key));
    $animate.addClass(element, 'light', function(){
      $timeout(function(){
        $animate.removeClass(element, 'light');
      }, 50);
    });
  }

  $scope.click = function(event){
    var element = angular.element(event.srcElement);
    console.log(element)
    animateKey(element[0].innerText[0]);
    console.log(element[0].innerText[0]);
  };


  $scope.note = '';

  $scope.press = function(event){
    var key = helper.keycode(event.which);
    $scope.input = '';
    console.log('key ' + key + ' pressed');
    $scope.note += key;
    animateKey(key);
  };


})

// .controller('shortcutCtrl', function($scope, $animate, $timeout){

// })

// .controller('staffCtrl', function($scope){

// })

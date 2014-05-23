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
    var key = event.target.className;
    animateKey(key);
  };


  $scope.press = function(event){
    var key = helper.keycode(event.which);
    $scope.input = '';
    console.log('key ' + key + ' pressed');
    helper.events(key);
    $scope.note += key;
    animateKey(key);
  };


})

// .controller('shortcutCtrl', function($scope, $animate, $timeout){

// })

// .controller('staffCtrl', function($scope){

// })


"use strict";
require('nw.gui').Window.get().showDevTools();
var fs = require('fs');
angular.module('app', ['leftBar', 'documentView'])

.controller('mainCtrl', function($scope, dataFactory){

  $scope.$on('leftChange', function(value){
    console.log('appjs')
    // console.log(dataFactory.meta.measures[0].events);
    console.log(value.targetScope.ngModel);
    // window.value = value;
    var timeSig = value.targetScope.ngModel.time;
    var key = value.targetScope.ngModel.key;
    dataFactory.meta.measures[0].events.time = {
      n: timeSig.top,
      d: timeSig.bottom,
      key: key
    };

    console.log('New meta is: ');
    console.log(dataFactory.meta);
  });

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

.factory('dataFactory', function(){

  var data = {};
  var pitch;
  var duration = {};
  var clef;
  var note = {
    pitch: pitch,
    duration: duration
  };

  var events = {
    clef: clef
  };

  var notes = [note];
  var measure = {
    events: events,
    notes: notes
  };

  var measures = [measure];

  var staff = {
    measures: measures
  };

  var staves = [staff];

  data.staves = staves;
  var barline;
  var time;
  var key;

  events = {
    key: key,
    time: time,
    barline: barline
  };

  measure = {
    events: events
  };

  measures = [measure];

  var meta = {
    measures: measures
  };

  data.meta = meta;

  return data;
  // console.log(data);

})




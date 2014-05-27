"use strict";
// var fs = require('fs');
// var path = require('path');
// console.log('---')
// var path = process.cwd() + '/';
// var path = require('path');
require('nw.gui').Window.get().showDevTools();
var fs = require('fs');
// alert(path.dirname(process.execPath))
// console.log(process)
// console.log(process.cwd())

// var proyectPath = process.cwd() + '/proyects/';

$(function(){

  $('#clickable').on('click', function(){
    $('#fileUpload').click();
  });

  $('#fileUpload').on('change',function(){

    var file = $('#fileUpload').get(0).files[0];
    var filename = file.name;
    var filepath = file.path;
    filepath = filepath.replace(filename,'');

    var data = new FileReader();
    data.readAsText(file);

    data.onloadend = function() {
      try {
        var fileContents = JSON.parse(data.result);
        alert('Successfuly read file');
        console.log(fileContents);
      } 
      catch (err) {
        alert('File is unreadable, make sure you selected the correct JSON file');
      }
    };
    
  });


});


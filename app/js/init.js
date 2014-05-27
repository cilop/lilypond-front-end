"use strict";
// var fs = require('fs');
// var path = require('path');
// console.log('---')
// var path = process.cwd() + '/';
// var path = require('path');
require('nw.gui').Window.get().showDevTools();
var fs = require('fs');
// var lzadialog = require('./lzadialog.js');
// alert(path.dirname(process.execPath))
// console.log(process)
// console.log(process.cwd())

// var proyectPath = process.cwd() + '/proyects/';

$(function(){

  $('#saveFile').on('click', function(){
    
    var dummyData = {
      data: false,
      music: true,
      nested: {
        moreData: true,
        name: "GUI"
      }
    };

    LZADialog.saveFileAs(function(file){

      var path = file.path;
      var filename = file.name;
      var dir = path.replace(filename,'');

      if (!(filename.match('.json'))) {
        filename = filename + '.json';
      }

      var dummyData = {
        music: 'on',
        volume: true,
        array: [1,2,3],
        nested: {
          hello: 'world'
        }
      };

      fs.writeFile(dir + filename, JSON.stringify(dummyData), function(err){
        if (err) {
          alert(err);
        } else {
        alert('Save file in: ' + dir + filename);
        }
      });

    });
  });

  $('#fileSave').on('click', function(){
    var dir = $('#fileSave').get(0);
    console.log(dir);
  })

  $('#loadFile').on('click', function(){
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


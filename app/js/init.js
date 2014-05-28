"use strict";

require('nw.gui').Window.get().showDevTools();
var fs = require('fs');


$(function(){

  $('#saveFile').on('click', function(){
    
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

  $('#loadFile').on('click', function(){
    LZADialog.selectFile({}, function(file){
      var path = file.path;
      var filename = file.name;
      var dir = path.replace(filename,'');
      console.log(file);
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

});


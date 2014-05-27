"use strict";
// var fs = require('fs');
// var path = require('path');
// console.log('---')
// var path = process.cwd() + '/';

// require('nw.gui').Window.get().showDevTools();

$(function(){

  $('#clickable').on('click', function(){
    $('#fileUpload').click();
  });

  $('#fileUpload').on('change',function(event){

    console.log($('#fileUpload').get(0).files[0])
    var filename = $('#fileUpload').get(0).files[0].name;
    console.log(filename);
    var dummyData = {
      key: 'pair',
      key2: 'pair2',
      nested: {
        key3: 'pair'
      }
    };

    // fs.readFile(path + 'proyects/' + filename, JSON.stringify(dummyData), function(err){
    //   if (err){
    //     alert(err);
    //   } else {
    //     alert('no error')
    //   }
    // });

  })


});


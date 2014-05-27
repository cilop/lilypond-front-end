"use strict";
// var fs = require('fs');
// var path = require('path');
// console.log('---')
// var path = process.cwd() + '/';
var path = require('path');
require('nw.gui').Window.get().showDevTools();
// alert(path.dirname(process.execPath))
console.log(process)
console.log(process.cwd())

$(function(){

  $('#clickable').on('click', function(){
    $('#fileUpload').click();
  });

  $('#fileUpload').on('change',function(event){

    console.log($('#fileUpload').get(0).files[0])
    var file = $('#fileUpload').get(0).files[0];

    var data = new FileReader();
    data.onloadend = function() {
      console.log('done loading');
      console.log(data.result);
    };
    var result = data.readAsText(file);

    console.log(result);
    console.log(file);

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


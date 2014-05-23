window.helper = {};

helper.keycode = function(code){
  if (code === 59) {
    return ';';
  }
  else if (code === 44){
    return ',';
  }
  else if (code === 46){
    return '.';
  }
  else if (code === 47){
    return '/';
  }

  var letters = 'abcdefghijklmnopqrstuvwxyz';
  return letters[code - 97];
};

helper.class = function(char){
  if (char === ';'){
    return 'semc';
  }
  else if (char === '.'){
    return 'dot';
  }
  else if (char === '/'){
    return 'slash';
  }
  else if (char === ','){
    return 'comma';
  }

  return char;
}

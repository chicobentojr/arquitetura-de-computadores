
  var commands = {
    'add': "00101",
    'sub': "00111"
  }


function codeToHex(code){

  var lines = code.split('\n');

  result = lines.map(lineToHex);

  return result.join('\n');
}

function lineToHex(line) {
  var parts = line.split(' '),
      com = parts[0],
      opcode = commands[com],
      recorders = parts.slice(1).map(function(recorder) {
        var recorderValue = recorder.replace(/[$]/, ""),
            recorderBin = parseInt(recorderValue).toString(2);
            console.log(recorderBin);
        return recorderBin.toFixSize(5);
      }).join(" ");


      console.log(line, parts, com, opcode.toFixSize(5), recorders);
  return [opcode, recorders].join(' ');
}

String.prototype.toFixSize = function (size) {
  var str = this;
  if (str.length < size) str = Array(size - str.length + 1).join("0") + str;
  return str;
}


function compile(){
  var code = document.getElementsByTagName('textarea')[0].value;
  var result = document.getElementById('result');

  result.innerHTML = codeToHex(code);
}

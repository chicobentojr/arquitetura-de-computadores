var commands = Commands.getAll;


function codeToHex(code){

  var lines = code.split('\n');

  binCode = lines.map(lineToBin);
  hexCode = binCode.map(binToHex);

  return hexCode.join('\n');
}

function lineToBin(line) {
  var parts = line.split(" "),
      commandName = parts[0],
      command = commands[commandName],
      immediate = "".toFixSize(12),
      recorders = parts.slice(1).map(function(recorder) {
        var recorderValue = recorder.replace(/[$]/, ""),
            recorderBin = parseInt(recorderValue).toString(2);
        return recorderBin.toFixSize(5);
      });

  if (command.dontSave){
    recorders.splice(0, 0, "11111");
    command.isFullArgs = true;
  }

  if (command.isFullArgs) {
    immediate = recorders[recorders.length - 1].toFixSize(12);
    recorders[recorders.length - 1] = "";
  }
  else if (command.isImmediate) {
    immediate = recorders[recorders.length - 1].toFixSize(12);
    recorders[recorders.length - 1] = "".toFixSize(5);
  }

  recorders = recorders.join("");

  return [command.opcode, recorders, immediate].join("");
}

function binToHex(bin) {
  return parseInt(bin, 2).toString(16);
}

function codeToBin(code){

  var lines = code.split('\n');

  binCode = lines.map(lineToBin);

  return binCode.join('\n');
}


function compile(){
  var code = document.getElementsByTagName('textarea')[0].value.trim();
  var resultHex = document.getElementById('result-hex');
  //var resultBin = document.getElementById('result-bin');

  resultHex.value = codeToHex(code);
  //resultBin.innerHTML = codeToBin(code);
}

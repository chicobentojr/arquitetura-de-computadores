var Commands = Commands || {};

Commands.all = {
  "and": { opcode: "00000", isImmediate: false, fullArgs: false, dontSave: false },
  "or": { opcode: "00001", isImmediate: false, isFullArgs: false, dontSave: false },
  "nand": { opcode: "00010", isImmediate: false, isFullArgs: false, dontSave: false },
  "xor": { opcode: "00011", isImmediate: false, isFullArgs: false, dontSave: false },
  "add": { opcode: "00100", isImmediate: false, isFullArgs: false, dontSave: false },
  "addn": { opcode: "00101", isImmediate: false, isFullArgs: false, dontSave: false },
  "sub": { opcode: "00110", isImmediate: false, isFullArgs: false, dontSave: false },
  "sftl": { opcode: "00111", isImmediate: false, isFullArgs: false, dontSave: false },
  "sftr": { opcode: "01000", isImmediate: false, isFullArgs: false, dontSave: false },
  "sftrs": { opcode: "01001", isImmediate: false, isFullArgs: false, dontSave: false },
  "rotl": { opcode: "01010", isImmediate: false, isFullArgs: false, dontSave: false },
  "rots": { opcode: "01011", isImmediate: false, isFullArgs: false, dontSave: false },
  "lthen": { opcode: "01100", isImmediate: false, isFullArgs: false, dontSave: true },
  "jump": { opcode: "01101", isImmediate: false, isFullArgs: true, dontSave: true },
  "beq": { opcode: "01110", isImmediate: false, isFullArgs: true, dontSave: true },
  "bnq": { opcode: "01111", isImmediate: false, isFullArgs: true, dontSave: true },
  "andi": { opcode: "10000", isImmediate: true, isFullArgs: false, dontSave: false },
  "ori": { opcode: "10001", isImmediate: true, isFullArgs: false, dontSave: false },
  "nandi": { opcode: "10010", isImmediate: true, isFullArgs: false, dontSave: false },
  "xori": { opcode: "10011", isImmediate: true, isFullArgs: false, dontSave: false },
  "addi": { opcode: "10100", isImmediate: true, isFullArgs: false, dontSave: false },
  "addni": { opcode: "10101", isImmediate: true, isFullArgs: false, dontSave: false },
  "subi": { opcode: "10110", isImmediate: true, isFullArgs: false, dontSave: false },
  "sftli": { opcode: "10111", isImmediate: true, isFullArgs: false, dontSave: false },
  "sftli": { opcode: "11000", isImmediate: true, isFullArgs: false, dontSave: false },
  "sftrsi": { opcode: "11001", isImmediate: true, isFullArgs: false, dontSave: false },
  "rotli": { opcode: "11010", isImmediate: true, isFullArgs: false, dontSave: false },
  "rotsi": { opcode: "11011", isImmediate: true, isFullArgs: false, dontSave: false },
  "ltheni": { opcode: "11100", isImmediate: true, isFullArgs: false, dontSave: true },
  "load": { opcode: "11110", isImmediate: true, isFullArgs: false, dontSave: true },
  "store": { opcode: "11111", isImmediate: true, isFullArgs: false, dontSave: true }
}

Commands.getAll = (function() {
  return Commands.all;
})();

Commands.set = function(key, value) {
  Commands.all[key] = value;
}

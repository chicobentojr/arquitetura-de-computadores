var Commands = Commands || {};

Commands.all = {
  "and": { opcode: "00000", isImmediate: false, fullArgs: false },
  "or": { opcode: "00001", isImmediate: false, isFullArgs: false },
  "nand": { opcode: "00010", isImmediate: false, isFullArgs: false },
  "xor": { opcode: "00011", isImmediate: false, isFullArgs: false },
  "add": { opcode: "00100", isImmediate: false, isFullArgs: false },
  "addn": { opcode: "00101", isImmediate: false, isFullArgs: false },
  "sub": { opcode: "00110", isImmediate: false, isFullArgs: false },
  "sftl": { opcode: "00111", isImmediate: false, isFullArgs: false },
  "sftl": { opcode: "01000", isImmediate: false, isFullArgs: false },
  "sftrs": { opcode: "01001", isImmediate: false, isFullArgs: false },
  "rotl": { opcode: "01010", isImmediate: false, isFullArgs: false },
  "rots": { opcode: "01011", isImmediate: false, isFullArgs: false },
  "lthen": { opcode: "01100", isImmediate: false, isFullArgs: false },
  "jump": { opcode: "01101", isImmediate: false, isFullArgs: true },
  "beq": { opcode: "01110", isImmediate: false, isFullArgs: true },
  "bnq": { opcode: "01111", isImmediate: false, isFullArgs: true },
  "andi": { opcode: "10000", isImmediate: true, isFullArgs: false },
  "ori": { opcode: "10001", isImmediate: true, isFullArgs: false },
  "nandi": { opcode: "10010", isImmediate: true, isFullArgs: false },
  "xori": { opcode: "10011", isImmediate: true, isFullArgs: false },
  "addi": { opcode: "10100", isImmediate: true, isFullArgs: false },
  "addni": { opcode: "10101", isImmediate: true, isFullArgs: false },
  "subi": { opcode: "10110", isImmediate: true, isFullArgs: false },
  "sftli": { opcode: "10111", isImmediate: true, isFullArgs: false },
  "sftli": { opcode: "11000", isImmediate: true, isFullArgs: false },
  "sftrsi": { opcode: "11001", isImmediate: true, isFullArgs: false },
  "rotli": { opcode: "11010", isImmediate: true, isFullArgs: false },
  "rotsi": { opcode: "11011", isImmediate: true, isFullArgs: false },
  "ltheni": { opcode: "11100", isImmediate: true, isFullArgs: false },
  "load": { opcode: "11110", isImmediate: false, isFullArgs: false },
  "store": { opcode: "11111", isImmediate: false, isFullArgs: false }
}

Commands.getAll = (function() {
  return Commands.all;
})();

Commands.set = function(key, value) {
  Commands.all[key] = value;
}

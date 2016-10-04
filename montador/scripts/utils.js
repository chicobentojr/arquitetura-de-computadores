String.prototype.toFixSize = function (size) {
  var str = this;
  if (str.length < size) str = Array(size - str.length + 1).join("0") + str;
  return str.toString();
}

"use strict";

var path = require('path');
var child_process = require("child_process");
var proback = require("proback");

module.exports = function (cb) {
  cb = cb || proback();
  var timer = setTimeout(function () {
    cb(new Error("Timeout error"));
  }, 50000);
  child_process.exec(path.join(__dirname, "ltusb.sh"), function (error, stdout, stderr) {
    clearTimeout(timer);
    if (error || stderr) {
      cb(error || stderr);
    } else {
      cb(null, JSON.parse(stdout + ""));
    }
  });
  return cb.promise;
};

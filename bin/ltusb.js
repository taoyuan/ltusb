#!/usr/bin/env node

"use strict";

var ltusb = require('..');
ltusb(function (err, usbs) {
  if (err) throw err;
  console.log(usbs);
});

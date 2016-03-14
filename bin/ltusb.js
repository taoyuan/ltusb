#!/usr/bin/env node

"use strict";

var ltusb = require('..');
ltusb(function (err, usbs) {
  console.log(usbs);
});

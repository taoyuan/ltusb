'use strict';

var ltusb = require("..");
var assert = require("chai").assert;

describe("ltusb", function () {
  this.timeout(50000);
  it("should return an array", function (done) {
    ltusb()
      .then(function (data) {
        assert.ok(data);
        assert.typeOf(data, 'array');
        done();
      })
      .catch(done);
  });
});

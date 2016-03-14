# ltusb [![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][daviddm-image]][daviddm-url] [![Coverage percentage][coveralls-image]][coveralls-url]
> An advanced ls usb utility

## Installation

```sh
$ npm install --save ltusb
```

## Usage

```js
var ltusb = require('ltusb');

ltusb(function(err, usbs) {
  console.log(usbs);
});

// or 

ltusb().then(function(usbs) {
  console.log(usbs);
});
```
## License

MIT © [taoyuan]()


[npm-image]: https://badge.fury.io/js/ltusb.svg
[npm-url]: https://npmjs.org/package/ltusb
[travis-image]: https://travis-ci.org/taoyuan/ltusb.svg?branch=master
[travis-url]: https://travis-ci.org/taoyuan/ltusb
[daviddm-image]: https://david-dm.org/taoyuan/ltusb.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/taoyuan/ltusb
[coveralls-image]: https://coveralls.io/repos/taoyuan/ltusb/badge.svg
[coveralls-url]: https://coveralls.io/r/taoyuan/ltusb

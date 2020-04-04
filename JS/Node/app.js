// import external modules
const logger = require('./logger');
const Point = require('./point');
const fs = require('fs');


// create a point object
let pt = new Point.Point(2, 3, 4);
console.log(pt.x);
console.log(pt.y);
console.log(pt.z);
//-------------------------


console.log(logger);

//console.log(logger.endPointURL);
console.log(logger("charlie brown"));
//-------------------------


const path = require('path');
var pathObj = path.parse(__filename);
console.log(pathObj);
//-------------------------


const os = require('os');
console.log(`Total Memory: ${os.totalmem()}`);
console.log(`Free Memory: ${os.freemem()}`);
//-------------------------


const files = fs.readdirSync('./');
console.log(files);

fs.readdir('$', function (err, files2) {
    if (err) console.log("Error", err);
    else console.log('Result', files2);
});



console.log("--DONE--");
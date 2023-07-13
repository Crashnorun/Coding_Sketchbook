

// Require the module
const fitDecoder = require('fit-decoder');

// fit2json expects binary represetnation in FIT format as ArrayBuffer
// You can get it by reading a file in Node:

const fs = require('fs').promises;

async function readData() {

    const file = await fs.readFile('2019-03-03_22_47_37-RUNNING.1614374918.fit');
    const buffer = file.buffer;

    // fit2json converts binary FIT into a raw JSON representation. No record names, types or values 
    // are parsed. It is useful for low level data analysis
    const jsonRaw = fitDecoder.fit2json(buffer);

    // parseRecords converts raw JSON format into readable format using current 
    // Global FIT Profile (SDK 21.47.00)
    // It also performs simple conversions for some data formats like time, distance, coordinates.
    const json = fitDecoder.parseRecords(jsonRaw);
    console.log(json);
}

readData();
let i = 0;

"use strict";
// C:\Users\PortelliC\Downloads\230314 charles Suunto app data680331\workouts
exports.__esModule = true;
var fit_decoder_1 = require("fit-decoder");
var fs = require("fs.promises");
var file = fs.readFile("2019-03-03_22_47_37-RUNNING.1614374918.fit");
var buffer = file.buffer;
var jsonRaw = fit_decoder_1["default"].fit2json(buffer);
var json = fit_decoder_1["default"].parseRecords(jsonRaw);
var num = 0;

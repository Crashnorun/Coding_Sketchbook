

// import express library
var express = require("express");

// crete an express application
var app = express();

// create a port to listen to
var server = app.listen(3000);

// make the files in the 'public' folder available
app.use(express.static("public"));

console.log("Socket server is running");
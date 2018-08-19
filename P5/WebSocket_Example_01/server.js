// SEVER SIDE CODE

// import express library
var express = require("express");

// crete an express application
var app = express();

// create a port to listen to
var server = app.listen(3000);

// make the files in the 'public' folder available
app.use(express.static("public"));

console.log("Socket server is running");

// import socket.io library
var socket = require("socket.io");

var io = socket(server);
io.sockets.on("connection", newConnection);

function newConnection(socket) {
    // print out the id of the connection
    console.log("Socket ID: " + socket.id);
}
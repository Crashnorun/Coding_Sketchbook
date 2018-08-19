// SEVER SIDE CODE

var express = require("express");                       // import express library
var app = express();                                    // crete an express application
var server = app.listen(3000);                          // create a port to listen to
app.use(express.static("public"));                      // make the files in the 'public' folder available

console.log("Socket server is running");

var socket = require("socket.io");                      // import socket.io library
var io = socket(server);
io.sockets.on("connection", newConnection);

function newConnection(socket) {
    console.log("Socket ID: " + socket.id);             // print out the id of the connection
    socket.on("mouse", mouseMsg);                       // receive data

    function mouseMsg(data) {
        console.log(data);
        socket.broadcast.emit("mouse", data);           // send data out
    }
}
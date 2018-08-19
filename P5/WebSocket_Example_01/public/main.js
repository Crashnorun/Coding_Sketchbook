///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

var socket;

function setup() {
    createCanvas(600, 400);
    background(0);

    socket = io.connect("http://localhost:3000");
    socket.on("mouse", newDrawing);
}

function draw() { }

function mouseDragged() {
    fill(255);
    ellipse(mouseX, mouseY, 20, 20);

    console.log("Sending: " + mouseX + " , " + mouseY);
    var data = { x: mouseX, y: mouseY }
    socket.emit("mouse", data);
}

function newDrawing(data) {
    fill(0, 12, 230, 200);
    ellipse(data.x, data.y, 20, 20);
}
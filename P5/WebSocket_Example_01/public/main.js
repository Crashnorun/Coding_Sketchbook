///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

var socket;

function setup() {
    createCanvas(600, 400);
    background(0);

    socket = io.connect("http://localhost:3000");

}

function draw() {
    background(51);
    ellipse(mouseX, mouseY, 20, 20);
}
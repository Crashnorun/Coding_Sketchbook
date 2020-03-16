//<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />
///<reference path = "C:\Users\cportelli\Documents\01 DLL's\P5\p5-zip\p5.global-mode.d.ts" />

let radius = 50;
let start = 0; stop = start + 10;

function setup() {
    createCanvas(600, 600);
    background(200);
    strokeWeight(5);
    stroke(0, 0, 255);
    noFill();
    arc(width / 2, height / 2, radius, radius, PI / 2, PI * 2, "OPEN");
    frameRate(60);
}



function draw() {
    background(200);
    arc(width / 2, height / 2, radius + 75, radius + 10, start / PI, stop / PI, "OPEN");

    start+=0.25;
    stop = start + 10;

}

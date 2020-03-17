//<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />
///<reference path = "C:\Users\cportelli\Documents\01 DLL's\P5\p5-zip\p5.global-mode.d.ts" />

let radius = 50;
let start = 0; stop = start + 10;
let maxRadius = 100;
let minRadius = 10;
let radius1, radius2;
let factor1, factor2;

function setup() {
    createCanvas(600, 600);
    background(0);
    strokeWeight(5);
    stroke(0, 0, 255);
    noFill();
    arc(width / 2, height / 2, radius, radius, PI / 2, PI * 2, "OPEN");
    frameRate(60);

    radius1 = minRadius;
    radius2 = maxRadius;
    factor1 = 1;
    factor2 = -1;
}



function draw() {
    background(0);
    //arc(width / 2, height / 2, radius + 75, radius + 10, start / PI, stop / PI, "OPEN");
    arc(width / 2, height / 2, radius1, radius2, start / PI, stop / PI, "OPEN");

    start += 0.25;
    stop = start + 10;

    if (radius1 >= maxRadius || radius1 <= minRadius) factor1 = -1 * factor1;
    if (radius2 >= maxRadius || radius2 <= minRadius) factor2 = -1 * factor2;
    radius1 += factor1;
    radius2 += factor2;

}

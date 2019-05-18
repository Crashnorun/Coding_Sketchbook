///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let stripeWidth = 20;
let startCol = color(0, 0, 0);
let endCol = color(0, 0, 255);

function setup() {
    let canvas = createCanvas(400, 400);
    background(0);

    let numCols = height / 20;
    let colorVal = 255 / numCols;
    let count = 0;


    for (let i = 0; i < height; i += 20) {
        fill(color(colorVal * count, colorVal * count, 255));
        
        let rectHeight = random(5, 10);
        rect(0, rectHeight, 20, 20);
        count++;
        console.log(colorVal * count);
    }

}

function draw() {

}
///<reference path = "C:\Users\cportelli\Documents\01 DLL's\P5\p5-zip\p5.global-mode.d.ts" />

/**
 * Reference: https://www.algosome.com/articles/render-lorenz-attractor.html
 */

let pts = [];
let beta = 8 / 3;
let rho = 28;
let sigma = 10;
let x, y, z;
let t = 0.02445;

function setup() {
    createCanvas(600, 600, WEBGL);
    background(0);
    stroke('purple');
    strokeWeight(1);
    x = 1;
    y = 0;
    z = 0;
}



function draw() {

    beginShape(POINTS);
    
    let xt = x + t * sigma * (y - x);
    let yt = y + t * (x * (rho - z) - y);
    let zt = z + t * (x * y - beta * z);

    vertex(x,y,z);
    
    //point(xt, yt, zt);
    x = xt;
    y = yt;
    z = zt;

    endShape();
    console.log(x);
}

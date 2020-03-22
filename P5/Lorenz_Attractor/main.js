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
let cam;

function setup() {
    createCanvas(600, 600, WEBGL);
    background(0);
    stroke('purple');
    strokeWeight(1);
    fill('red');

    x = 1;
    y = 0;
    z = 0;

    //camera(07, -109, 111, 1.5, -60, 73);
    //camera(8, -60, 25, 8, 5, 25);
   // camera(0, 0, 600, 0, 0, 0, 0, 0, 1);
   cam = camera();
   console.log(cam);
    console.log("exit setup");
}



function draw() {
    /*orbitControl();
    beginShape(POINTS);

    let xt = x + t * sigma * (y - x);
    let yt = y + t * (x * (rho - z) - y);
    let zt = z + t * (x * y - beta * z);

    vertex(x, y, z);

    //point(xt, yt, zt);
    x = xt;
    y = yt;
    z = zt;

    endShape();*/

    // background(200);

    rotateX(frameCount * 0.01);
    rotateY(frameCount * 0.01);
    box(150);

}

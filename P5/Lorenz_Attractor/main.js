///<reference path = "C:\Users\cportelli\Documents\01 DLL's\P5\p5-zip\p5.global-mode.d.ts" />

/**
 * Reference: https://www.algosome.com/articles/render-lorenz-attractor.html
 * Default values:
 *  beta = 8 / 3;
 *  rho = 28;
 *  sigma = 10;
 *  t = 0.02445;
 */

let pts = [];
let pt;
let beta = 8 / 3;
let rho = 28;
let sigma = 10;
let x, y, z;
let t = 0.02445;
let cam;
let slideX, slideY, slideZ;

function setup() {
    createCanvas(600, 600, WEBGL);
    background(255);

    //stroke('blue');
    //strokeWeight(1);
    //fill('red');

    // starting conditions
    x = 0.1;
    y = 0;
    z = 0;

    /*slideX = createSlider(-600, 600, -101, 1);
    slideY = createSlider(-600, 600, 44, 1);
    slideZ = createSlider(-600, 600, -14, 1);*/

    // Camera positioning 
    slideX = createSlider(-600, 600, 0, 1);
    slideY = createSlider(-600, 600, 130, 1);
    slideZ = createSlider(-600, 600, 50, 1);

    // cam = camera(slideX.value(), slideY.value(), slideZ.value(), 0, 0, 0, 0, 1, 0);
    cam = camera(0, 0, slideZ.value(), 0, 0, 0, 0, 0, 1);
    // console.log(cam);
    console.log("exit setup");
}



function draw() {
    background(255);
    // orbitControl();

    //camera(slideX.value(), slideY.value(), slideZ.value(), 0, 0, 0, 0, 1, 0);
    /* camera(slideX.value(), slideY.value(), slideZ.value(),
         slideX.value(), 0, slideZ.value() - 600, 0, 1, 0);*/

    camera(-171, -51, slideZ.value(), -1, -2, 58, 0, 0, 1);

    let xt = x + t * sigma * (y - x);
    let yt = y + t * (x * (rho - z) - y);
    let zt = z + t * (x * y - beta * z);

    //point(xt, yt, zt);
    x = xt;
    y = yt;
    z = zt;
    pt = new Pt(x, y, z);

    let r = map(x, 0, 10, 0, 220, true);
    let g = map(y, 0, 10, 0, 220, true);
    let b = map(z, 0, 10, 100, 220, true);
    let col = color(r, g, b);
    pt.col = color(r, g, b);


    pts.push(pt);

    //beginShape();
    for (let i = 0; i < pts.length; i++) {
        fill(pts[i].col);
        stroke(pts[i].col);
        push();
        translate(pts[i].x, pts[i].y, pts[i].z);
        sphere(0.1);
        pop();
        //vertex(pts[i].x, pts[i].y, pts[i].z);
    }
    // endShape();
}

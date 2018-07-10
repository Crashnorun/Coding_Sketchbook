///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

//#region ----GLOBAL VARIABLES----
let canvas;
let pts = [];
let srfs = [];
//#endregion ----GLOBAL VARIABLES----

function setup() {
    // negative Z moves items away from the user
    // positive Z moves items toward the user
    canvas = createCanvas(300, 300, WEBGL);
    console.log(canvas);

    angleMode(DEGREES);                 // set angle mode
    colorMode(RGB, 255);                // set color mode
    background(0);
    stroke(0);                          // this line is needed to display the surface - seems to be a bug
    strokeWeight(0);                    // this line is needed to hide the surface edge

    let col = color(255, 255, 255);
    let pos = createVector(-width / 2, -height / 2, -width);
    directionalLight(col, pos);
    ambientMaterial(255);
    //sphere(40);

    pts = createPoints(50);               // create a grid of points
    console.log(pts);

    srfs = createSrfs(pts);             // create a grid of surfaces
    console.log(srfs);

    // let shape = beginShape();
    // vertex(-50, -50, -100); // top left
    // vertex(50, -50, -10); // top right
    // vertex(50, 50, 50); // bottom right
    // vertex(-50, 50, -10); // bottom left
    // endShape(CLOSE);
    // console.log(shape);
}

function draw() {
    background(0);
    let rad = 300;
    let x = map(mouseX, 0, width, sin(-90) * rad, sin(90) * rad);
    let y = map(mouseX, 0, height, cos(-90) * rad, cos(90) * rad);
   
    let cam = camera(x, 0, -500, 0, 0, 0, 0, 1, 0);
   // console.log("MouseX: " + mouseX + " | MouseY: " + mouseY + " X: " + x + " | Y: " + y);
    srfs = createSrfs(pts);             // create a grid of surfaces
}

/** Creates a grid of points */
function createPoints(num) {
    let pts = [];
    let spacing = width / num;
    for (let i = 0; i <= height; i += spacing) {
        let tempPts = [];
        for (let j = 0; j <= width; j += spacing) {
            let vect = new createVector(j, i, 30 * sin(i + j));
            tempPts.push(vect);
        }
        pts.push(tempPts);
    }
    return pts;
}

/** Create a grid of surfaces */
function createSrfs(pts) {
    push();
    translate(-width / 2, -height / 2);
    let srfs = [];
    for (let i = 0; i < pts.length - 1; i++) {
        let tempSrfs = [];
        for (let j = 0; j < pts[i].length - 1; j++) {
            let shape = beginShape();
            vertex(pts[i][j].x, pts[i][j].y, pts[i][j].z);                              // top left
            vertex(pts[i + 1][j].x, pts[i + 1][j].y, pts[i + 1][j].z);                  // top right
            vertex(pts[i + 1][j + 1].x, pts[i + 1][j + 1].y, pts[i + 1][j + 1].z);      // bottom right
            vertex(pts[i][j + 1].x, pts[i][j + 1].y, pts[i][j + 1].z);                  // bottom left
            endShape(CLOSE);
            tempSrfs.push(shape);
        }
        srfs.push(tempSrfs);
    }
    pop();
    return srfs;
}
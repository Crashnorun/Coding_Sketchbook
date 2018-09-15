///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let cubes = [];
let boxSize = 50;
let count = 0;
let frame = 0;
let c;

function setup() {
   c = createCanvas(600, 600, WEBGL);
    //frameRate(10);
    colorMode(HSB, 360, 100, 100, 100);
    angleMode(DEGREES);
    background(0);
    strokeWeight(1);
    let count = (height / boxSize) * (width / boxSize);         // number of boxes in the scene
    console.log("Number of boxes in scene: " + count);
    count = 360 / count;                                        // rate of change for color
    console.log("Color rate of change: " + count);
    let val = 0;

    for (let i = -height / 2; i < height / 2; i += boxSize) {
        for (let j = -width / 2; j < width / 2; j += boxSize) {
            let tempCol = color(count * val, 100, 100, 50);
            let cube = { x: j + boxSize / 2, y: i + boxSize / 2, col: tempCol };
            cubes.push(cube);
            val++;
        }
    }
    console.log(cubes);
}

function draw() {
    background(0);
    //fill(0, 0, 0, 0);
    //rect(-width/2, -height/2, width, height);
    // noStroke();

    for (let i = 0; i < cubes.length; i++) {

        push();
        translate(cubes[i].x, cubes[i].y);
        rotateX(count);
        rotateY(count);
        rotateZ(count);
        fill(cubes[i].col);

        box(boxSize, boxSize, boxSize);
        translate(-cubes[i].x, -cubes[i].y);
        pop();
        count++;
    }


}

function mousePressed() {
    if (frame < 10) {
        saveCanvas(c, "Image_0" + frame + ".jpg");
    } else {
        saveCanvas(c, "Image_" + frame + ".jpg");
    }
    frame++;
}
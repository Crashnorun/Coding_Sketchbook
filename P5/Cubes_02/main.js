///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let cubes = [];
let boxSize = 50;
let count = 0;

function setup() {
    createCanvas(600, 600, WEBGL);
    colorMode(HSB, 360, 100, 100, 100);
    angleMode(DEGREES);
    background(0);
    strokeWeight(0.1);
    let count = height / boxSize + width / boxSize;
    count = 360 / count;

    for (let i = -height / 2; i < height / 2; i += boxSize) {
        for (let j = -width / 2; j < width / 2; j += boxSize) {
            let tempCol = color(360 /count, 100, 100, 50);
            let cube = { x: j, y: i, col: count * (i * j) };
            cubes.push(cube);
        }
    }
}

function draw() {
    fill(0, 0, 0, 0);
    //rect(-width/2, -height/2, width, height);
    push();
    for (let i = 0; i < cubes.length; i++) {
        rotateX(count);
        rotateY(count);
        rotateZ(count);
        //fill((360 / cubes.length) * i, 100, 100, 50);
        fill(cubes[i].col, 100, 100, 50);
        translate(cubes[i].x, cubes[i].y);
        box(boxSize);
        count++;
    }
    pop();

}
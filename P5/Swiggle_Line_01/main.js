///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

// start from the middle of the sreen
// create a random vector
// set vector length
// at endpoint of vector, create another random vector
// set vector length

let pts = [];

function setup() {
    createCanvas(600, 600);
    background(0);
    let pt = new Point(createVector(random(1, 5), random(1, 5)), 4);
    pt.color = [random(0, 255), random(0, 255), random(200, 255)];

    stroke(pt.color);
    translate(width / 2, height / 2);
    strokeWeight(pt.weight);
    line(0, 0, pt.vect.x, pt.vect.y);
}

function draw() {

}

function Point(vect, weight) {
    this.vect = vect;
    this.weight = weight;
}
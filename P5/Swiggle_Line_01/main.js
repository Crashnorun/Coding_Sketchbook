///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />


// start from the middle of the sreen
// create a random vector
// set vector length
// at endpoint of vector, create another random vector
// set vector length



function setup() {
    createCanvas(600, 600);
    background(0);
    let vect = createVector(random(1, 5), random(1, 5));
    stroke(250);
    strokeWeight(3);
    line(width/2, height/2, vect.x, vect.y);
}

function draw() {

}
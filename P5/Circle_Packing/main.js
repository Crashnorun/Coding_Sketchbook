/* Reference: https://stackoverflow.com/questions/54581512/make-vscode-understand-p5js

*/

/// <reference path="C:\Users\cportelli\Documents\01 DLL's\P5\P5JS Project Template for VSCode\TSDef\p5.global-mode.d.ts"/>

let circs = [];
let totalMove = [];
const numpts = 200;
const maxRad = 25;
let col;

function setup() {

    createCanvas(600, 600);
    background(0);
    col = color(0, 10);
    frameRate(20);

    for (let i = 0; i < numpts; i++) {
        let radius = random(5, maxRad);                 // get a random radius number
        let x = random(2 * width / 6, 4 * width / 6);         // get random location
        let y = random(2 * height / 6, 4 * height / 6);
        let cent = createVector(x, y);                  // create center pt
        let circ = new Circ(cent, radius, 0);           // create circle
        circs.push(circ);                               // add circle to list                                       
        circ.Render();

        totalMove.push(createVector(0, 0));             // add a blank vector to the move list
    }
}


function draw() {

    //background(0);
    fill(col);
    rect(0, 0, width, height);                          // add background


    for (let i = 0; i < circs.length; i++) {
        circs[i].numCollisions = 0;
    }


    for (let i = 0; i < circs.length; i++) {
        for (let j = i + 1; j < circs.length; j++) {

            // find distance from current circle to all the other circles
            let d = dist(circs[i].cent.x, circs[i].cent.y, circs[j].cent.x, circs[j].cent.y);

            // don't do anythign if the circles don't touch
            if (d > (circs[i].radius + circs[j].radius)) continue;

            // if the circles touch, create a vector between them
            let vect = p5.Vector.sub(circs[i].cent, circs[j].cent);
            vect.normalize();                                                   // normalize vector
            vect = vect.mult(0.5 * ((circs[i].radius + circs[j].radius) - d));  // find the space required to move

            // option 01
            // totalMove[i] = p5.Vector.sub(totalMove[i], vect);
            // totalMove[j] = p5.Vector.add(totalMove[j], vect);

            // option 02
            totalMove[i] = p5.Vector.add(totalMove[i], vect);                  // move +pt
            totalMove[j] = p5.Vector.sub(totalMove[j], vect);                  // move -pt

            // option 03
            // totalMove[i] = p5.Vector.add(totalMove[i], vect);
            // totalMove[j] = p5.Vector.add(totalMove[j], vect);

            // option 04
            //  totalMove[i] = p5.Vector.sub(totalMove[i], vect);
            //  totalMove[j] = p5.Vector.sub(totalMove[j], vect);

            // option 05
            // totalMove[i] = p5.Vector.sub(totalMove[i], vect);
            // totalMove[j] = p5.Vector.sub(totalMove[j], vect);

            // option 06

            circs[i].numCollisions++;
            circs[j].numCollisions++;
        }
    }


    for (let i = 0; i < circs.length; i++) {

        if (circs[i].numCollisions > 0) {
            let averageVect = p5.Vector.div(totalMove[i], circs[i].numCollisions);
            circs[i].cent = p5.Vector.add(circs[i].cent, averageVect);

            // if (circs[i].cent.x >= width || circs[i].cent.x <= 0) circs[i].cent.x *= -1;
            // if (circs[i].cent.y >= height || circs[i].cent.y <= 0) circs[i].cent.y *= -1;

            circs[i].Render();
            totalMove[i] = createVector(0, 0);
        }
    }


}
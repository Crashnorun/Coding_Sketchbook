/* Reference: https://stackoverflow.com/questions/54581512/make-vscode-understand-p5js

*/

/// <reference path="C:\Users\cportelli\Documents\01 DLL's\P5\P5JS Project Template for VSCode\TSDef\p5.global-mode.d.ts"/>

let circs = [];
let totalMove = [];
const numpts = 500;
const maxRad = 50;

function setup() {

    createCanvas(600, 600);
    background(0);

    for (let i = 0; i < numpts; i++) {
        let radius = random(0, maxRad);
        let x = random(maxRad, width - maxRad);
        let y = random(maxRad, height - maxRad);
        let cent = createVector(x, y);
        let circ = new Circ(cent, radius, 0);
        circs.push(circ);

        totalMove.push(createVector(0, 0));
    }
}




function draw() {

background(0);
    let totalCollisions = [];

    for (let i = 0; i < circs.length; i++) {
        for (let j = i + 1; j < circs.length; j++) {

            let d = dist(circs[i].cent.x, circs[i].cent.y, circs[j].cent.x, circs[j].cent.y);

            if (d > (circs[i].radius + circs[j].radius)) continue;

            let vect = p5.Vector.sub(circs[i].cent, circs[j].cent);
            vect.normalize();
            vect = vect.mult(0.5 * (circs[i].radius + circs[j].radius) - d);

            totalMove[i] = p5.Vector.add(totalMove[i], vect);
            totalMove[j] = p5.Vector.add(totalMove[j], vect);

            circs[i].numCollisions++;
            circs[j].numCollisions++;
        }
    }


    for (let i = 0; i < circs.length; i++) {

        if (circs[i].numCollisions > 0) {
            let averageVect = p5.Vector.div(totalMove[i], circs[i].numCollisions);
            circs[i].cent = p5.Vector.add(circs[i].cent, averageVect);
            circs[i].Render();
        }
    }
}
///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

// create a grid of points, each row offest from the next
//import Hexigon from './cls_Hexigon';

let gridSpacing = 25;           // radius value
let pts = [];

function setup() {
    createCanvas(400, 400);
    background(255, 0, 0);

    let pt;
    let colorRange = 20;
    let col = [random(256), random(256), random(256)];
    let count = 0;
    let tempX = CalcWidth();
    for (let i = 0; i < height + 100; i += (gridSpacing * 0.88)) {
        for (let j = 0; j < (width + 100); j += (3 * gridSpacing)) {
            if (count % 2 == 0) {
                pt = new Hexigon(j, i, gridSpacing);
            } else {
                pt = new Hexigon(j + (gridSpacing * 1.5), i, gridSpacing);
            }
            if (count != 0) {
                let r = col[0] + random(-colorRange, colorRange);
                let g = col[1] + random(-colorRange, colorRange);
                let b = col[2] + random(-colorRange, colorRange);
                col = [r,g,b];
            }
            pt.color = col;
            pts.push(pt);
        }
        count++;
    }
    console.log(pts);
}

function draw() {
    for (let i = 0; i < pts.length; i++) {
        let col =
            pts[i].Render();
    }
}

function CalcWidth() {
    let a = gridSpacing * gridSpacing;
    let c = sqrt(a / 2);
    console.log(c);
    return c;
}

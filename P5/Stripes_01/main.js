///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let stripeWidth = 20;
//let startCol = color(0, 0, 0);
//let endCol = color(0, 0, 255);
let count = 0;
let totHeight = 0;

function setup() {
    let canvas = createCanvas(400, 400);
    background(0);
    noStroke();

    for (let i = 0; i < width; i += stripeWidth) {
        let totHeight = 0;
        do {
            let col = map(totHeight, 0, height, 255, 0)
            fill(color(col, col, 255));

            let rectHeight = Math.ceil(random(20, 50));
            rect(i, totHeight, 20, rectHeight);
            totHeight += rectHeight;
            if (totHeight > height) totHeight = height;

            //console.log("Rect height: " + rectHeight + " Tot Height: " + totHeight);
        } while (totHeight < height);
    }
}

function draw() {
    let col = map(totHeight, 0, height, 255, 0)
    fill(color(col, col, 255));

    let rectHeight = Math.ceil(random(20, 50));
    rect(count, totHeight, 20, rectHeight);
    totHeight += rectHeight;
    //console.log("Rect height: " + rectHeight + " Tot Height: " + totHeight);

    if (count >= width)
        count = 0;

    if (totHeight >= height) {
        totHeight = 0;
        count += stripeWidth;
    }
}
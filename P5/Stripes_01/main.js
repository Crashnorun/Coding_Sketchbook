///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let stripeWidth = 20;
let startCol = color(0, 0, 0);
let endCol = color(0, 0, 255);

function setup() {
    let canvas = createCanvas(400, 400);
    background(0);

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

}
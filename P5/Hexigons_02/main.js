///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let hexigons = [];
let rad = 50;

function setup() {
    createCanvas(600, 600);
    background(230);
    let count = 0;

    for (let j = 0; j <= height; j += rad) {
        let tempHex = [];
        for (let i = 0; i <= width; i += rad * 2) {
            let hex;
            if (count % 2 == 0) {
                hex = new Hexigon(i, j, rad);
            } else {
                hex = new Hexigon(i + rad / 2, j, rad);
            }
            hexigons.push(hex);
            hex.render();
        }
        count++;
        hexigons.push(tempHex);
    }
}

function draw() {

}
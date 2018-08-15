///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let num = 0;
function setup() {
    let canvas = createCanvas(600, 600);
    let circle = { center: [], color: [] };
    let circles = [];
    let step = 10;
    let rad = width / 2;
    let x = width / 4;
    let y = 0;
    noStroke();
    angleMode(DEGREES);
    ellipseMode(CENTER);
    colorMode(HSB, 360, 100, 100, 100);
    num = 100;

    for (let i = 0; i <= 360; i += step) {
        fill(i, 100, 100, num);
        push()
        translate(x + width / 2, y + height / 2);
//console.log(x + " " + y);
        ellipse(0, 0, rad, rad);
        pop();
        x = cos(i) * width / 4;
        y = sin(i) * width / 4;
    }
}

function mouseReleased() {
    save("Image_" + num + ".jpg");
}

function draw() {

}
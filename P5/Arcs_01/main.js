///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

function setup() {

    createCanvas(600, 600);
    background(255);
    stroke(0);
    strokeWeight(1);
    noFill();
//ellipse(width / 2, height / 2, 600, 600);

    let startAng = PI;
    let endAng = PI * 2;
    let startRad = 20;

    // for (let i = -10 + startRad; i < 300; i += 10) {
    //     let b = map(i, -10, width / 2, 50, 200);
    //     stroke(b, b, 255);
    //     arc(i, height / 2, startRad, startRad, startAng, endAng);

    //     b = map(i, width / 2, -10, 50, 200);
    //     stroke(b, b, 255);
    //     arc(width / 2 - i, height / 2, startRad - 600, startRad - 600, endAng, startAng);
    //     startRad += 20;
    // }

    for (let i = -10 + startRad; i <= width / 2; i += 10) {
        let b = map(i, -10, width / 2, 50, 200);
        stroke(b, b, 255);
        arc(i, height / 2, startRad, startRad, startAng, endAng);

        b = map(i, width / 2, -10, 50, 200);
        stroke(b, b, 255);
        arc(width - i, height / 2, startRad, startRad, endAng, startAng);
        startRad += 20;
    }
}

function draw() {

}
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
    let startRad = 10;
    let deltaRad = 2;
    let rad = startRad;

    // for (let i = -deltaRad + startRad; i < 300; i += deltaRad) {
    //     let b = map(i, -deltaRad, width / 2, 50, 200);
    //     stroke(b, b, 255);
    //     translate(width / 2, height / 2);
    //     rotate(map(i, -deltaRad, width / 2, 0, PI));
    //     translate(-width / 2, -height / 2);
    //     ellipse(i, height / 2, rad, rad);
    //     rad += deltaRad * 2;
    // }

    for (let i = -deltaRad + startRad; i <= (width / 2) - (startRad / 2); i += deltaRad) {
        //for (let i = -deltaRad + startRad; i <= width ; i += deltaRad) {
        let b = map(i, -deltaRad, width / 2, 50, 200);
        stroke(b, b, 255);
        // translate(width / 2, height / 2);
        // rotate(map(i, -deltaRad, width / 2, 0, PI));
        // translate(-width / 2, -height / 2);
        arc(i, height / 2, rad, rad, startAng, endAng);

        b = map(i, width / 2, -deltaRad, 50, 200);
        stroke(b, b, 255);
        arc(width - i, height / 2, rad, rad, endAng, startAng);
        rad += deltaRad * 2;
    }
}

function draw() {

}
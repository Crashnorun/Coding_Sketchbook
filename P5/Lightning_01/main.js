// ///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />
///<reference path = "C:\Users\cportelli\Documents\Personal\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />


let col, c1, c2, colorSlider;
let lineCol = { min: c1, max: c2 };
let jitter = { min: -20, max: 20 };
let lineLength = { min: 10, max: 20 };
let startPts = [];
let endPts = [];
let maxPts = 40;
let x, y, count, factor;

function setup() {
    createCanvas(800, 800);
    frameRate(20);
    background(0);
    strokeWeight(1);
    count = 256;
    factor = -0.5;
    colorSlider = createSlider(0, 255, 0);
    opacity = createElement('h2', 'Opacity: ' + colorSlider.value());
    opacity.position(10, height + colorSlider.height);
    colorSlider.position(10, opacity.y + opacity.height + 30);
    addEventListener(colorSlider, onchange());

    col = color(0, 0, 0, 1);
    c1 = color(0, 0, 255);
    c2 = color(255, 255, 255);

    for (let i = 0; i < maxPts; i++) {
        startPts.push({ x: random(0, width), y: 0 });
    }
}

function onchange() {
    console.log(colorSlider.value());
}

function draw() {

    //col = color(0, 0, 0, colorSlider.value());
    col = color(0, 0, 0, count);
    count += factor;
    if (count < -20) { factor = 0.5; }
    if (count > 256) { factor = -0.5; }
    console.log(count);

    fill(col);
    rect(0, 0, width, height);
    // find entpts
    for (let i = 0; i < maxPts; i++) {

        // if end pt is close to extremes
        if (startPts[i].x <= 0)
            x = random(0, jitter.max);
        else if (startPts[i].x >= width)
            x = random(jitter.min, 0);
        else
            x = random(jitter.min, jitter.max);

        y = random(lineLength.min, lineLength.max) + startPts[i].y;
        x += startPts[i].x;

        endPts[i] = { x, y };

        let strokeColor = map(startPts[i].y, 0, height, 0, 255);
        stroke(strokeColor, strokeColor, 255);

        // draw line
        bezier(startPts[i].x, startPts[i].y, startPts[i].x, startPts[i].y + 20, endPts[i].x, endPts[i].y - 20, endPts[i].x, endPts[i].y);
        //line(startPts[i].x, startPts[i].y, endPts[i].x, endPts[i].y);
        // make stpt = endpt
        startPts[i] = endPts[i];

        if (startPts[i].y >= height) {
            startPts[i].y = 0;
        }
    }
}
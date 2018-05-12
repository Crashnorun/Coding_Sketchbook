///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />


let numCells = 20;
let slider;

function setup() {
    createCanvas(400, 400);
    background(0);

    slider = createSlider(0, 10, 5);
slider.position(10, height+ 20)
    let cellWidth = width / numCells;
    let cellHeight = height / numCells;

    stroke(255);
    strokeWeight(1);
    calcLines();

    // for (let i = 0; i < numCells; i++) {
    //     for (let j = 0; j < numCells; j++) {
    //         push()
    //         translate(cellWidth * i, cellHeight * j);
    //         if (random() < 0.2) {
    //             line(0, 0, cellWidth, cellHeight);
    //         } else {
    //             line(cellWidth, 0, 0, cellHeight);
    //         }
    //         pop();
    //     }
    // }

}

function draw() {
    slider.changed(calcLines);
}


function calcLines() {
    background(0);

    let cellWidth = width / numCells;
    let cellHeight = height / numCells;

    for (let i = 0; i < numCells; i++) {
        for (let j = 0; j < numCells; j++) {
            push()
            translate(cellWidth * i, cellHeight * j);
            if (random() < slider.value()/10) {
                line(0, 0, cellWidth, cellHeight);
            } else {
                line(cellWidth, 0, 0, cellHeight);
            }
            pop();
        }
    }
}


///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let w = 600;                                            // canvas dimensions
let h = 400;
let cellSize = 40;                                      // cell size
let cells = [];

function setup() {
    createCanvas(w, h);
    frameRate(2);

    // create grid of cells
    for (let x = 0; x < width; x += cellSize) {
        var xArr = new Array();
        for (let y = 0; y < height; y += cellSize) {
            let tempCell = new cell(x, y, cellSize);    // create a cell
            tempCell.rotation = random();               // create a random rotation
            xArr.push(tempCell);
        }
        cells.push(xArr);
    }

    for (let x = 0; x < cells.length; x++) {
        for (let y = 0; y < cells[x].length; y++) {
            cells[x][y].render();
        }
    }
}

function draw() {
    background(255);
    for (let x = 0; x < cells.length; x++) {
        for (let y = 0; y < cells[x].length; y++) {
            cells[x][y].rotation = random();
            cells[x][y].render();
        }
    }
}
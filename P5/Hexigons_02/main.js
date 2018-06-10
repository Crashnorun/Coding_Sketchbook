///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let hexigons = [];
let rad = 40;
let centerLine;
let tempCol = [];

function setup() {
    createCanvas(600, 600);
    background(230);
    centerLine = calcTriangleLength();
    let count = 0;

    for (let j = 0; j <= height + centerLine; j += centerLine) {
        let tempHex = [];
        for (let i = 0; i <= width + centerLine; i += rad * 3) {
            let hex;
            if (count % 2 == 0) {
                hex = new Hexigon(i, j, rad);
            } else {
                hex = new Hexigon(i + (rad * 1.5), j, rad);
            }
            tempHex.push(hex);
            // hex.render();
        }
        hexigons.push(tempHex);
        count++;
    }
    // console.log(hexigons.length);
    // console.log(hexigons[0].length);
    // console.log(hexigons);
}

function draw() {

    for (let i = 0; i < hexigons.length; i++) {
        for (let j = 0; j < hexigons[i].length; j++) {

            if (abs(mouseX - hexigons[i][j].locX) < centerLine &&
                abs(mouseY - hexigons[i][j].locY) < centerLine) {
                    hexigons[i][j].fillCol = [255,0,0];
            } else{
                hexigons[i][j].fillCol = [0,0,255];
            }
            hexigons[i][j].render();
        }
    }
}

/** Each hexigon contains 6 equilateral triangles
 * The length of each of the triangle sides = radius
 * Must calculate the length of the center line of the triangle
 */
function calcTriangleLength() {
    let degrees = (PI / 180) * 30;
    let adjacent = cos(degrees) * rad;
    console.log(adjacent);
    return adjacent;
    //cos(30) = adjacent / rad;
    //30, 60, 90
    //soh
    //cah
    //toa
}
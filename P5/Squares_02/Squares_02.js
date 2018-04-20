///<reference path = "C:\Users\charl\Documents\Personal\p5\p5\TypeScript Files\p5.d\p5.global-mode.d.ts" />

// pick random location which drives the color

var minW = 20;
var maxW = 40;

function setup() {
    colorMode(HSB, 255);
    createCanvas(800, 800);
    background(10);
    //noStroke();
    strokeWeight(2);
    stroke(0, 200);
}


function draw() {
    var w = random(minW, maxW);
    var h = w;
    var x = random(0, width - w);
    var y = random(0, height - h);
    //var r = GetColor(x, y);
    //var g = 0; //GetColor(x, y);
    //var b = 0; //GetColor(x, y);
    //fill(r, g, b);

    //var hue = GetColor(y, height);
    //var sat = GetColor(x, width)
    //var brite =255;// GetColor(w, maxW);

    var hue = MapColor(x, 0, height);
    var sat = MapColor(y, 0, width);
    var brite = 255;
    fill(hue, sat, brite);
    //stroke(hue, sat, 100 , 100);
    rect(x, y, w, h);
}

function GetColor(x, maxVal) {
    if (x < maxVal * 0.3) {
        return random(0, 256 * 0.5)
    } else if (x < maxVal * 0.6) {
        return random(256 * 0.25, 256 * 0.75)
    } else {
        return random(256 * 0.5, 256)
    }
}

function MapColor(x, minVal, maxVal){
    return map(x, minVal, maxVal, 0, 255); 
}

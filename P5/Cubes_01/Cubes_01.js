///<reference path = "C:\Users\charl\Documents\Personal\p5\p5\TypeScript Files\p5.d\p5.global-mode.d.ts" />
var bottomBoxes = [];
var topBoxes = [];
var leftBoxes = [];
var rightBoxes = [];
var znum = 20;
var xnum = 10;
var ynum = 10;
var count = 0;

function setup() {
    createCanvas(600, 600, WEBGL);
    ambientLight(200);
    pointLight(255, 255, 255, 0, 0, 0);

    var size = [40, 40, 40];
    var spacing = (width / xnum) - size[0];             // spacing between cubes

    for (var i = 0; i < znum; i++) {                    // depth - z
        for (var j = 0; j < xnum; j++) {                // width - x
            var red = floor((255 / xnum) * j);
            var green = 0;
            var blue = floor(255 / znum) * i;
            var material = [red, green, blue];

            var x = -(width / 2) + size[0] / 2 + spacing / 2 + ((width / xnum) * j);
            var y = (height / 2);
            var z = -((width / xnum) * i);
            var location = [x, y, z];
            var mybox = new cls_Box(location, size, material);
            bottomBoxes.push(mybox);

            y = -y;
            location = [x, y, z];
            green = 255;
            material = [red, green, blue];
            myBox = new cls_Box(location, size, material);
            topBoxes.push(myBox);

            x = -width / 2 + size[0] / 2 + spacing / 2;
            y = -(height / 2) + ((height / ynum) * j);
            location = [x, y, z];
            green = 255 - floor((255 / ynum) * j);
            red = 0;
            material = [red, green, blue];
            mybox = new cls_Box(location, size, material);
            leftBoxes.push(mybox);

            x = -x;
            location = [x, y, z];
            red = 255;
            material = [red, green, blue];
            myBox = new cls_Box(location, size, material);
            rightBoxes.push(myBox);
        }
    }
    console.log("Bottom.length: " + bottomBoxes.length + " | Top.length: " + topBoxes.length);

}

function draw() {
    background(50);
    for (var i = 0; i < bottomBoxes.length; i++) {
        bottomBoxes[i].render(count);
        topBoxes[i].render(count + 0.01);
        leftBoxes[i].render(count + 0.02);
        rightBoxes[i].render(count + 0.03);
    }
    count += 0.01;
}

var cls_Box = class cls_Box {

    constructor(location, size, material) {
        this.location = location;
        this.size = size;
        this.material = material;
        //console.log(this.location + " | " + this.size + " | " + this.material);
    }

    render(count) {
        specularMaterial(this.material[0], this.material[1], this.material[2]);
        // ambientMaterial(this.material[0], this.material[1], this.material[2]);
        push();
        translate(this.location[0], this.location[1], this.location[2]);
        rotateX(count);
        rotateY(count);
        box(this.size[0], this.size[1], this.size[2]);
        pop();
    }
};
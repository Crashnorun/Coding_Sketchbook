

///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />


let a, b;

function setup() {
    a = new Matrix(2, 3);
    b = new Matrix(3, 2);

    a.randomize();
    b.randomize();

    console.table(a.matrix);
    console.table(b.matrix);

    let c = a.multiply(b);
    console.table(c.matrix);
}

function draw() {

}


///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />


let a, b;

function setup() {
    // testMatrixClass();
    // testNN();

    let nn = new NeuralNewtork(2, 2, 2);
    let inputs = [1, 0];
    let tartets = [1,0];

    nn.train(inputs, tartets);

}

function draw() {

}

function testMatrixClass() {

    a = new Matrix(2, 3);
    b = new Matrix(3, 2);

    a.randomize();
    b.randomize();

    a.print();
    b.print();

    let c = Matrix.multiply(a, b);
    c.print();

    let d = c.transpose();
    d.print();


}


function testNN() {

    let nn = new NeuralNewtork(2, 2, 1);
    let input = [1, 0];
    let output = nn.feedforward(input);
    console.log(output);

}
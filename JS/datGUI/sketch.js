
// create a circle object
let circ = { x: 10, y: 10, diameter: 50, col: "rgb(255, 0, 0)" };


function setup() {
    createCanvas(400, 400);

    // create a GUI object with a folder for the circle object
    let gui = new dat.GUI();
    let cirGui = gui.addFolder('circle');

    // add properties to the circle object
    cirGui.add(circ, 'x', 0, width);
    cirGui.add(circ, 'y', 0, height);
    cirGui.add(circ, 'diameter', 0, 100);
    cirGui.addColor(circ, 'col');
}

function draw() {
    background(220);
    fill(circ.col);
    ellipse(circ.x, circ.y, circ.diameter, circ.diameter);
}
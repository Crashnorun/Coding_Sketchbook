///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

let qt;

function setup() {
    createCanvas(innerWidth, innerHeight);              // create canvas same size as window

    let boundary = new Rectangle(width / 2, height / 2, width / 2, height / 2); 
    qt = new QuadTree(boundary, 4);
    console.log(qt);

    // for (let i = 0; i < 10; i++) {
    //     let p = new Point(random(width), random(height));
    //     qt.insert(p);
    // }
    // background(0);
    // qt.show();
}


function draw() {
    if (mouseIsPressed) {
        for (let i = 0; i < 5; i++) {
            let m = new Point(mouseX + random(-5, 5), mouseY + random(-5, 5));
            qt.insert(m);
        }
    }

    background(0);
    qt.show();
}
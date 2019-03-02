///<reference path = "C:\Users\Charlie\Documents\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />

// start from the middle of the sreen
// create a random vector
// set vector length
// at endpoint of vector, create another random vector
// set vector length

let pts = [];

function setup() {
    createCanvas(600, 600);
    background(0);
    frameRate(10);

    let ptPrev = new Point(createVector(random(100, 150), random(100, 150)), 5);
    ptPrev.vect.setMag(200);
    ptPrev.offset = 0.01;
    ptPrev.color = [random(0, 255), random(0, 255), random(200, 255)];
    pts.push(ptPrev);

    for (let i = 0; i < 15; i++) {
        let pt = new Point(ptPrev.vect, ptPrev.weight * 0.9);
        pt.offset = pts[i].offset + 0.000001;
        pt.rotateVector();
        pt.vect = p5.Vector.add(ptPrev.vect, pt.vect);
        pt.vect.setMag(pts[i].vect.mag() * 0.9);
        pt.color = [pts[i].color[0], pts[i].color[1], random(180, 255)];
        pts.push(pt);
        ptPrev = pt;
    }

    translate(width / 2, height / 2);

    for (let i = 0; i < pts.length; i++) {
        stroke(pts[i].color);
        strokeWeight(pts[i].weight);
        ellipse(pts[i].vect.x, pts[i].vect.y, pts[i].weight, pts[i].weight);
        if (i > 0)
            line(pts[i - 1].vect.x, pts[i - 1].vect.y, pts[i].vect.x, pts[i].vect.y)
    }
}

function draw() {
    //background(0, 0.1);
    fill(0,15);
    rect(0, 0, width, height);
    translate(width / 2, height / 2);
    for (let i = 0; i < pts.length; i++) {
        stroke(pts[i].color);
        strokeWeight(pts[i].weight);
        ellipse(pts[i].vect.x, pts[i].vect.y, pts[i].weight, pts[i].weight);
        if (i > 0)
            line(pts[i - 1].vect.x, pts[i - 1].vect.y, pts[i].vect.x, pts[i].vect.y)
        pts[i].offset += 0.001;
        pts[i].rotateVector();
    }

}

function Point(vect, weight) {
    this.vect = vect;
    this.weight = weight;
    this.offset;
    this.rotateVector = function () {
        this.vect.rotate(map(noise(this.offset), 0, 1, 0, TWO_PI));
        //  console.log(this.offset);
    }

}
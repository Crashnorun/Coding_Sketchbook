
let inc = 0.1;
let scale = 10;
let cols, rows;
let zoff = 0;
let particles = [];
let flowField = [];

function setup() {
  createCanvas(400, 400);
  background(220, 10);

  noiseDetail(6);
  noStroke();

  cols = floor(width / scale);
  rows = floor(height / scale);

  flowField = new Array(cols * rows);

  for (let i = 0; i < 500; i++) {
    particles[i] = new Particle();
  }

}

function draw() {

  background(220, 5);

  let yoff = 0;

  for (let y = 0; y <= rows; y++) {
    let xoff = 0;

    for (let x = 0; x <= cols; x++) {
      let index = (x + y * cols);
      let angle = noise(xoff, yoff, zoff) * TWO_PI * 1;

      let v = p5.Vector.fromAngle(angle);
      v.setMag(0.05);
      flowField[index] = v;

      xoff += inc;
      //fill(r);
      //rect(x * scale, y * scale, scale, scale);

      // stroke(0, 50);
      // fill(0, 50);
      // push();
      // translate(x * scale, y * scale);
      // rotate(v.heading());
      // line(0, 0, scale, 0);
      // pop();
    }
    yoff += inc;
  }
  zoff += 0.001;

  for (let i = 0; i < 100; i++) {
    particles[i].follow(flowField);
    particles[i].update();
    particles[i].show();
  }

}

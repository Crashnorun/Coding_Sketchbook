///<reference path = "C:\Users\cportelli\Documents\Personal\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />
/*
References: https://www.red3d.com/cwr/boids/
https://www.youtube.com/redirect?v=mhjuuHl6qHM&event=video_description&redir_token=PBOnuuqSWQw9MXXckwGAf2GAuvJ8MTU0NDc0NzI1MEAxNTQ0NjYwODUw&q=https%3A%2F%2Fnatureofcode.com%2Fbook%2Fchapter-6-autonomous-agents%2F
*/

const flock = [];
let col;
let alignSlider, cohesionSlider, separationSlider;

function setup() {
    createCanvas(800, 800);
    background(0);
    col = color(0, 10);
    
    alignSlider = createSlider(0, 2, 1.5, 0.1);
    cohesionSlider = createSlider(0, 2, 1, 0.1);
    separationSlider = createSlider(0, 2, 2, 0.1);

    for (let i = 0; i < 100; i++) {
        flock.push(new Particle());
    }
}

function draw() {
    //background(51);
    noStroke();
    fill(col);
    rect(0,0,width, height);

    for (let particle of flock) {
        particle.edges();
        particle.steer(flock);
        //particle.align(flock);
        particle.update();
        particle.show();
    }
}
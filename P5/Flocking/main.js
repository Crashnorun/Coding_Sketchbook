///<reference path = "C:\Users\cportelli\Documents\Personal\GitHub\Coding_Sketchbook\P5\addons\TypeScript Files\p5.global-mode.d.ts" />
/*
References: https://www.red3d.com/cwr/boids/
https://www.youtube.com/redirect?v=mhjuuHl6qHM&event=video_description&redir_token=PBOnuuqSWQw9MXXckwGAf2GAuvJ8MTU0NDc0NzI1MEAxNTQ0NjYwODUw&q=https%3A%2F%2Fnatureofcode.com%2Fbook%2Fchapter-6-autonomous-agents%2F
*/

const flock = [];
let col;

function setup() {
    createCanvas(640, 360);
    for (let i = 0; i < 100; i++) {
        flock.push(new Particle());
    }
    col = color(0, 15);
}

function draw() {
    //background(51);
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
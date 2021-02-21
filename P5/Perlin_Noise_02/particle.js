

function Particle() {
    this.pos = createVector(random(width), random(height));
    this.vel = createVector(0, 0);
    this.acc = createVector(0, 0);
    this.prevPos = this.pos.copy();
    this.maxspeed = 1;

    this.update = function () {

        this.vel.add(this.acc);
        this.vel.limit(this.maxspeed);
        this.pos.add(this.vel);
        this.acc.mult(0);

        this.edges();
    }


    this.applyForce = function (force) {
        this.acc.add(force);
    }

    this.show = function () {
        strokeWeight(1);
        stroke(0, 5);
        line(this.pos.x, this.pos.y, this.prevPos.x, this.prevPos.y);
        //point(this.pos.x, this.pos.y);
        //ellipse(this.pos.x, this.pos.y, 5, 5);
    }


    this.edges = function () {

        if (this.pos.x > width) {
            this.pos.x = 0;
            this.updatePrev();
        }
        if (this.pos.x < 0) {
            this.pos.x = width;
            this.updatePrev();
        }

        if (this.pos.y > height) {
            this.pos.y = 0;
            this.updatePrev();
        }
        if (this.pos.y < 0) {
            this.pos.y = height;
            this.updatePrev();
        }
    }

    this.updatePrev = function () {
        this.prevPos.x = this.pos.x;
        this.prevPos.y = this.pos.y;
    }



    this.follow = function (vectors) {

        let x = floor(this.pos.x / scale);
        let y = floor(this.pos.y / scale);
        let index = x + y * cols;
        let force = vectors[index];
        this.applyForce(force);
    }

}
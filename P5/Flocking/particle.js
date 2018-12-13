
class Particle {

    constructor() {
        this.Position = createVector(random(width), random(height));
        this.Velocity = p5.Vector.random2D();
        this.Velocity.setMag(random(0.5, 1.5));          // random magnitude
        this.Acceleration = createVector();
        this.MaxForce = 0.2;
        this.MaxSpeed = 0.25;
    }

    edges() {
        if (this.Position.x > width) {
            this.Position.x = 0;
        } else if (this.Position.x < 0) {
            this.Position.x = width;
        }

        if (this.Position.y > height) {
            this.Position.y = 0;
        } else if (this.Position.y < 0) {
            this.Position.y = height;
        }
    }

    align(flock) {
        let avg = createVector();
        let maxDist = 50;
        let total = 0;
        for (let particle of flock) {
            let d = dist(this.Position.x, this.Position.y, particle.Position.x, particle.Position.y);
            if (d < maxDist && particle != this) {
                avg.add(particle.Velocity);
                total++;
            }
        }
        if (total > 0) {
            avg.div(total);
            avg.setMag(this.MaxSpeed);
            avg.sub(this.Velocity);
            avg.limit(this.MaxForce);
        }
        return avg;
    }

    cohesion(flock) {
        let avg = createVector();
        let maxDist = 50;
        let total = 0;
        for (let particle of flock) {
            let d = dist(this.Position.x, this.Position.y, particle.Position.x, particle.Position.y);
            if (d < maxDist && particle != this) {
                avg.add(particle.Position);
                total++;
            }
        }
        if (total > 0) {
            avg.div(total);
            avg.sub(this.Position);
            avg.setMag(this.MaxSpeed);
            avg.sub(this.Velocity);
            avg.limit(this.MaxForce);
        }
        return avg;
    }

    steer(flock) {
        let alignment = this.align(flock);
        //let cohesion = this.cohesion(flock);
        this.Acceleration = alignment;
        //this.Acceleration = cohesion;
    }

    update() {
        this.Position.add(this.Velocity);
        this.Velocity.add(this.Acceleration);
    }

    show() {

        strokeWeight(8);
        stroke(255);
        point(this.Position.x, this.Position.y);
    }



}
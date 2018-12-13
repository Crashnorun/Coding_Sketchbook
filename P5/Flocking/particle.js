
class Particle {

    constructor() {
        this.Position = createVector(random(width), random(height));
        this.Velocity = p5.Vector.random2D();
        this.Velocity.setMag(random(2, 4));          // random magnitude
        this.Acceleration = createVector();
        this.MaxForce = 0.2;
        this.MaxSpeed = 5;
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
        let maxDist = 25;
        let total = 0;

        for (let particle of flock) {
            let d = dist(this.Position.x, this.Position.y, particle.Position.x, particle.Position.y);
            if (particle != this && d < maxDist) {
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

    seperation(flock) {
        let avg = createVector();
        let maxDist = 24;
        let total = 0;
        for (let particle of flock) {
            let d = dist(this.Position.x, this.Position.y, particle.Position.x, particle.Position.y);
            if (particle != this && d < maxDist) {
                let diff = p5.Vector.sub(this.Position, particle.Position);
                diff.div(d * d);
                avg.add(diff);
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
            if (particle != this && d < maxDist) {
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
        let cohesion = this.cohesion(flock);
        let separation = this.seperation(flock);

        alignment.mult(alignSlider.value());
        cohesion.mult(cohesionSlider.value());
        separation.mult(separationSlider.value());

        this.Acceleration.add(alignment);
        this.Acceleration.add(cohesion);
        this.Acceleration.add(separation);
    }

    update() {
        this.Position.add(this.Velocity);
        this.Velocity.add(this.Acceleration);
        this.Velocity.limit(this.MaxSpeed);
        this.Acceleration.mult(0);
    }

    show() {
        strokeWeight(8);
        stroke(255);
        point(this.Position.x, this.Position.y);
    }



}
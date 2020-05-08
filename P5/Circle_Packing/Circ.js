

class Circ {


    constructor(cent, radius, numCollisions) {
        this.cent = cent;
        this.radius = radius;
        this.numCollisions = numCollisions;
    }


    Render() {
       // noStroke();
        fill(100, 100, 234);
        circle(this.cent.x, this.cent.y, this.radius);
    }

}


class Circ {


    constructor(cent, radius, numCollisions) {
        this.cent = cent;
        this.radius = radius;
        this.numCollisions = numCollisions;
    }


    Render() {
        circle(this.cent.x, this.cent.y, this.radius);
    }

}
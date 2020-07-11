

class Circ {


    constructor(cent, radius, numCollisions) {
        this.cent = cent;
        this.radius = radius;
        this.numCollisions = numCollisions;
    }


    Render() {
       // noStroke();
       let num = this.radius* (156/50); 
       fill(num, num, 255);
        circle(this.cent.x, this.cent.y, this.radius*2);
    }

}
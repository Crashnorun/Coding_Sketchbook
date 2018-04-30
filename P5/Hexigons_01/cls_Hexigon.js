class Hexigon {

    /** 
     * @param {number} x 
     * @param {number} y
     * @param {number} radius 
     */
    constructor(x, y, radius) {
        this.x = x;
        this.y = y;
        this.radius = radius;
        this.center = new cls_Point(x, y);
        this.pts = [];
        this.color = [];
        this.CalcHex();
    }

    CalcHex() {
        for (let i = 0; i < 2 * PI; i += PI / 3) {
            let tempx = cos(i) * (this.radius);
            let tempy = sin(i) * (this.radius);
            let pt = new cls_Point(tempx, tempy);
            this.pts.push(pt);
        }
    }

    Render() {
        stroke(0);
        //strokeWeight(1);
        // fill(0, 0, 255);
        fill(this.color);
        push()
        translate(this.x, this.y);
        beginShape();
        for (let i = 0; i < this.pts.length; i++) {
            vertex(this.pts[i].x, this.pts[i].y);
        }
        endShape(CLOSE);
        pop();
    }
}


class cls_Point {
    /**
     * @param {number} x 
     * @param {number} y 
     */
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
}
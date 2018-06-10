
class Hexigon {
    /** @param {@param number X Location} locX 
     * @param {@param number Y Location} LocY 
     * @param {@param number Radius} Rad 
     */
    constructor(locX, locY, Rad) {
        this.locX = locX;
        this.locY = locY;
        this.rad = Rad;
        this.col = [0, 0, 0];
        this.fillCol = [0, 0, 255];
        this.pts = [];
        this.calcPts();
        this.scale;
    }

    calcPts() {
        for (let i = 0; i < PI * 2; i += PI / 3) {
            let x = (cos(i) * this.rad) + this.locX;
            let y = (sin(i) * this.rad) + this.locY;
            let vect = new createVector(x, y, 0);
            this.pts.push(vect);
        }
    }

    render() {
        //noFill();
        fill(this.fillCol);
        strokeWeight(3);
        stroke(this.col);

        // translate(-this.locX, -this.locY);
        // scale(this.scale);
        // translate(this.locX, this.locY);

        beginShape();
        for (let i = 0; i < this.pts.length; i++) {
            vertex(this.pts[i].x, this.pts[i].y);
        }
        endShape(CLOSE);
        //ellipse(this.locX, this.locY, this.rad, this.rad);
    }

    fold() {
        fill(this.fillCol);
        strokeWeight(3);
        stroke(this.col);
        beginShape();
        for (let i = 0; i < this.pts.length-1; i++) {
            vertex(this.pts[i].x, this.pts[i].y);
            vertex(this.pts[i+1].x, this.pts[i+1].y);
            vertex(this.locX, this.locY);
        }
        endShape(CLOSE);
    }
}
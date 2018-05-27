class cell {

    /**
     * @param {X location} x 
     * @param {Y location} y 
     * @param {Cell width} w 
     */
    constructor(x, y, w) {
        this.x = x;
        this.y = y;
        this.w = w;
    }

    /**
     * render the diagonal lines
     */
    render() {
        fill(100);
        noStroke();
        push();
        translate(this.x, this.y);        // translate the coordinates to the grid cell
        this.drawlines();
        pop();
    }

    drawlines() {

        // if line is rotated
        if (this.rotation < 0.5) {
            translate(this.w / 2, this.w / 2);      // translate coordinates to center of cell
            push();
            rotate((PI / 2));                       // apply rotation
            translate(-this.w / 2, -this.w / 2);    // translate to cell corner
        }

        let tempX = this.w * 0.7;                   // calculate cell offset
        let tempY = this.w * 0.7;
        beginShape();
        vertex(tempX, 0);
        vertex(this.w, 0);
        vertex(this.w, this.w - tempY);
        vertex(this.w - tempX, this.w);
        vertex(0, this.w);
        vertex(0, tempY);
        endShape(CLOSE);

        if (this.rotation < 0.5) {
            pop();
        }
    }
}
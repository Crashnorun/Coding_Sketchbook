
/** Point class */
class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
}

/** Rectangle Class */
class Rectangle {
    constructor(x, y, w, h) {
        this.x = x;         // center x
        this.y = y;         // center y
        this.w = w;         // width is half the width of rect
        this.h = h;         // height is half the height of the rect
    }

    // checks if a point is within the boundary rectangle
    contains(point) {
        return (point.x >= this.x - this.w &&
            point.x <= this.x + this.w &&
            point.y >= this.y - this.h &&
            point.y <= this.y + this.h);
    }
}

/** QuadTree Class */
class QuadTree {
    constructor(boundary, capacity) {
        this.boundary = boundary;
        this.capacity = capacity;           // number of pts before subdividing
        this.points = [];
        this.divided = false;
    }

    /** Insert point into rect or subivide */
    insert(point) {
        if (!this.boundary.contains(point)) {           // check if pt is in the boundary
            return false;
        }

        if (this.points.length < this.capacity) {       // if there is room in the list
            this.points.push(point);                    // save the point
            return true;
        } else {                                        // if list is at capacity
            if (!this.divided) {
                this.subdivide();                       // subdivide this rectangle
            }
            if (this.nw.insert(point)) {
                return true;
            } else if (this.ne.insert(point)) {
                return true;
            } else if (this.sw.insert(point)) {
                return true;
            } else if (this.se.insert(point)) {
                return true;
            }
        }
    }

    // subdivide the rectangle
    subdivide(boundary) {
        let x = this.boundary.x;
        let y = this.boundary.y;
        let w = this.boundary.w;
        let h = this.boundary.h;

        let nw = new Rectangle(x - w / 2, y - h / 2, w / 2, h / 2);
        let ne = new Rectangle(x + w / 2, y - h / 2, w / 2, h / 2);
        let sw = new Rectangle(x - w / 2, y + h / 2, w / 2, h / 2);
        let se = new Rectangle(x + w / 2, y + h / 2, w / 2, h / 2);

        this.nw = new QuadTree(nw, this.capacity);
        this.ne = new QuadTree(ne, this.capacity);
        this.sw = new QuadTree(sw, this.capacity);
        this.se = new QuadTree(se, this.capacity);
        this.divided = true
    }

    /** Render the geometry */
    show() {
        strokeWeight(1);
        stroke(255);
        noFill();
        rectMode(CENTER);
        rect(this.boundary.x, this.boundary.y, this.boundary.w * 2, this.boundary.h * 2);
        if (this.divided) {
            this.nw.show();
            this.ne.show();
            this.sw.show();
            this.se.show();
        }

        for (let p of this.points) {
            strokeWeight(4);
            point(p.x, p.y);
        }
    }
}
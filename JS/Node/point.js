
/**
 * example of a class with a constructor and two creation methods
the two methods are indended to simulate an overloaded constructor
 */
class Point {

    /**
     * Point Constructor
     */
    constructor() {

        // log the number of arguements
        console.log("Number of arguements: " + arguments.length);

        if (arguments.length == 3) { this.PointByCoords(arguments[0], arguments[1], arguments[2]); }
        else if (arguments.length == 1 && Array.isArray(arguments)) { this.PointByArray(arguments); }
    }

    /**
     * 
     * @param {number} x X coordinate
     * @param {number} y Y coordinate
     * @param {number} z Z coordinate
     */
    PointByCoords(x, y, z) {
        this.x = x;
        this.y = y
        this.z = z;
    }

    /**
     * 
     * @param {number} xyz Number array of XYZ values
     */
    PointByArray(xyz) {
        this.x = xyz[0];
        this.y = xyz[1];
        this.z = xyz[2];
    }

}

/**
 * 3D Point
 */
module.exports.Point = Point;
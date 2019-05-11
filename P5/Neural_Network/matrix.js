

//#region CONSTRUCTOR
function Matrix(rows, cols) {

    this.rows = rows;
    this.cols = cols;
    this.matrix = [];
    for (let i = 0; i < this.rows; i++) {
        this.matrix[i] = [];

        for (let j = 0; j < this.cols; j++) {
            this.matrix[i][j] = 0;
        }
    }
}
//#endregion


Matrix.prototype.randomize = function () {
    for (let i = 0; i < this.rows; i++) {
        for (let j = 0; j < this.cols; j++) {
            this.matrix[i][j] = Math.floor(Math.random() * 10);
        }
    }
}



//#region  SCALAR OPERATIONS

Matrix.prototype.multiply = function (n) {

    if (n instanceof Matrix) {      // element wise multiplication
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                this.matrix[i][j] *= n.matrix[i][j];
            }
        }
    } else {    // scalar function that multiplies a matrix
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                this.matrix[i][j] *= n;
            }
        }
    }
}


Matrix.prototype.add = function (n) {

    if (n instanceof Matrix) {  // element wise addition
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                this.matrix[i][j] += n.matrix[i][j];
            }
        }
    } else {    // scalar function that adds a matrix
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                this.matrix[i][j] += n;
            }
        }
    }
}
//#endregion



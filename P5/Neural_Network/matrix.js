
class Matrix {
    //#region CONSTRUCTOR
    constructor(rows, cols) {

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


     randomize() {
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                this.matrix[i][j] = Math.floor(Math.random() * 10);
            }
        }
    }


    //#region  

    multiply(n) {

        if (n instanceof Matrix) {      // element wise multiplication
            // for (let i = 0; i < this.rows; i++) {
            //     for (let j = 0; j < this.cols; j++) {
            //         this.matrix[i][j] *= n.matrix[i][j];
            //     }
            // }
            if (this.cols !== n.rows) {
                console.log("Columns of A must match rows of B");
            } else {
                let result = new Matrix(this.rows, n.cols);
                for (let i = 0; i < result.rows; i++) {
                    for (let j = 0; j < result.cols; j++) {

                        let sum = 0;

                        for (let k = 0; k < this.cols; k++) {
                            sum += this.matrix[i][k] * n.matrix[k][j];
                        }
                        result.matrix[i][j] = sum;
                    }
                }
                console.table(result.matrix);
                return result;
            }
        } else {    // scalar function that multiplies a matrix
            for (let i = 0; i < this.rows; i++) {
                for (let j = 0; j < this.cols; j++) {
                    this.matrix[i][j] *= n;
                }
            }
        }
    }


    add(n) {

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

}

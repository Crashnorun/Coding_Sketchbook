
class Matrix {

    /**
     * Description. Creates a Matrix object
     * @param {int} rows Number of rows for the matrix
     * @param {int} cols Number of columns for the matrix
     */
    constructor(rows, cols) {

        this.rows = rows;
        this.cols = cols;
        this.data = [];

        for (let i = 0; i < this.rows; i++) {
            this.data[i] = [];

            for (let j = 0; j < this.cols; j++) {
                this.data[i][j] = 0;
            }
        }
    }


    //#region  Methods

    randomize() {
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                this.data[i][j] = Math.floor(Math.random() * 2 - 1);
            }
        }
    }


    toArray() {
        let arr = [];
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                arr.push(this.data[i][j]);
            }
        }
        return arr;
    }


    multiply(n) {

        if (n instanceof Matrix) {      // element wise multiplication
            // for (let i = 0; i < this.rows; i++) {
            //     for (let j = 0; j < this.cols; j++) {
            //         this.matrix[i][j] *= n.matrix[i][j];
            //     }
            // }

        } else {    // scalar function that multiplies a matrix
            for (let i = 0; i < this.rows; i++) {
                for (let j = 0; j < this.cols; j++) {
                    this.data[i][j] *= n;
                }
            }
        }
    }


    // apply a function to every element in the matrix
    map(fn) {
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                let val = this.data[i][j];
                this.data[i][j] = fn(val, i, j);
            }
        }
    }


    add(n) {

        if (n instanceof Matrix) {  // element wise addition
            for (let i = 0; i < this.rows; i++) {
                for (let j = 0; j < this.cols; j++) {
                    this.data[i][j] += n.data[i][j];
                }
            }
        } else {    // scalar function that adds a matrix
            for (let i = 0; i < this.rows; i++) {
                for (let j = 0; j < this.cols; j++) {
                    this.data[i][j] += n;
                }
            }
        }
    }


    /**
     * Description. Print the matrix to the console as a table
     */
    print() {
        console.table(this.data);
    }


    /**
     * Description. Return the size of the matrix
     * @return {string} The size of the matrix as a string Rows:Cols
     */
    size() {
        return this.rows.toString() + ":" + this.cols.toString();
    }
    //#endregion

    //#region Static Methods

    static fromArray(arr) {
        let m = new Matrix(arr.length, 1);
        for (let i = 0; i < arr.length; i++) {
            m.data[i][0] = arr[i];
        }
        return m;
    }


    static multiply(m1, m2) {
        if (m1.cols !== m2.rows) {
            console.log("Columns of A must match rows of B");
        } else {
            let result = new Matrix(m1.rows, m2.cols);
            for (let i = 0; i < result.rows; i++) {
                for (let j = 0; j < result.cols; j++) {

                    let sum = 0;

                    for (let k = 0; k < m1.cols; k++) {
                        sum += m1.data[i][k] * m2.data[k][j];
                    }
                    result.data[i][j] = sum;
                }
            }
            return result;
        }
    }


    /**
     * Description. Perform element wise subtraction m1 - m2
     * 
     * Summary. The two inputs must be of the same matrix size
     * @param {Matrix} m1 Matrix object
     * @param {Matrix} m2 Matrix object
     * @return {Matrix} Result matrix object m1 - m2
     */
    static subtract(m1, m2) {
        // m1 and m2 must be of the same matrix size
        let result = new Matrix(m1.rows, m1.cols);

        for (let i = 0; i < result.rows; i++) {
            for (let j = 0; j < result.cols; j++) {
                result.data[i][j] = m1.data[i][j] - m2.data[i][j];
            }
        }
        // return a new matrix m1-m2
        return result;
    }


    /**
     * Description. Transpose a matrix
     * 
     * Summary. Static function that transposes a matrix
     * @param {Matrix} Input matrix to transpose
     * @return {Matrix} Transposed matrix
     */
    static transpose(m1) {
        let result = new Matrix(m1.cols, m1.rows);
        for (let i = 0; i < result.rows; i++) {
            for (let j = 0; j < result.cols; j++) {
                result.data[j][i] = m1.data[i][j];
            }
        }
        return result;
    }

    //#endregion
}

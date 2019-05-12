
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
    


    //#region  

    randomize() {
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                this.data[i][j] = Math.floor(Math.random() * 2 - 1);
            }
        }
    }


    static fromArray(arr) {
        let m = new Matrix(arr.length, 1);
        for (let i = 0; i < arr.length; i++) {
            m.data[i][0] = arr[i];
        }
        return m;
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
     * Description. Perform element wise subtraction m1 - m2
     * 
     * Summary. The two inputs must be of the same matrix size
     * @param {Matrix} m1 Matrix object
     * @param {Matrix} m2 Matrix object
     * @return {Matrix} Result matrix objec
     */
    static subtract(m1, m2) {

        let result = new Matrix(m1.rows, m1.cols);

        for (let i = 0; i < result.rows; i++) {
            for (let j = 0; j < result.cols; j++) {
                result.data[j][i] = m1.data[i][j] - m2.data[i][j];
            }
        }
        // return a new matrix m1-m2
        return result;
    }


    transpose() {
        let result = new Matrix(this.cols, this.rows);
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                result.data[j][i] = this.data[i][j];
            }
        }
        return result;
    }


    print() {
        console.table(this.data);
    }

    //#endregion

}

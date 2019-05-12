
class NeuralNewtork {

    /**
     * Description. Creates a Neural Network object
     * 
     * Summary. Neural Network Constructor 
     * @param {int} input_Nodes Number of inputs nodes
     * @param {int} hidden_Nodes Number of hidden nodes
     * @param {int} output_Nodes Number of output nodes
     */
    constructor(input_Nodes, hidden_Nodes, output_Nodes) {

        this.input_Nodes = input_Nodes;
        this.hidden_Nodes = hidden_Nodes;
        this.output_Nodes = output_Nodes;

        this.weights_ih = new Matrix(this.hidden_Nodes, this.input_Nodes);
        this.weights_ho = new Matrix(this.output_Nodes, this.hidden_Nodes);
        this.weights_ih.randomize();
        this.weights_ho.randomize();

        this.bias_Hidden = new Matrix(this.hidden_Nodes, 1);
        this.bias_Output = new Matrix(this.output_Nodes, 1);
        this.bias_Hidden.randomize();
        this.bias_Output.randomize();
    }


    feedforward(input_arr) {

        // generating hidden outputs
        let inputs = Matrix.fromArray(input_arr);
        let hidden = Matrix.multiply(this.weights_ih, inputs);
        hidden.add(this.bias_Hidden);
        hidden.map(sigmoid);                    // activation function

        // generating the outputs
        let output = Matrix.multiply(this.weights_ho, hidden);
        output.add(this.bias_Output);
        output.map(sigmoid);

        return output.toArray();
    }


    train(inputs, targets) {

        let outputs = this.feedforward(inputs);
        outputs = Matrix.fromArray(outputs);        // convert array to matrix obj
        targets = Matrix.fromArray(targets);

        // calculate error
        let output_errors = Matrix.subtract(targets, outputs);

        // calculate the hidden layer errors
        let weights_ho_t = Matrix.transpose(this.weights_ho);
        
        let hidden_errors = Matrix.multiply(weights_ho_t, output_errors);

        outputs.print();
        targets.print();
        output_errors.print();
    }
}


function sigmoid(x) {
    return 1 / (1 + Math.exp(-x));
}
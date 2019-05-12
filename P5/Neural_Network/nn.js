
class NeuralNewtork {

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

    train(){}
}


function sigmoid(x) {
    return 1 / (1 + Math.exp(-x));
}
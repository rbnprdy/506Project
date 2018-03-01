- The configuration of this neural network:
	3 layers:
		784 inputs neurons (MNIST)
		30 neurons fully connected
		10 neurons for classification

- Activation function is a sigmoid: (1.0/(1.0+np.exp(-z)) where z is the weighted sum.
- use squared loss as cost function.
- Got a 95.10 test accuracy on MNIST after 30 epochs of training with a mini-batch size of 10.
- There is a bias file for every layer, and going from top to bottom the entries are the biases of every neuron in that layer.
- There is a weight file for every neuron in every layer. From top to bottom the entries to the text file are the weights going into the neuron.
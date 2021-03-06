"""
network.py
~~~~~~~~~~

A module to implement the stochastic gradient descent learning
algorithm for a feedforward neural network.  Gradients are calculated
using backpropagation.  Note that I have focused on making the code
simple, easily readable, and easily modifiable.  It is not optimized,
and omits many desirable features.
"""

#### Libraries
# Standard library
import random

# Third-party libraries
import numpy as np

# Our Libraries
import fixed_point
import SSIM


class Network(object):

    def __init__(self, sizes):
        """The list ``sizes`` contains the number of neurons in the
        respective layers of the network.  For example, if the list
        was [2, 3, 1] then it would be a three-layer network, with the
        first layer containing 2 neurons, the second layer 3 neurons,
        and the third layer 1 neuron.  The biases and weights for the
        network are initialized randomly, using a Gaussian
        distribution with mean 0, and variance 1.  Note that the first
        layer is assumed to be an input layer, and by convention we
        won't set any biases for those neurons, since biases are only
        ever used in computing the outputs from later layers."""
        self.num_layers = len(sizes)
        self.sizes = sizes
        self.biases = [np.random.randn(y, 1) for y in sizes[1:]]
        self.weights = [np.random.randn(y, x)
                        for x, y in zip(sizes[:-1], sizes[1:])]


    def feedforward(self, a):
        """Return the output of the network if ``a`` is input."""
        for b, w in zip(self.biases, self.weights):
            a = sigmoid(np.dot(w, a)+b)
            print a.shape
            print a
        return a

    def SGD(self, training_data, epochs, mini_batch_size, eta,
            test_data=None):
        """Train the neural network using mini-batch stochastic
        gradient descent.  The ``training_data`` is a list of tuples
        ``(x, y)`` representing the training inputs and the desired
        outputs.  The other non-optional parameters are
        self-explanatory.  If ``test_data`` is provided then the
        network will be evaluated against the test data after each
        epoch, and partial progress printed out.  This is useful for
        tracking progress, but slows things down substantially."""
        if test_data: n_test = len(test_data)
        n = len(training_data)
        for j in xrange(epochs):
            random.shuffle(training_data)
            mini_batches = [
                training_data[k:k+mini_batch_size]
                for k in xrange(0, n, mini_batch_size)]
            for mini_batch in mini_batches:
                self.update_mini_batch(mini_batch, eta)
            if test_data:
                print "Epoch {0}: {1} / {2}".format(
                    j, self.evaluate(test_data), n_test)

    def update_mini_batch(self, mini_batch, eta):
        """Update the network's weights and biases by applying
        gradient descent using backpropagation to a single mini batch.
        The ``mini_batch`` is a list of tuples ``(x, y)``, and ``eta``
        is the learning rate."""
        nabla_b = [np.zeros(b.shape) for b in self.biases]
        nabla_w = [np.zeros(w.shape) for w in self.weights]
        for x, y in mini_batch:
            delta_nabla_b, delta_nabla_w = self.backprop(x, y)
            nabla_b = [nb+dnb for nb, dnb in zip(nabla_b, delta_nabla_b)]
            nabla_w = [nw+dnw for nw, dnw in zip(nabla_w, delta_nabla_w)]
        self.weights = [w-(eta/len(mini_batch))*nw
                        for w, nw in zip(self.weights, nabla_w)]
        self.biases = [b-(eta/len(mini_batch))*nb
                       for b, nb in zip(self.biases, nabla_b)]

    def backprop(self, x, y):
        """Return a tuple ``(nabla_b, nabla_w)`` representing the
        gradient for the cost function C_x.  ``nabla_b`` and
        ``nabla_w`` are layer-by-layer lists of numpy arrays, similar
        to ``self.biases`` and ``self.weights``."""
        nabla_b = [np.zeros(b.shape) for b in self.biases]
        nabla_w = [np.zeros(w.shape) for w in self.weights]
        # feedforward
        activation = x
        activations = [x] # list to store all the activations, layer by layer
        zs = [] # list to store all the z vectors, layer by layer
        for b, w in zip(self.biases, self.weights):
            z = np.dot(w, activation)+b
            zs.append(z)
            activation = sigmoid(z)
            activations.append(activation)
        # backward pass
        delta = self.cost_derivative(activations[-1], y) * \
            sigmoid_prime(zs[-1])
        nabla_b[-1] = delta
        nabla_w[-1] = np.dot(delta, activations[-2].transpose())
        # Note that the variable l in the loop below is used a little
        # differently to the notation in Chapter 2 of the book.  Here,
        # l = 1 means the last layer of neurons, l = 2 is the
        # second-last layer, and so on.  It's a renumbering of the
        # scheme in the book, used here to take advantage of the fact
        # that Python can use negative indices in lists.
        for l in xrange(2, self.num_layers):
            z = zs[-l]
            sp = sigmoid_prime(z)
            delta = np.dot(self.weights[-l+1].transpose(), delta) * sp
            nabla_b[-l] = delta
            nabla_w[-l] = np.dot(delta, activations[-l-1].transpose())
        return (nabla_b, nabla_w)

    def evaluate(self, test_data):
        """Return the number of test inputs for which the neural
        network outputs the correct result. Note that the neural
        network's output is assumed to be the index of whichever
        neuron in the final layer has the highest activation."""
        test_results = [(np.argmax(self.feedforward(x)), y)
                        for (x, y) in test_data]
        return sum(int(x == y) for (x, y) in test_results)

    def cost_derivative(self, output_activations, y):
        """Return the vector of partial derivatives \partial C_x /
        \partial a for the output activations."""
        return (output_activations-y)

    def write_parameters(self, data_path, binary=False, hex_=False, W=15, F=12):
        
        if binary and hex_:
            print "Cannot have both binary and hex be true."
            return

        if hex_:
            for count, layer in enumerate(self.biases):
                with open("{}/biases_{}.txt".format(data_path, count), 'w') as f:
                    for bias_count, bias in enumerate(layer):
                        f.write(SSIM.float_to_hex(bias) + "\n")
                    

            for layer_count, layer in enumerate(self.weights):
                for neuron_count, neuron in enumerate(layer):
                    with open("{}/weight_{}_{}.txt".format(data_path, layer_count, neuron_count), 'w') as f:
                        for weight_count, weight in enumerate(neuron):
                            f.write(SSIM.float_to_hex(weight) + "\n")
        elif not binary:
            for count, layer in enumerate(self.biases):
                np.savetxt("{}/biases_{}.txt".format(data_path, count), np.array(layer), delimiter = "\n")

            for layer_count, layer in enumerate(self.weights):
                for neuron_count, neuron in enumerate(layer):
                    np.savetxt("{}/weight_{}_{}.txt".format(data_path, layer_count, neuron_count), np.array(neuron), delimiter = "\n")
        else:
            for count, layer in enumerate(self.biases):
                with open("{}/biases_{}.txt".format(data_path, count), 'w') as f:
                    for bias_count, bias in enumerate(layer):
                        f.write(fixed_point.float2fix_bin(bias, W, F, twos_compliment=True) + "\n")
                    

            for layer_count, layer in enumerate(self.weights):
                for neuron_count, neuron in enumerate(layer):
                    with open("{}/weight_{}_{}.txt".format(data_path, layer_count, neuron_count), 'w') as f:
                        for weight_count, weight in enumerate(neuron):
                            f.write(fixed_point.float2fix_bin(weight, W, F, twos_compliment=True) + "\n")


    def read_parameters(self, data_path):
        for count, layer in enumerate(self.biases):
            old_shape = self.biases[count].shape
            self.biases[count] = np.loadtxt("{}/biases_{}.txt".format(data_path, count))
            self.biases[count] = self.biases[count].reshape(old_shape)

        for layer_count, layer in enumerate(self.weights):
            for neuron_count, neuron in enumerate(layer):
                self.weights[layer_count][neuron_count] = np.loadtxt("{}/weight_{}_{}.txt".format(data_path, layer_count, neuron_count))


    def print_network_info(self):
        max_weight = 0
        for ed_is_dumb in self.weights:
            for l in ed_is_dumb:
                for w in l:
                    if w > max_weight:
                        max_weight = w

        print("Max Weight: {}".format(max_weight))

    def convert_to_fix(self, W, F):
        for layer in self.biases:
            for bias_count, bias in enumerate(layer):
                layer[bias_count] = fixed_point.float2fix_val(bias, W, F)
                bias = fixed_point.float2fix_val(bias, W, F)

        for layer in self.weights:
            for neuron in layer:
                for weight_count, weight in enumerate(neuron):
                    neuron[weight_count] = fixed_point.float2fix_val(weight, W, F)



#### Miscellaneous functions
def sigmoid(z):
    """The sigmoid function."""
    return 1.0/(1.0+np.exp(-z))

def leaky_relu(z):
    return 0.01 * z * (1 - (z > 0)) + z * (z > 0)

def leaky_relu_prime(z):
    return 0.01 * (1 - (z > 0)) + 1.0 * (z > 0)

def sigmoid_prime(z):
    """Derivative of the sigmoid function."""
    return sigmoid(z)*(1-sigmoid(z))

def one_hot_encode(a):
    ret_array = np.zeros((10, 1))
    ret_array[a] = 1
    return ret_array

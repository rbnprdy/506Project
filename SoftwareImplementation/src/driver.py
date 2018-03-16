import network
import mnist_loader
import numpy as np

def main():
	training_data, validation_data, testing_data = mnist_loader.load_data_wrapper()
	net = network.Network([784, 30, 10])
	noise = 10 * np.random.normal(0, 1, 784)
	noise = noise.reshape((784, 1))

	noisy_data = np.clip(training_data[0][0] + noise, 0, 256)
	net.SGD(training_data, 30, 10, 3.0, test_data=testing_data)
	noisy_data = np.clip(training_data[0][0] + noise, 0, 256)
	print "No noise confidence"
	print net.feedforward(training_data[0][0])
	print "Noise confidence"
	print net.feedforward(noisy_data)
	print "Classification"
	print training_data[0][1]
	#net.write_parameters("../parameter_data")



if __name__ == '__main__':
	main()
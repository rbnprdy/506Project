import network
import mnist_loader
import numpy as np

def main():
	training_data, validation_data, testing_data = mnist_loader.load_data_wrapper()
	net = network.Network([784, 30, 10])
	net.SGD(training_data, 30, 10, 3.0, test_data=testing_data)
	#net.write_parameters("../parameter_data")



if __name__ == '__main__':
	main()
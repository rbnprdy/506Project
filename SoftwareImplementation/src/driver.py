import network
import mnist_loader
import numpy as np
import matplotlib.pyplot as plt
import post_processing

def main():
	training_data, validation_data, testing_data = mnist_loader.load_data_wrapper()
	net = network.Network([784, 30, 10])
	noisy_testing_data = []
	
	noisy_testing_data = post_processing.create_noisy_data(testing_data, 100)
	post_processing.create_image_from_mnist(testing_data[0][0], "No Noise", "MNISTdata_no_noise.png")
	post_processing.create_image_from_mnist(noisy_testing_data[0][0], "With Noise", "MNISTdata_noise.png")
	
	net.SGD(training_data, 10, 10, 3.0, test_data=testing_data)

	print "No noise confidence"
	print net.feedforward(testing_data[0][0])
	print "Noise confidence"
	print net.feedforward(noisy_testing_data[0][0])

	print "Score of no noise: {}/1000".format(net.evaluate(testing_data))
	print "Score of noise: {}/1000".format(net.evaluate(noisy_testing_data))



if __name__ == '__main__':
	main()
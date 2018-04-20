import network
import mnist_loader
import numpy as np
import matplotlib.pyplot as plt
import post_processing
from skimage.measure import compare_ssim as ssim
import fixed_point
import SSIM

def main():	

	training_data, validation_data, testing_data = mnist_loader.load_data_wrapper()
	noisy_testing_data, noisy_training_data = post_processing.create_two_noisy_data(testing_data, training_data, 80)
	post_processing.create_hex_float_image(training_data[0][0], '../image_hex_data.txt')
	post_processing.create_image_from_mnist(training_data[0][0], 'First training data', '../image_data.png')
	net = network.Network([784, 30, 10])
	net.SGD(training_data, 10, 10, 3.0)
	
	# Writing the floating and fixed data, with binary true so we can get the binary represention of the data
	net.write_parameters("../floating_parameter_data")
	net.write_parameters("../fixed_parameter_data", binary=True)
	net.write_parameters("../floating_parameter_hex_data", hex_=True)

	'''
	# This is a test of how changing the Fraction bitwidth effects the accuracy.
	# Mostly seems to remain unchanged
	for i in range(8, 13):
		print "On F={}".format(i)
		net = network.Network([784, 30, 10])
		net.SGD(training_data, 10, 10, 3.0)
		print "Floatng point accuracy: {}".format(net.evaluate(testing_data))
		print net.biases[0][0]
		net.convert_to_fix(15, i)
		print "Floating point accuracy for F={}: {}".format(i, net.evaluate(testing_data))
		print net.biases[0][0]
	'''

	

if __name__ == '__main__':
	main()
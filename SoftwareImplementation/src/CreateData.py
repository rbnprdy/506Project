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
	noisy_data = post_processing.create_noisy_data(training_data, 80)
	# this is a "5"
	noisy_pixels1 = noisy_data[0][0]*256
	# this is a "0"
	noisy_pixels2 = noisy_data[1][0]*256
	# this is a "4"
	noisy_pixels3 = noisy_data[3][0]*256

	net = network.Network([784, 30, 10])

	net.read_parameters("../floating_parameter_data")
	net.convert_to_fix(15, 12)

	#print net.weights[0][0]
	print '1st image:'
	net.feedforward(training_data[0][0])

	#print '2nd image:'
	#print net.feedforward(noisy_pixels2)

	#print '3rd image:'
	#print net.feedforward(noisy_pixels3)


	#post_processing.create_hex_float_image(training_data[0][0], '../image_hex_data.txt')
	#post_processing.create_image_from_mnist(training_data[0][0], 'First training data', '../image_data.png')
	#net = network.Network([784, 30, 10])
	#net.SGD(training_data, 10, 10, 3.0)
	
	# Writing the floating and fixed data, with binary true so we can get the binary represention of the data
	#net.write_parameters("../floating_parameter_data")
	#net.write_parameters("../fixed_parameter_data", binary=True)
	#net.write_parameters("../floating_parameter_hex_data", hex_=True)

	'''
	Creating the running average array from training_data. We then 
	create the image of all average to make sure that it looks good.
	'''
	#count = [0] * 10
	#running_average = [np.zeros((784, 1), dtype='float32')] * 10
	#for i in training_data:
	#	label = np.argmax(i[1])
	#	count[label] = count[label] + 1
	#	running_average[label] = running_average[label] + i[0]

	#for index, i in enumerate(count):
	#	running_average[index] = running_average[index] / count[index]

	'''
	Writing the running average to files for the hardware people
	'''
	#for index, i in enumerate(running_average):
	#	SSIM.generate_input_mem(i * 256, 'running_average{}.txt'.format(index))



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
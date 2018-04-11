import network
import mnist_loader
import numpy as np
import matplotlib.pyplot as plt
import post_processing
from skimage.measure import compare_ssim as ssim

def main():

	training_data, validation_data, testing_data = mnist_loader.load_data_wrapper()
	noisy_testing_data, noisy_training_data = post_processing.create_two_noisy_data(testing_data, training_data, 80)

	
	net = network.Network([784, 30, 10])	
	net.SGD(training_data, 10, 10, 3.0)
	print 'Floating point accuracy: {}'.format(net.evaluate(testing_data) / 10000.0)

	for i in range(8, 14):
		net.convert_to_fix(16, i)
		print 'Fixed point accuracy with F = {}: {}'.format(i, net.evaluate(testing_data) / 10000.0)
	

if __name__ == '__main__':
	main()
import network
import mnist_loader
import numpy as np
import matplotlib.pyplot as plt
import post_processing
from skimage.measure import compare_ssim as ssim

def main():
	training_data, validation_data, testing_data = mnist_loader.load_data_wrapper()
	
	post_processing.create_image_from_mnist(testing_data[0][0], "No Noise", "testing_data_no_noise.png")
		
	for count in range(1, 11):
		print "\nRun {}".format(count)
		#for i in [0, 20, 40, 60, 80,100]:
		noisy_testing_data, noisy_training_data = post_processing.create_two_noisy_data(testing_data, training_data, 80)
		ssim_noise = ssim(testing_data[0][0].reshape((28, 28)), noisy_testing_data[0][0].reshape((28, 28)))		

		net = network.Network([784, 30, 10])
		net.SGD(noisy_training_data, 10, 10, 3.0)

		print("Noise: ")
		net.print_network_info()

		net_no_noise = network.Network([784, 30, 10])
		net_no_noise.SGD(training_data, 10, 10, 3.0)

		print("No Noise: ")
		net_no_noise.print_network_info()

		print "{}, {}, {}, {}".format(i, ssim_noise, net.evaluate(testing_data)/10000.0, net.evaluate(noisy_testing_data)/10000.0)



	



if __name__ == '__main__':
	main()
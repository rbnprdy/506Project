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
		for i in [0, 20, 40, 60, 80,100]:
			noisy_testing_data, noisy_training_data = post_processing.create_two_noisy_data(testing_data, training_data, i)
			ssim_noise = ssim(testing_data[0][0].reshape((28, 28)), noisy_testing_data[0][0].reshape((28, 28)))		

			#post_processing.create_image_from_mnist(testing_data[0][0], "No Noise", "testing_data_no_noise.png")
			#post_processing.create_image_from_mnist(noisy_testing_data[0][0], "With Noise", "testing_data_with_noise.png")
			#post_processing.create_image_from_mnist(training_data[0][0], "No Noise", "training_data_no_noise.png")
			#post_processing.create_image_from_mnist(noisy_training_data[0][0], "With Noise", "training_data_with_noise.png")
			
			net = network.Network([784, 30, 10])
			net.SGD(noisy_training_data, 10, 10, 3.0)

			#print "No noise confidence"
			#print net.feedforward(testing_data[0][0])
			#print "Noise confidence"
			#print net.feedforward(noisy_testing_data[0][0])
			print "{}, {}, {}, {}".format(i, ssim_noise, net.evaluate(testing_data)/10000.0, net.evaluate(noisy_testing_data)/10000.0)
			#print "Score of no noise: {}/1000".format(net.evaluate(testing_data))
			#print "Score of noise: {}/1000".format(net.evaluate(noisy_testing_data))
	



if __name__ == '__main__':
	main()
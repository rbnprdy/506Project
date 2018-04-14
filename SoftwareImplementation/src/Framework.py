import network
import mnist_loader
import numpy as np
import matplotlib.pyplot as plt
import post_processing
import fixed_point
import random
import SSIM


TRAINING_THRESHOLD = 100	# The number of times we are not confident before we train on the data
CONFIDENCE_THRESHOLD = 0.85	# The confidence that we need in order say that we are right
SSIM_THRESHOLD = 0.001		# The SSIM threshold before we have to train again
NUM_TRAIN = 1000			# How many times we will run through this

def main():


	'''
	These are statistics to see how useful the SSIM and confidence check are, over time
	'''
	ssim_true_positive = 0
	confidence_true_positive = 0 

	'''
	Initializing framework necessary things
	'''
	running_average = [np.zeros((784, 1), dtype='float32')] * 10
	training_images = []
	num_incorrect = 0


	'''
	Creating the network, clean data, and noisy data
	'''
	net = network.Network([784, 30, 10])	# The network that we will adaptivally train with
	training_data, validation_data, testing_data = mnist_loader.load_data_wrapper()
	noisy_testing_data, noisy_training_data = post_processing.create_two_noisy_data(testing_data, training_data, 80)


	'''
	Training the network on the clean data.
	'''
	net = network.Network([784, 30, 10])
	net.SGD(training_data, 10, 10, 3.0)

	print 'BEFORE FRAMEWORK'
	print "Net 2 accuracy on clean data: {}".format(net.evaluate(testing_data)/10000.0)
	print "Net 2 accuracy on clean data: {}".format(net.evaluate(noisy_testing_data)/10000.0)

	'''
	Creating the running average array from training_data. We then 
	create the image of all average to make sure that it looks good.
	'''
	count = [0] * 10
	for i in training_data:
		label = np.argmax(i[1])
		count[label] = count[label] + 1
		running_average[label] = (running_average[label] + i[0]) / count[label]

	for index, i in enumerate(running_average):
		post_processing.create_image_from_mnist(i, 'Average {} before framework'.format(index), 'data{}.png'.format(index))

	'''
	Actually going through the adaptive training for net. Similar to deploying into real world.
	'''
	for i in range(NUM_TRAIN):
		'''
		Network sees image in the field. It produces 10 outputs
		'''
		test_index = random.randint(0,10000)			
		curr_image =  noisy_training_data[test_index]
		network_output = net.feedforward(curr_image[0])
		network_prediction = np.argmax(network_output)
		network_confidence = np.max(network_output)

		if network_confidence < CONFIDENCE_THRESHOLD:
			training_images.append(curr_image)
			num_incorrect = num_incorrect + 1
			confidence_true_positive = confidence_true_positive + int(not network_prediction == np.argmax(curr_image[1]))

		else:
			ssim_val = SSIM.SSIM(curr_image[0], running_average[network_prediction])

			if ssim_val < SSIM_THRESHOLD:
				training_images.append(curr_image)
				num_incorrect = num_incorrect + 1
				ssim_true_positive = ssim_true_positive + int(not network_prediction == np.argmax(curr_image[1]))


		if num_incorrect >= TRAINING_THRESHOLD:
			print 'We are retraining. Triggering a retrain. SSIM got {} correct, confidence got {} correct'.format(ssim_true_positive, confidence_true_positive)
			net.SGD(training_images, 10, 10, 3.0)
			training_images = []
			num_incorrect = 0
			ssim_true_positive = 0
			confidence_true_positive = 0
			for i in training_data:
				label = np.argmax(i[1])
				count[label] = count[label] + 1
				running_average[label] = (running_average[label] + i[0]) / count[label]

	
	'''
	Seeing how accurate we are on both the noisy and not-noisy testing data
	'''
	print 'AFTER FRAMEWORK'
	print "Net 2 accuracy on clean data: {}".format(net.evaluate(testing_data)/10000.0)
	print "Net 2 accuracy on noisy data: {}".format(net.evaluate(noisy_testing_data)/10000.0)

	for index, i in enumerate(running_average):
		post_processing.create_image_from_mnist(i, 'Average {} after framework'.format(index), 'AfterFramework{}.png'.format(index))


if __name__ == '__main__':
	main()
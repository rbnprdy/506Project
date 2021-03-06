import network
import mnist_loader
import numpy as np
import matplotlib.pyplot as plt
import post_processing
import fixed_point
import random
import SSIM

	
NUM_TRAIN = 1000			# How many times we will run through this

def main():
	ssim_threshold_range = np.linspace(0, 0.5, 1)				# The SSIM threshold before we have to train again
	confidence_threshold_range = np.linspace(0.6, 0.95, 100)	# The confidence that we need in order say that we are right
	training_threshold_range = np.linspace(100, 250, 1)			# The number of times we are not confident before we train on the data

	print "ssim_threshold, confidence_threshold, training_threshold, clean_diff, noisy_diff, num_retrain, num_missed, ssim_triggers, confidence_triggers, ssim_true_positive_rate, confidence_true_positive_rate"
	for ssim_threshold in ssim_threshold_range:
		for confidence_threshold in confidence_threshold_range:
			for training_threshold in training_threshold_range:
				run_framework(training_threshold, confidence_threshold, ssim_threshold, NUM_TRAIN)
				
	



def run_framework(training_threshold, confidence_threshold, ssim_threshold, num_train):
	'''
	These are statistics to see how useful the SSIM and confidence check are, over time
	'''
	ssim_true_positive = 0
	confidence_true_positive = 0 
	confidence_false_positive = 0
	ssim_false_positive = 0

	num_retrain = 0
	num_missed = 0

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

	original_clean_accuracy = net.evaluate(testing_data) / 10000.0
	original_noisy_accuracy = net.evaluate(noisy_testing_data) / 10000.0

	'''
	Creating the running average array from training_data. We then 
	create the image of all average to make sure that it looks good.
	'''
	count = [0] * 10
	for i in training_data:
		label = np.argmax(i[1])
		count[label] = count[label] + 1
		running_average[label] = running_average[label] + i[0]

	for index, i in enumerate(count):
		running_average[index] = running_average[index] / count[index]


	'''
	Actually going through the adaptive training for net. Similar to deploying into real world.
	'''
	for train_iter in range(num_train):
		'''
		Network sees image in the field. It produces 10 outputs
		'''
		test_index = random.randint(0,10000)			
		curr_image =  noisy_training_data[test_index]
		network_output = net.feedforward(curr_image[0])
		network_prediction = np.argmax(network_output)
		network_confidence = np.max(network_output)

		if network_confidence < confidence_threshold:
			training_images.append(curr_image)
			num_incorrect = num_incorrect + 1
			confidence_true_positive = confidence_true_positive + int(not network_prediction == np.argmax(curr_image[1]))
			confidence_false_positive = confidence_false_positive + int(network_prediction == np.argmax(curr_image[1]))
		else:
			#ssim_val = SSIM.CW_SSIM(curr_image[0].ravel(), running_average[network_prediction].ravel())
			ssim_val = SSIM.SSIM(256 * curr_image[0], 256 * running_average[network_prediction]) / 100.0

			if ssim_val < ssim_threshold:
				training_images.append(curr_image)
				num_incorrect = num_incorrect + 1
				ssim_true_positive = ssim_true_positive + int(not network_prediction == np.argmax(curr_image[1]))
				ssim_false_positive = ssim_false_positive + int(network_prediction == np.argmax(curr_image[1]))
			else:
				num_missed = num_missed + int(not network_prediction == np.argmax(curr_image[1]))					# Will go into here if it is fine. Adding if it is wrong.



		if num_incorrect >= training_threshold:
			num_retrain = num_retrain + 1
			net.SGD(training_images, 10, 10, 3.0)
			training_images = []
			num_incorrect = 0
			for i in training_data:
				label = np.argmax(i[1])
				count[label] = count[label] + 1
				running_average[label] = running_average[label] + i[0]
			
			for index, i in enumerate(count):
				running_average[index] = running_average[index] / count[index]

	
	'''
	Seeing how accurate we are on both the noisy and not-noisy testing data
	'''

	clean_diff = original_clean_accuracy - net.evaluate(testing_data)/10000.0
	noisy_diff = net.evaluate(noisy_testing_data)/10000.0 - original_noisy_accuracy
	ssim_triggers = ssim_false_positive + ssim_true_positive
	confidence_triggers = confidence_false_positive + confidence_true_positive
	try:
		ssim_true_positive_rate = ssim_true_positive * 1.0 / ssim_triggers
	except:
		ssim_true_positive_rate = 0

	try:
		confidence_true_positive_rate = confidence_true_positive * 1.0 / confidence_triggers
	except:
		confidence_true_positive_rate = 0

	print "{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}".format(ssim_threshold, confidence_threshold, training_threshold, clean_diff, noisy_diff, num_retrain, num_missed, ssim_triggers, confidence_triggers, ssim_true_positive_rate, confidence_true_positive_rate)



if __name__ == '__main__':
	main()
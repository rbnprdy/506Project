import SSIM
import mnist_loader
import post_processing
import numpy as np


def main():
	training_data, validation_data, testing_data = mnist_loader.load_data_wrapper()
	noisy_testing_data, noisy_training_data = post_processing.create_two_noisy_data(testing_data, training_data, 80)

	count = [0] * 10
	running_average = [np.zeros((784, 1), dtype='float32')] * 10

	for i in testing_data:
		label = i[1]
		count[label] = count[label] + 1
		running_average[label] = running_average[label] + i[0]

	for index, i in enumerate(count):
		running_average[index] = running_average[index] / count[index]

	clean_cw_ssim_vals = np.zeros((len(testing_data)))
	clean_ssim_vals = np.zeros((len(testing_data)))
	for index, i in enumerate(testing_data):
		label = i[1]
		clean_cw_ssim_vals[index] = SSIM.CW_SSIM(i[0].ravel(), running_average[label].ravel())
		clean_ssim_vals[index] = SSIM.SSIM(256 * i[0], 256 * running_average[label]) / 100.0

	print 'Mean of clean cw ssim: {}'.format(np.mean(clean_cw_ssim_vals))
	print 'Mean of clean ssim: {}'.format(np.mean(clean_ssim_vals))
	print 'std dev of clean cw ssim: {}'.format(np.std(clean_cw_ssim_vals))
	print 'std dev of clean ssim: {}'.format(np.std(clean_ssim_vals))

	noisy_cw_ssim_vals = np.zeros(len(testing_data))
	noisy_ssim_vals = np.zeros(len(testing_data))
	for index, i in enumerate(noisy_testing_data):
		label = i[1]
		noisy_cw_ssim_vals[index] = SSIM.CW_SSIM(i[0].ravel(), running_average[label].ravel())
		noisy_ssim_vals[index] = SSIM.SSIM(256 * i[0], 256 * running_average[label]) / 100.0


	print 'Mean of noisy cw ssim: {}'.format(np.mean(noisy_cw_ssim_vals))
	print 'Mean of noisy ssim: {}'.format(np.mean(noisy_ssim_vals))
	print 'std dev of noisy cw ssim: {}'.format(np.std(noisy_cw_ssim_vals))
	print 'std dev of noisy ssim: {}'.format(np.std(noisy_ssim_vals))



if __name__ == '__main__':
	main()
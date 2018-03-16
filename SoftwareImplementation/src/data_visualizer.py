import mnist_loader
import matplotlib.pyplot as plt
import numpy as np

def main():
	print 'hello'
	training_data, validation_data, testing_data = mnist_loader.load_data_wrapper()
	#print training_data[0][0] # This guy should be a five
	pixels = training_data[0][0]
	noise = 10 * np.random.normal(0, 1, 784)
	noise = noise.reshape((784, 1))

	pixels = pixels * 256
	noisy_pixels = np.clip(noise + pixels, 0, 256)
	print noisy_pixels
	print pixels
	pixels = np.array(pixels, dtype='uint8')
	pixels = pixels.reshape((28, 28))

	noisy_pixels = np.array(noisy_pixels, dtype='uint8')
	noisy_pixels = noisy_pixels.reshape((28, 28))	

	plt.figure()
	plt.title('MNIST 5 - no noise')
	plt.imshow(pixels, cmap='gray')
	plt.savefig('MNISTdata_no_noise.png')

	plt.figure()
	plt.title('MNIST 5 - Gaussian noise added')
	plt.imshow(noisy_pixels, cmap='gray')
	plt.savefig('MNISTdata_noise.png')
	


if __name__ == '__main__':
	main()



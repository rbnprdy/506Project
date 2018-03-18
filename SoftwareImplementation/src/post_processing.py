import matplotlib.pyplot as plt
import numpy as np

def main():
	print 'You are in the post processing module :). Welcome to our genius.'


def create_image_from_mnist(pixels, path, title):
	pixels = pixels * 256
	pixels = pixels.reshape((28, 28))
	plt.figure()
	plt.title(title)
	plt.imshow(pixels, cmap='gray')
	plt.savefig(path)


def create_noisy_data(data, amplitude):
	noisy_testing_data = [None] * len(data)
	noise = amplitude * np.random.normal(0, 1, 784)			# Creating noise
	noise = noise.reshape((784, 1))

	for count, i in enumerate(data):						# Adding noise to all data
		pixels = i[0] * 256
		noisy_pixels = np.clip(noise + pixels, 0, 256)
		noisy_pixels = noisy_pixels / 256
		noisy_testing_data[count] = [noisy_pixels, i[1]]

	return noisy_testing_data
	


if __name__ == '__main__':
	main()

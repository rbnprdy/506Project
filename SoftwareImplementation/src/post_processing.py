import matplotlib.pyplot as plt
import numpy as np
import fixed_point
import SSIM

def main():
	print 'You are in the post processing module :). Welcome to our genius.'


def create_image_from_mnist(pixels, title, path):
	pixels = pixels * 256
	pixels = pixels.reshape((28, 28))
	#pixels = np.array(pixels, dtype='uint8')
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
		noisy_testing_data[count] = [noisy_pixels.astype(i[0].dtype), i[1]]

	return noisy_testing_data

def create_noisy_fixed_point_data(data, amplitude):
	noisy_testing_data = [None] * len(data)
	noise = amplitude * np.random.normal(0, 1, 784)			# Creating noise
	noise = noise.reshape((784, 1))

	for count, i in enumerate(data):						# Adding noise to all data
		pixels = i[0] * 256
		noisy_pixels = np.clip(noise + pixels, 0, 256)
		noisy_pixels = noisy_pixels / 256
		noisy_testing_data[count] = [noisy_pixels.astype(i[0].dtype), i[1]]

	for i in range(0, len(noisy_testing_data)):
		noisy_testing_data[i][0] *= 256
		np.round(noisy_testing_data[i][0])
		
	return noisy_testing_data

def create_lighter_data(data, amplitude):
	noisy_testing_data = [None] * len(data)

	for count, i in enumerate(data):						# Adding noise to all data
		pixels = i[0] * 256
		noisy_pixels = np.clip(amplitude + pixels, 0, 256)
		noisy_pixels = noisy_pixels / 256
		noisy_testing_data[count] = [noisy_pixels.astype(i[0].dtype), i[1]]

	return noisy_testing_data
	

def create_two_noisy_data(data1, data2, amplitude):
	noisy_data1 = [None] * len(data1)
	noisy_data2 = [None] * len(data2)
	noise = amplitude * np.random.normal(0, 1, 784)			# Creating noise
	noise = noise.reshape((784, 1))

	for count, i in enumerate(data1):						# Adding noise to all data
		pixels = i[0] * 256
		noisy_pixels = np.clip(noise + pixels, 0, 256)
		noisy_pixels = noisy_pixels / 256
		noisy_data1[count] = [noisy_pixels.astype(i[0].dtype), i[1]]

	for count, i in enumerate(data2):						# Adding noise to all data
		pixels = i[0] * 256
		noisy_pixels = np.clip(noise + pixels, 0, 256)
		noisy_pixels = noisy_pixels / 256
		noisy_data2[count] = [noisy_pixels.astype(i[0].dtype), i[1]]

	return noisy_data1, noisy_data2


def create_fixed_image(pixels, path, W, F):
	fixed_pixels = []
	pixels = pixels * 256
	for i in pixels:
		fixed_pixels.append(fixed_point.float2fix_bin(i, W, F, twos_compliment=True))

	with open(path, 'w') as f:
		for i in fixed_pixels:
			f.write('{}\n'.format(i))



def create_hex_float_image(pixels, path):
	fixed_pixels = []
	pixels = pixels * 256
	for i in pixels:
		fixed_pixels.append(SSIM.float_to_hex(i))

	with open(path, 'w') as f:
		for i in fixed_pixels:
			f.write('{}\n'.format(i))



if __name__ == '__main__':
	main()

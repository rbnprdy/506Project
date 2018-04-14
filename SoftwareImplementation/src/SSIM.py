import mnist_loader
import numpy as np
import matplotlib.pyplot as plt
import post_processing
#from skimage.measure import compare_ssim as ssim_ski
import struct

def main():
    training_data, _, _ = mnist_loader.load_data_wrapper()

     # Setup Data
    pixels = training_data[0][0]*256

    noisy_data = post_processing.create_noisy_data(training_data, 80)
    noisy_pixels = noisy_data[0][0]*256

    generate_input_mem(noisy_pixels)

    SSIM(pixels, noisy_pixels, verbose=True)

    # for i in range(0, 101):
    #     noisy_data = post_processing.create_noisy_data(training_data, i)
    #     noisy_pixels = noisy_data[0][0]*256
    #     #SSIM(pixels, noisy_pixels, verbose=True)
    #     print("SSIM for Amplitude {}: {}\tSSIM-SKI for Amplitude {}: {}".format(i, SSIM(pixels, noisy_pixels), i, ssim_ski(pixels.reshape(28,28), noisy_pixels.reshape(28,28))))
    #     #print("SSIM for Amplitude {}: {}".format(i, SSIM(pixels, noisy_pixels)))

def generate_input_mem(data):

    f = open("input_y.txt", "w+")
    m = mean(data)
    i = 0
    for d in data:
        f.write(str(float_to_hex(d[0] - m[0]))[0:10])
        f.write("\n")

    f.close()
    
def SSIM(x, y, verbose = False, use_c = False):
    # Calculate Means
    mean_x = mean(x)
    mean_y = mean(y)
    
    # Calculate Stdevs
    stdev_x = dev(x, mean_x)
    stdev_y = dev(y, mean_y)
    
    # calculate covariance
    #cov_xy = np.cov(p)[0][1]
    cov_xy = cov(x, y, mean_x, mean_y)
    
    # calculate SSIM
    SSIM = l(mean_x, mean_y, use_c=use_c) * c(stdev_x, stdev_y, use_c=use_c) * s(cov_xy, stdev_x, stdev_y, use_c=use_c)
    SSIM = SSIM / (100*100)

    if verbose:
        print("mean_x: {}".format(mean_x))
        print("mean_y: {}".format(mean_y))
        print("st_x: {}".format(stdev_x))
        print("st_y: {}".format(stdev_y))
        print("COV: {}".format(cov_xy))
        print("STDEV mult: {}".format(stdev_x*stdev_y))
        print("l: {}".format(l(mean_x, mean_y)))
        print("c: {}".format(c(stdev_x, stdev_y)))
        print("s: {}".format(s(cov_xy, stdev_x, stdev_y)))
        print("SSIM: {}".format(SSIM))
        print("\nNoisy mean in hex: {}".format(str(float_to_hex(mean_y))[0:10]))
        print("Noisy dev in hex: {}".format(str(float_to_hex(stdev_y))[0:10]))

    return SSIM

def cov(x, y, u_x, u_y):
    sum = 0
    for i in range(0, len(x)):
        sum = sum + np.round((x[i]-u_x)*(y[i]-u_y))
    return sum / (len(x) - 1)

def mean(x):
    sum = 0
    for i in range(0, len(x)):
        sum = sum + x[i]
    return int(sum) / int(len(x))

def dev(x, u_x):
    sum = 0
    for i in range(0, len(x)):
        sum = sum + np.round((x[i] - u_x)*(x[i] - u_x))
    sum = sum / (len(x) - 1)
    return np.sqrt(sum)

def l(u_x, u_y, use_c = False):
    c1 = 0
    if use_c:
        c1 = (0.0001*255)**2
    return (100*(2*u_x*u_y + c1)) / ((u_x**2 + u_y**2 + c1))

def c(s_x, s_y, use_c = False):
    c2 = 0
    if use_c:
        c2 = (0.0001*255)**2
    return (100*(2*s_x*s_y+c2)) / ((s_x**2 + s_y**2 + c2))

def s(s_xy, s_x, s_y, use_c = False):
    c3 = 0
    if use_c:
        c3 = int((0.0001*255)**2) / int(2)
    return min(100, (100*(s_xy+c3)) / ((s_x*s_y + c3)))

def float_to_hex(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])

def double_to_float(d):
    return float(struct.unpack("f", struct.pack("f", d))[0])

if __name__ == '__main__':
    main()

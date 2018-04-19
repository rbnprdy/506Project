import mnist_loader
import numpy as np
import post_processing
import struct

def main():
    training_data, _, _ = mnist_loader.load_data_wrapper()

     # Setup Data
    pixels = training_data[0][0]*256

    noisy_data = post_processing.create_noisy_data(training_data, 80)
    noisy_pixels = noisy_data[0][0]*256

    generate_input_mem_x(pixels, 28)
    generate_input_mem_y(noisy_pixels, 28)

    SSIM(pixels, noisy_pixels, file_name="stats.txt")
    
def generate_input_mem_x(data, num_mems):

    for i in range(0, num_mems):
        f = open("row_{}.txt".format(i+1), "w+")
        it = 0
        if i == 0:
            for j in range(0, len(data)/num_mems):
                h = hex(data[j][0])
                if len(h) == 3:
                    f.write(h[0:2] + "0" + h[2:])
                else:
                    f.write(h)
                f.write("\n")
                it = it + 1
        else:
            for j in range(i*len(data)/num_mems, (i+1)*len(data)/num_mems):
                h = hex(data[j][0])
                if len(h) == 3:
                    f.write(h[0:2] + "0" + h[2:])
                else:
                    f.write(h)
                f.write("\n")
                it = it + 1
        print("Length of x memory file {}: {}".format(i+1, it))
        f.close()

def generate_input_mem_y(data, num_mems):

    m = mean(data)

    for i in range(0, num_mems):
        f = open("row_{}_noisy.txt".format(i+1), "w+")
        it = 0
        if i == 0:
            for j in range(0, len(data)/num_mems):
                d = data[j]
                f.write(str(float_to_hex(d[0] - m[0]))[0:10])
                f.write("\n")
                it = it + 1
        else:
            for j in range(i*len(data)/num_mems, (i+1)*len(data)/num_mems):
                d = data[j]
                f.write(str(float_to_hex(d[0] - m[0]))[0:10])
                f.write("\n")
                it = it + 1
        print("Length of y memory file {}: {}".format(i+1, it))
        f.close()

def SSIM(x, y, verbose = False, use_c = False, file_name=None):
    # Calculate Means
    mean_x = mean(x)
    mean_y = mean(y)
    
    # Calculate Stdevs
    stdev_x = dev(x, mean_x, output=True)
    stdev_y = dev(y, mean_y)
    
    # calculate covariance
    #cov_xy = np.cov(p)[0][1]
    cov_xy = cov(x, y, mean_x, mean_y)
    
    # calculate SSIM
    SSIM = l(mean_x, mean_y, use_c=use_c) * c(stdev_x, stdev_y, use_c=use_c) * s(cov_xy, stdev_x, stdev_y, use_c=use_c)
    #SSIM = SSIM / (100*100)

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

    if file_name:
        f = open(file_name, "w+")
        f.write("mean_normal: {}\n".format(mean_x))
        f.write("mean_noisy: {}\n".format(mean_y))
        f.write("standard_deviation_normal: {}\n".format(stdev_x))
        f.write("standard_deviation_noisy: {}\n".format(stdev_y))
        f.write("covaraince: {}\n".format(cov_xy))
        f.write("l: {}\n".format(l(mean_x, mean_y)))
        f.write("c: {}\n".format(c(stdev_x, stdev_y)))
        f.write("s: {}\n".format(s(cov_xy, stdev_x, stdev_y)))
        f.write("SSIM: {}\n".format(SSIM))
        f.write("\nNoisy mean in hex: {}\n".format(str(float_to_hex(mean_y))[0:10]))
        f.write("Noisy standard deviation in hex: {}\n".format(str(float_to_hex(stdev_y))[0:10]))

    return SSIM

def cov(x, y, u_x, u_y):
    

    f = open("covar.txt", "w+")
    total_sum = 0
    for i in range(0, 28):
        f.write("Summer {}\n".format(i))
        s = 0
        it = 0
        if i == 0:
            for j in range(0, 28):
                s = s + np.round((x[j] - u_x)*(y[j] - u_y))
                f.write("Time Step {}: x_val-u_x = {}. y_val = {}. Multiplier Fixed = {}. Partial Sum = {}\n".format(j, x[j]-u_x, y[j]-u_y, np.round((x[j] - u_x)*(y[j] - u_y)), s))
        else:
            for j in range(i*28, (i+1)*28):
                s = s + np.round((x[j] - u_x)*(y[j] - u_y))
                f.write("Time Step {}: x_val-u_x = {}. y_val = {}. Multiplier Fixed = {}. Partial Sum = {}\n".format(it, x[j]-u_x, y[j]-u_y, np.round((x[j] - u_x)*(y[j] - u_y)), s))
                it = it + 1
        total_sum = total_sum + s
        f.write("\n")

    f.write("Total Sum: {}\n".format(total_sum))
    f.write("Covar This way: {}\n".format(total_sum / (len(x) - 1)))
    f.write("Len(x) - 1 = {}\n".format(len(x)-1))

    sum = 0
    for i in range(0, len(x)):
        sum = sum + np.round((x[i]-u_x)*(y[i]-u_y))
    sum = sum / (len(x) - 1)

    f.write("Covar Old Way: {}\n".format(sum))
    f.close()
    return sum


def mean(x):
    sum = 0
    for i in range(0, len(x)):
        sum = sum + x[i]
    return sum / len(x)

def dev(x, u_x, output=False):

    if (not output):
        sum = 0
        for i in range(0, len(x)):
            sum = sum + np.round((x[i] - u_x)*(x[i] - u_x))
        sum = sum / (len(x) - 1)
        return np.sqrt(sum)
    
    else:
        f = open("stdev.txt", "w+")
        total_sum = 0
        for i in range(0, 28):
            f.write("Summer {}\n".format(i))
            s = 0
            it = 0
            if i == 0:
                for j in range(0, 28):
                    s = s + np.round((x[j] - u_x)*(x[j] - u_x))
                    f.write("Time Step {}: Multiplier Fixed = {}. Partial Sum = {}\n".format(j, np.round((x[j] - u_x)*(x[j] - u_x)), s))
            else:
                for j in range(i*28, (i+1)*28):
                    s = s + np.round((x[j] - u_x)*(x[j] - u_x))
                    f.write("Time Step {}: Multiplier Fixed = {}. Partial Sum = {}\n".format(it, np.round((x[j] - u_x)*(x[j] - u_x)), s))
                    it = it + 1
            total_sum = total_sum + s
            f.write("\n")

        f.write("Total Sum: {}\n".format(total_sum))
        f.write("St. Dv. Sqrd This way: {}\n".format(total_sum / (len(x) - 1)))
        f.write("St. Dv. This way: {}\n".format(np.sqrt(total_sum / (len(x) - 1))))
        f.write("Len(x) - 1 = {}\n".format(len(x)-1))

        sum = 0
        for i in range(0, len(x)):
            sum = sum + np.round((x[i] - u_x)*(x[i] - u_x))
        sum = sum / (len(x) - 1)

        f.write("St. Dv. Old Way: {}\n".format(np.sqrt(sum)))
        f.close()
        return np.sqrt(sum)

def l(u_x, u_y, use_c = False):
    c1 = 0
    if use_c:
        c1 = (0.0001*255)**2
    return ((2*u_x*u_y + c1)) / ((u_x**2 + u_y**2 + c1))

def c(s_x, s_y, use_c = False):
    c2 = 0
    if use_c:
        c2 = (0.0001*255)**2
    return ((2*s_x*s_y+c2)) / ((s_x**2 + s_y**2 + c2))

def s(s_xy, s_x, s_y, use_c = False):
    c3 = 0
    if use_c:
        c3 = int((0.0001*255)**2) / int(2)
    return (s_xy+c3) / (s_x*s_y + c3)

def float_to_hex(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])

def double_to_float(d):
    return float(struct.unpack("f", struct.pack("f", d))[0])

if __name__ == '__main__':
    main()

import mnist_loader
import numpy as np
import post_processing
import struct

def main():
    training_data, _, _ = mnist_loader.load_data_wrapper()

    # create averages
    count = [0] * 10
    running_average = [np.zeros((784, 1), dtype='float32')] * 10
    for i in training_data:
            label = np.argmax(i[1])
            count[label] = count[label] + 1
            running_average[label] = running_average[label] + i[0]

    for index, i in enumerate(count):
            running_average[index] = running_average[index] / count[index]
            running_average[index] = running_average[index] * 256

    # create noisy data    
    noisy_data = post_processing.create_noisy_data(training_data, 80)
    # this is a "5"
    noisy_pixels1 = noisy_data[0][0]*256
    clean_pixels1 = training_data[0][0]*256
    # this is a "0"
    noisy_pixels2 = noisy_data[1][0]*256
    clean_pixels2 = training_data[0][0]*256
    # this is a "4"
    noisy_pixels3 = noisy_data[3][0]*256
    clean_pixels3 = training_data[0][0]*256


    clean_images = [clean_pixels1, clean_pixels2, clean_pixels3]
    noisy_images = [noisy_pixels1, noisy_pixels2, noisy_pixels3]
    
    #generate_input_mem_x(noisy_images, 28)
    generate_input_mem_x(clean_images, 28)

    for i in range(0, 10):
        generate_input_mem_average(running_average[i], i, 28)

    SSIM(noisy_pixels1, running_average[5], file_name="stats_1.txt")
    SSIM(noisy_pixels2, running_average[0], file_name="stats_2.txt")
    SSIM(noisy_pixels3, running_average[4], file_name="stats_3.txt")
    
def generate_input_mem_x(images, num_mems):

    for i in range(0, num_mems):
        f = open("row_{}_x.txt".format(i+1), "w+")
        it = 0
        if i == 0:
            #added
            for image in images:
                for j in range(0, len(image)/num_mems):
                    h = hex(int(image[j][0]))
                    if len(h) == 3:
                        f.write(h[0:2] + "0" + h[2:])
                    else:
                        f.write(h)
                    f.write("\n")
                    it = it + 1
        else:
            #added
            for image in images:
                for j in range(i*len(image)/num_mems, (i+1)*len(image)/num_mems):
                    h = hex(int(image[j][0]))
                    if len(h) == 3:
                        f.write(h[0:2] + "0" + h[2:])
                    else:
                        f.write(h)
                    f.write("\n")
                    it = it + 1
        print("Length of x memory file {}: {}".format(i+1, it))
        f.close()

def generate_input_mem_average(data, num, num_mems):

    m = mean(data)

    for i in range(0, num_mems):
        f = open("row_{}_average_{}.txt".format(i+1, num), "w+")
        it = 0
        if i == 0:
            for j in range(0, len(data)/num_mems):
                d = data[j]
                f.write(str(float_to_hex(d[0] - m))[0:10])
                f.write("\n")
                it = it + 1
        else:
            for j in range(i*len(data)/num_mems, (i+1)*len(data)/num_mems):
                d = data[j]
                f.write(str(float_to_hex(d[0] - m))[0:10])
                f.write("\n")
                it = it + 1
        print("Length of average memory file {}: {}".format(i+1, it))
        f.close()

def SSIM(x, y, verbose = False, use_c = False, file_name=None):
    # Calculate Means
    mean_x = mean(x, output=True)
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
        print("\ny mean in hex: {}".format(str(float_to_hex(mean_y))[0:10]))
        print("y dev in hex: {}".format(str(float_to_hex(stdev_y))[0:10]))

    if file_name:
        f = open(file_name, "w+")
        f.write("mean_x: {}\n".format(mean_x))
        f.write("mean_y: {}\n".format(mean_y))
        f.write("standard_deviation_x: {}\n".format(stdev_x))
        f.write("standard_deviation_y: {}\n".format(stdev_y))
        f.write("covaraince: {}\n".format(cov_xy))
        f.write("l: {}\n".format(l(mean_x, mean_y)))
        f.write("c: {}\n".format(c(stdev_x, stdev_y)))
        f.write("s: {}\n".format(s(cov_xy, stdev_x, stdev_y)))
        f.write("SSIM: {}\n".format(SSIM))
        f.write("\ny mean in hex: {}\n".format(str(float_to_hex(mean_y))[0:10]))
        f.write("y standard deviation in hex: {}\n".format(str(float_to_hex(stdev_y))[0:10]))

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
                s = s + np.round((int(x[j]) - u_x)*(y[j] - u_y))
                f.write("Time Step {}: x = {}. x_val-u_x = {}. y_val = {}. Multiplier Fixed = {}. Partial Sum = {}\n".format(j, int(x[j]), int(x[j])-u_x, y[j]-u_y, np.round((int(x[j]) - u_x)*(y[j] - u_y)), s))
        else:
            for j in range(i*28, (i+1)*28):
                s = s + np.round((int(x[j]) - u_x)*(y[j] - u_y))
                f.write("Time Step {}: x = {}. x_val-u_x = {}. y_val = {}. Multiplier Fixed = {}. Partial Sum = {}\n".format(it, int(x[j]), int(x[j])-u_x, y[j]-u_y, np.round((int(x[j]) - u_x)*(y[j] - u_y)), s))
                it = it + 1
        total_sum = total_sum + s
        f.write("\n")

    f.write("Total Sum: {}\n".format(total_sum))
    f.write("Covar This way: {}\n".format(total_sum / (len(x) - 1)))
    f.write("Len(x) - 1 = {}\n".format(len(x)-1))

    sum = 0
    for i in range(0, len(x)):
        sum = sum + np.round((int(x[i])-u_x)*(y[i]-u_y))
    sum = sum / (len(x) - 1)

    f.write("Covar Old Way: {}\n".format(sum))
    f.close()
    return sum


def mean(x, output=False):
    if not output:
        sum = 0
        for i in range(0, len(x)):
            sum = sum + int(x[i])
        return sum / float(len(x))
    else:
        f = open("mean.txt", "w+")
        total_sum = 0
        for i in range(0, 28):
            f.write("Summer {}\n".format(i))
            s = 0
            it = 0
            if i == 0:
                for j in range(0, 28):
                    s = s + int(x[j])
                    f.write("Time Step {}: x = {}. Parital Sum = {}\n".format(j, int(x[j]), s))
            else:
                for j in range(i*28, (i+1)*28):
                    s = s + int(x[j])
                    f.write("Time Step {}: x = {}. Partial Sum = {}\n".format(it, int(x[j]), s))
                    it = it + 1
            total_sum = total_sum + s
            f.write("\n")

        f.write("\nTotal Sum: {}\n".format(total_sum))
        f.write("len(x): {}\n".format(len(x)))
        f.write("mean: {}\n".format(total_sum / float(len(x))))
        h = float_to_hex(total_sum / float(len(x)))
        f.write("hex mean: {}\n".format(h))
        h_cut = h[2:]
        f.write("hex cut: {}\n".format(h_cut))
        f_cut = struct.unpack('!f', h_cut.decode('hex'))[0]
        f.write("hex cut float: {}\n".format(f_cut))
        f.close()
        return float(f_cut)

def dev(x, u_x, output=False):

    if (not output):
        sum = 0
        for i in range(0, len(x)):
            sum = sum + np.round((int(x[i]) - u_x)*(int(x[i]) - u_x))
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
                    s = s + np.round((int(x[j]) - u_x)*(int(x[j]) - u_x))
                    f.write("Time Step {}: x = {}. u_x = {}. x - u_x = {}. Multiplier = {}. Multiplier Fixed = {}. Partial Sum = {}\n".format(j, int(x[j]), u_x, x[j] - u_x, (int(x[j])-u_x)*(int(x[j])-u_x), np.round((int(x[j]) - u_x)*(int(x[j]) - u_x)), s))
            else:
                for j in range(i*28, (i+1)*28):
                    s = s + np.round((int(x[j]) - u_x)*(int(x[j]) - u_x))
                    f.write("Time Step {}: x = {}. u_x = {}. x - u_x = {}. Multiplier = {}. Multiplier Fixed = {}. Partial Sum = {}\n".format(it, int(x[j]), u_x, x[j] - u_x, (int(x[j])-u_x)*(int(x[j])-u_x), np.round((int(x[j]) - u_x)*(int(x[j]) - u_x)), s))
                    it = it + 1
            total_sum = total_sum + s
            f.write("\n")

        f.write("Total Sum: {}\n".format(total_sum))
        f.write("St. Dv. Sqrd This way: {}\n".format(total_sum / (len(x) - 1)))
        f.write("St. Dv. This way: {}\n".format(np.sqrt(total_sum / (len(x) - 1))))
        f.write("Len(x) - 1 = {}\n".format(len(x)-1))

        sum = 0
        for i in range(0, len(x)):
            sum = sum + np.round((int(x[i]) - u_x)*(int(x[i]) - u_x))
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

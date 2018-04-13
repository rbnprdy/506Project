import mnist_loader

def main():
    training_data, _, _ = mnist_loader.load_data_wrapper()
   
    # Setup Data
    pixels = training_data[0][0]*256

    f = open("input.txt", "w+")

    for i in pixels:
        if len(hex(i[0])) == 3:
            f.write("0x0")
            f.write(hex(i[0])[2])
        else:
            f.write(hex(i[0]))
        f.write("\r\n")


if __name__ == '__main__':
    main()

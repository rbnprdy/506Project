

def float2fix_bin(a, W, F, twos_compliment=False):
	b = a * 2**F
	c = bin(int(round(b))).split('b')[1]
	n = len(c)
	
	if len(c) < W + F:
		for i in range(W-n):
			c = '0' + c
	else:
		print 'ERROR. FIXED POINT CONVERSION NOT COVERED. MUST FIX :('
		return 0

	if(not twos_compliment or a >= 0):
		return '0' + c[:W-F] + c[-F:]
	else:
		return bin_twos_comp('0' + c[:W-F] + c[-F:])


def float2fix_val(a, W, F):
	c = float2fix_bin(a, W, F)

	if a > 0:
		return int(c, 2) * 2**-F
	else:
		return -1 * int(c, 2) * 2**-F


def twos_comp(val, bits):
    if (val & (1 << (bits - 1))) != 0: # if sign bit is set e.g., 8bit: 128-255
        val = val - (1 << bits)        # compute negative value
    return val                         # return positive value as is


def bindigits(n, bits):
    s = bin(n & int("1"*bits, 2))[2:]
    return ("{0:0>%s}" % (bits)).format(s)


def bin_twos_comp(pos_val):
	neg_val = []
	for index, i in enumerate(pos_val):
		neg_val.append('{}'.format(int(i, 2) ^ 1))

	neg_val = ''.join(neg_val)
	return bin(int('0b' + neg_val, 2) + int('0b1', 2)).split('b')[1]

if __name__ == '__main__':
	print 'You are in fixed point. Welcome :)'



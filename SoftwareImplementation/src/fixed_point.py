

def float2fix_bin(a, W, F):
	b = a * 2**F
	c = bin(int(b + 0.5)).split('b')[1]
	n = len(c)
	
	if len(c) < W + F:
		for i in range(W-n):
			c = '0' + c
	else:
		print 'ERROR. FIXED POINT CONVERSION NOT COVERED. MUST FIX :('
		return 0


	return c[:W-F] + c[-F:]


def float2fix_val(a, W, F):
	c = float2fix_bin(a, W, F)

	if a > 0:
		return int(c, 2) * 2**-F
	else:
		return -1 * int(c, 2) * 2**-F


if __name__ == '__main__':
	print 'You are in fixed point. Welcome :)'



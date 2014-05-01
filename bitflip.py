'''

Clean and simple bitflipping script. Note this is not a a fuzzer. This script will perform bit-flip operation on all characters of input file.

Usage :
$python bitflip.py input.bin output.bin

'''

import sys

def int2binary(n, cnt=24):
    return "".join([str((n >> y) & 1) for y in range(cnt-1, -1, -1)])

inputfile = open(sys.argv[1],'rb')
outfile = open(sys.argv[2],'wb')

while True:
	byte = inputfile.read(1)
	if byte == "":
		break
	bits = int2binary(ord(byte),8)
	flipped = bits[::-1]
	outfile.write(chr(int(flipped,2)))
inputfile.close()
outfile.close()

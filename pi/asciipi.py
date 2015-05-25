#!/usr/bin/python
import binascii
n = open('file1', 'r').read().replace('\n', '')
print(binascii.unhexlify(n))


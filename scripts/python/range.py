#! /usr/bin/python

import sys
import os

if len(sys.argv) == 2:
    start = 0
    end = int(sys.argv[1])
    step = 1
elif len(sys.argv) == 3:
    start = int(sys.argv[1])
    end = int(sys.argv[2])
    step = 1
elif len(sys.argv) == 4:
    start = int(sys.argv[1])
    end = int(sys.argv[2])
    step = int(sys.argv[3])
else:
    raise Exception("Expected 1, 2 or 3 arguments, got %i" % (len(sys.argv)-1))

for ii in xrange(start, end, step):
    print ii

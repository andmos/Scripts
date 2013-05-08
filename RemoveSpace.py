#!/usr/bin/python

import os
import sys

files = os.listdir(sys.argv[1])
for f in files:
        os.rename(f, f.replace(' ', '.'))

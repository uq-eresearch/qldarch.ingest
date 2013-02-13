#!/usr/bin/python

from sys import argv,exit
import re

if len(argv) == 2:
    filename = argv[1]
    index = 1
elif len(argv) == 3:
    filename = argv[1]
    index = int(argv[2])
else:
    print "Usage: enumerate.py <filename> [startingindex]"
    exit(1)

triplepattern = re.compile("^<")
replacepattern = re.compile("REPLACEME")
with open(filename, 'r') as f:
    for line in f:
        if triplepattern.match(line) :
            print replacepattern.sub(str(index), line)
            index += 1
        else:
            print line

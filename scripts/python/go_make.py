#! /usr/bin/python

# parse .go files to automatically generate a GNUmakefile that knows
# the dependancies and everything.

import argparse
import os

def parse_imports(source_file):
    pass

if __name__ == "__main__":
    
    source_names = [source_name \
                    for source_name in os.listdir(os.getcwd()) \
                    if source_name.split(".")[-1] == "go" ]
    for source_name in source_names:
        with open(source_name) as source:
            pass
        

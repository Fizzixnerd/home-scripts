#! /usr/bin/env python

# reads a line interactively from the keyboard and print it to the stdout.

import sys

def main():
    """Read a line interactively from the keyboard and prints it to stdout."""
    prompt_string = ""
    for ii in range(1, len(sys.argv)):
        prompt_string += sys.argv[ii]
    output = raw_input(prompt_string)
    print output
    return 0

if __name__ == "__main__":
    exitcode = main()
    exit(exitcode)

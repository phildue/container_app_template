#!/usr/bin/python3
import argparse
import os
# Add args here
parser = argparse.ArgumentParser()
parser.add_argument('-a', '--argument1',
                    dest='arg1',
                    help='First argument',
                    default="1",
                    )
parser.add_argument('-b', '--argument2',
                    dest='arg2',
                    help='Second argument',
                    default="2",
                    )
args = parser.parse_args()

# Launch your application here
os.system("/usr/local/bin/app")

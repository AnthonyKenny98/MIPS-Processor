#!/usr/bin/env python
#
# Compares lines of two files
#
# Usage:
#    python compare.py file1 file2

import sys


def main():
    me, file1, file2 = sys.argv

    f1 = open(file1, "r")
    f2 = open(file2, "r")

    f1_lines = []
    f2_lines = []
    for line in f1:
        f1_lines.append(line)
    for line in f2:
        f2_lines.append(line)

    if (len(f1_lines) != len(f2_lines)):
        print("Files not same length")

    for i in range(min(len(f1_lines), len(f2_lines))):
        if f1_lines[i] != f2_lines[i]:
            print("ERROR: {} != {}".format(f1_lines[i], f2_lines[i]))


if __name__ == "__main__":
    main()

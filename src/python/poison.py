#!/usr/bin/env python3

import sys
import re

tainted = set([sys.argv[1]])

if __name__ == '__main__':
    for line in sys.stdin:
        line_split = re.split(r"\t+", line)
        txid, src, dec, value = line_split
        if src in tainted:
            tainted.add(dec)
            print("\t".join([txid, src, dec, value]),end="")
            sys.stdout.flush()

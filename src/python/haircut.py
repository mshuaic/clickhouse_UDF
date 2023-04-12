#!/usr/bin/env python3

import sys
import re
from collections import Counter
import traceback

if __name__ == '__main__':
    fd = open("/tmp/debug.log", "w")
    seed = sys.argv[1].lower()
    amount = int(sys.argv[2]) * 10**18
    tainted = Counter({seed: amount})
    # tainted_txs = []

    try:
        for line in sys.stdin:
            line_split = re.split(r"\t+", line.strip())
            blk, txindex, txid, src, dec, value, balance = line_split
            balance = int(balance)
            value = int(value)
            if src not in tainted.keys() or tainted[src] == 0 or balance == 0:
                continue

            # balance maybe less than tainted, because tx fee
            tainted[src] = min(balance, tainted[src])
            taint_amount = int(tainted[src] * value / balance)
            tainted[dec] += taint_amount
            tainted[src] -= taint_amount
            print("\t".join(map(str, [blk, txid, src, dec, value,
                                      balance, taint_amount, tainted[src]]))+"\n",end="")
            sys.stdout.flush()
    except Exception as e:
        traceback.print_exc(file=fd)
        fd.close()

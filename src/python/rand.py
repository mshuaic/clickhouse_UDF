#!/usr/bin/env python3

import sys
import re
from collections import Counter
import traceback
from scipy.stats import truncnorm

if __name__ == '__main__':
    fd = open("/tmp/debug.log", "w")
    seed = sys.argv[1].lower()
    amount = int(sys.argv[2]) * 10**18
    tainted = Counter({seed: amount})

    try:
        for line in sys.stdin:
            line_split = re.split(r"\t+", line.strip())
            blk, txindex, txid, src, des, value, balance = line_split
            balance = int(balance)
            value = int(value)
            if (src not in tainted.keys()
                or tainted[src] == 0
                or balance == 0
                or value == 0):
                continue

            tainted[src] = min(balance, tainted[src])
            a, b = 0, value
            mean = tainted[src] * value / balance
            std = 1
            lower_bound = (a - mean) / std
            upper_bound = (b - mean) / std

            # Define the truncated distribution
            trunc_dist = truncnorm(lower_bound, upper_bound, loc=mean, scale=std)
            taint_amount = int(trunc_dist.rvs())

            if taint_amount == 0:
                continue
            tainted[des] += taint_amount
            tainted[src] -= taint_amount
            if tainted[src] == 0:
                del tainted[src]

            print("\t".join(map(str, [blk, txindex, txid, src, des, value,
                                      balance, taint_amount,
                                      tainted[src], tainted[des]]))+"\n",end="")
            sys.stdout.flush()
    except Exception as e:
        open("/tmp/err.log", "w").write(f"""
        {mean=}
        {lower_bound=}
        {upper_bound=}
        {tainted[src]=}
        {balance=}
        {value=}
        {std=}""")
        traceback.print_exc(file=fd)
        fd.close()

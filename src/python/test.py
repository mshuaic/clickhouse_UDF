#!/usr/bin/env python3

from scipy.stats import truncnorm

if __name__ == '__main__':

    a = 50
    b = 150
    mean = 100
    std = 25
    lower_bound = (a - mean) / std
    upper_bound = (b - mean) / std
    n_simple = 10000

    # Define the truncated distribution
    trunc_dist = truncnorm(lower_bound, upper_bound, loc=mean, scale=std)
    # r = trunc_dist.rvs()
    result = [trunc_dist.rvs() for _ in range(n_simple)]
    print(result)
    assert all(map(lambda x: a<=x<=b, result))

    # taint_amount = int(min(value, trunc_dist.rvs()))

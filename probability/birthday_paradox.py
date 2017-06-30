#!/usr/bin/env python3
"""
    Birthday problem in probability and statistics:
        What is the probability for a group of people of size n
        of sharing the same birthday?
"""

from math import log, factorial
from math import e as E

def calculate_probability_not_same(n):
    numerator = factorial(365)
    denominator = factorial(365-n)
    log_prob_not_same = log(1) - log(365 ** n) + log(numerator)  \
                        - log(denominator)

    prob_not_same = E ** log_prob_not_same
    return prob_not_same


def main():
    prob_not_same = calculate_probability_not_same(23)
    print("Probability of 2 persons not sharing same birthday : {}".format(prob_not_same))
    print("Probability of 2 persons sharing same birthday : {}".format(1-prob_not_same))

if __name__ == "__main__":
    main()


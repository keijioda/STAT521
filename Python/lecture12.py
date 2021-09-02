
# STAT 521: Lecture 12

import scipy.stats as stats
import numpy as np

# Goodness-of-fit test
# Ho: A fair coin of p(head) = p(tail) = 0.5
coin = [40, 60]
expected = [50, 50]
stats.chisquare(coin, expected)

# Ho: a fair dice of p(i) =  1/6 for i = 1,2,...,6
dice = [18, 23, 15, 22, 17, 25]
expected = np.repeat(np.sum(dice) / len(dice), len(dice))
stats.chisquare(dice, expected)

# Test of independence or homogeneity
smoke = np.array([60, 40, 80, 70]).reshape([2, 2])
smoke

chisq, p, dof, expected = stats.chi2_contingency(smoke, correction = False)
print("Chi-square statistic:", chisq.round(3))
print("Chi-square p-value:", p.round(4))

income = np.array([45, 10, 5, 38, 40, 12, 17, 50, 33]).reshape(3, 3)
income

chisq, p, dof, expected = stats.chi2_contingency(income, correction = False)
print("Chi-square statistic:", chisq.round(3))
print("Chi-square p-value:",  "{:.2e}".format(p))

narco = np.array([21, 75, 19, 77]).reshape(2, 2)
chisq, p, dof, expected = stats.chi2_contingency(narco, correction = False)
print("Chi-square statistic:", chisq.round(3))
print("Chi-square p-value:",  p.round(4))

# Fisher's Exact test
ex = np.array([2, 9, 8, 7]).reshape(2, 2)
OR, p = stats.fisher_exact(ex)
print("Fisher's exact p-value:",  p.round(4))

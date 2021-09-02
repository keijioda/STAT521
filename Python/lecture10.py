
# STAT 521: Lecture 10

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import scipy.stats as stats
import numpy as np
import math
import pingouin as pg

# Example 2: Data
age = [20, 43, 63, 26, 53, 31, 58, 46, 59, 70]
SBP = [120, 128, 141, 126, 134, 129, 136, 132, 140, 144]
one = pd.DataFrame({"age": age, "SBP": SBP})

# Scatterplot with regression line using seaborn
sns.regplot(x = "age", y = "SBP", data = one)
plt.show()
plt.clf()

# Pearson correlation matrix
corr_matrix = one.corr()
corr_matrix

corr_matrix.at["age", "SBP"]

# correlation and p-value using scipy library
stats.pearsonr(one.age, one.SBP)

# Confidence interval for correlation
def r_to_z(r):
    return math.log((1 + r) / (1 - r)) / 2.0

def z_to_r(z):
    e = math.exp(2 * z)
    return((e - 1) / (e + 1))
  
def r_ci(r, n, alpha = 0.05):
    z = r_to_z(r)
    se = 1.0 / math.sqrt(n - 3)
    z_crit = stats.norm.ppf(1 - alpha / 2)
    lo = z - z_crit * se
    hi = z + z_crit * se
    return (z_to_r(lo), z_to_r(hi))
  
r_ci(corr_matrix.iat[0, 1], n = 10)

# Power analysis for correlation
pg.power_corr(r = 0.3, power = 0.8, n = None)

# Spearman rank correlation
one.corr(method = "spearman")

# Spearman correlation and p-value using scipy library
stats.spearmanr(one.age, one.SBP)

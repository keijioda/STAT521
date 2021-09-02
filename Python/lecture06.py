
# STAT 521: Lecture 6

import numpy as np
import matplotlib.pyplot as plt

# Sample size for estimating mean
from scipy.stats import norm

def samplesize_confint_mean(width, sd, alpha = .05):
  z = norm.ppf(1 - alpha / 2) 
  n = (z * sd / width) ** 2
  return(n.round(2))

samplesize_confint_mean(width = 2, sd = 15, alpha = .05)
samplesize_confint_mean(width = 5, sd = 20, alpha = .10)
samplesize_confint_mean(width = .2, sd = .6, alpha = .05)

# Sample size for estimating proportion
from statsmodels.stats.proportion import samplesize_confint_proportion

samplesize_confint_proportion(proportion = .75, half_length = .04, alpha = .10)
samplesize_confint_proportion(proportion = .50, half_length = .05, alpha = .05)

# Chi-square distribution
from scipy.stats import chi2

x = np.arange(0, 10, 0.01)
plt.plot(x, chi2.pdf(x, df = 1))
plt.ylim([0, .6])
plt.show()
plt.plot(x, chi2.pdf(x, df = 2))
plt.show()
plt.plot(x, chi2.pdf(x, df = 3))
plt.show()
plt.plot(x, chi2.pdf(x, df = 4))
plt.show()
plt.clf()

x = np.arange(0, 80, 0.1)
plt.plot(x, chi2.pdf(x, df = 10))
plt.ylim([0, .1])
plt.show()
plt.plot(x, chi2.pdf(x, df = 20))
plt.show()
plt.plot(x, chi2.pdf(x, df = 30))
plt.show()
plt.plot(x, chi2.pdf(x, df = 50))
plt.show()
plt.clf()

# Chi-square percentiles
chi2.ppf(.025, df=29)
chi2.ppf(.975, df=29)

# Confidence interval for variance
one = [74, 81, 70, 70, 74, 77, 76, 70, 71, 72]

# Function to construct CI for variance
def var_CI(data, alpha = 0.05):
  n = len(data)
  CI = (n - 1) * np.var(data, ddof = 1) / chi2.ppf([1 - alpha/2, alpha/2], df = n - 1)
  return(list(CI.round(3)))

# 95% CI for variance
var_CI(one)

# 99% CI for variance
var_CI(one, alpha = 0.01)

# F distribution
from scipy.stats import f

x = np.arange(0, 4, 0.01)
plt.plot(x, f.pdf(x, dfn = 10, dfd = 2))
plt.ylim([0, 1])
plt.show()
plt.plot(x, f.pdf(x, dfn = 10, dfd = 10))
plt.show()
plt.plot(x, f.pdf(x, dfn = 10, dfd = 20))
plt.show()
plt.plot(x, f.pdf(x, dfn = 10, dfd = 50))
plt.show()
plt.clf()

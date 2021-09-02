
# STAT 521: Lecture 5

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

from scipy.stats import t
from scipy.stats import norm

# Family of t-distributions with different df
x = np.arange(-4, 4, 0.01)
plt.plot(x, t.pdf(x, df = 2))
plt.show()

plt.plot(x, t.pdf(x, df = 5))
plt.show()

plt.plot(x, t.pdf(x, df = 30))
plt.show()
plt.clf()

# Comparison with the standard normal
plt.plot(x, norm.pdf(x))
plt.show()

plt.plot(x, t.pdf(x, df = 2))
plt.show()

plt.plot(x, t.pdf(x, df = 5)) 
plt.show()

plt.plot(x, t.pdf(x, df = 30))
plt.show()
plt.clf()

# Example 6: 95% confidence interval for mean
weight = [67.2, 93.8, 74.1, 64.8, 80.0, 55.9, 71.2, 60.2, 
          80.1, 88.6, 75.8, 66.0, 84.5, 49.1, 63.9, 68.8] 

# Using statmodels library
import statsmodels.stats.api as sms
sms.DescrStatsW(weight).tconfint_mean()

# Alternatively, using pingouin library
from pingouin import ttest
ttest(weight, 0)["CI95%"]

# Example 7: 99% CI for the difference of two means
m_diam = [12.70, 13.41, 11.95, 14.66, 12.22, 13.42, 12.40, 
          15.00, 11.72, 14.07, 13.74, 13.23]
        
f_diam = [11.17,  9.69, 11.59, 11.10, 11.97, 12.75, 9.81, 
          10.27, 10.67]

# Using statmodels library
cm = sms.CompareMeans(sms.DescrStatsW(m_diam), sms.DescrStatsW(f_diam))
cm.tconfint_diff(alpha = .01, usevar = "pooled")

# Alternatively, using pingouin library
ttest(m_diam, f_diam, correction = False, confidence = .99)["CI99%"]

# Example 9: 90% CI for proportion
# Using statmodels library
import statsmodels.stats.api as sms

# Specify count and sample size n
# Asymptotic CI
sms.proportion_confint(88, 125, alpha = .10, method = "normal")

# Wilson CI
sms.proportion_confint(88, 125, alpha = .10, method = "wilson")

# Exact CI
sms.proportion_confint(88, 125, alpha = .10, method = "beta")

# Example 10: 95% CI for the difference of two proportions 
from statsmodels.stats.proportion import confint_proportions_2indep
confint_proportions_2indep(40, 60, 16, 64, method = "wald", correction = False)

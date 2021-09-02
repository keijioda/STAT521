
# STAT 521: Lecture 7

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import scipy.stats as stats
import numpy as np

# One-sample t-test
head = [33.38, 32.15, 33.99, 34.10, 33.97,
        34.34, 33.95, 33.85, 34.23, 32.73,
        33.46, 34.13, 34.45, 34.19, 34.05]

# Some summary statistics
df = pd.DataFrame({"head": head})
df.describe()

# Check histogram and normal QQ plot
sns.displot(df)
plt.show()
plt.clf()

plt.figure(figsize = (4, 4))
stats.probplot(head, dist = "norm", plot = plt)
plt.show()
plt.clf()

# One-sample t-test against mu = 34.5
# Using pingouin library
from pingouin import ttest
ttest(head, 34.5).round(4)

# Alternatively, using scipy library
stats.ttest_1samp(head, 34.5)

# Power & sample size for one-sample
from statsmodels.stats.power import TTestPower

# Solving for sample size at power 80%
mean = 5
sd = 25

n_needed = TTestPower().solve_power(power = 0.8, alpha = .05, effect_size = mean/sd, alternative = "larger")
n_needed

# Solving for power at n = 130
power = TTestPower().solve_power(nobs = 130, alpha = .05, effect_size = mean/sd, alternative = "larger")
round(power, 3)

# Solving for sample size at power 90%, two-tailed
n_needed = TTestPower().solve_power(power = 0.9, alpha = .05, effect_size = mean/sd)
n_needed

# Power function
ss = np.array(range(150, 500))
es = np.array([mean/sd])
TTestPower().plot_power(nobs = ss, effect_size = es)
plt.grid(ls = '--')
plt.show()
plt.clf()

# Power function
ss = np.array(range(10, 600))
es = np.array([5/20, 5/25, 5/30, 8/20, 8/25, 8/30])
TTestPower().plot_power(nobs = ss, effect_size = es)
plt.ylim(0.7, 1.01)
plt.grid(ls = '--')
plt.show()
plt.clf()

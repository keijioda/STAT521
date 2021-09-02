
# STAT 521: Lecture 9

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import statsmodels.api as sm
import pingouin as pg
import scipy.stats as stats

# Example 1: Data
y = [25, 30, 35, 40, 40, 45, 50, 55,
     35, 40, 45, 50, 50, 55, 60, 65,
     45, 50, 55, 60, 60, 65, 70, 75]

one = pd.DataFrame({"group": np.repeat([1, 2, 3], 8), "y": y})

# Show group means 
one.groupby("group").describe()

# Boxplot
sns.boxplot(x = "group", y = "y", data = one)
plt.show()
plt.clf()

# One-way ANOVA
# Using pingouin library
aov = pg.anova(dv = "y", between = "group", data = one, detailed = True)
aov

# Bartlett test for homogeneity of variance
pg.homoscedasticity(dv = "y", group = "group", data = one, method = "bartlett")

# Using statmodels library
from statsmodels.formula.api import ols

model = ols("y ~ C(group)", data = one).fit()
aov_table = sm.stats.anova_lm(model)
aov_table

# Multiple comparisons by Tukey HSD
import statsmodels.stats.multicomp as mc

comp = mc.MultiComparison(one["y"], one["group"])
post_hoc_res = comp.tukeyhsd()
print(post_hoc_res)

# Plot means with 95% confidence interval by Tukey
post_hoc_res.plot_simultaneous(ylabel= "Group", xlabel= "y")
plt.show()

# Power analysis for one-way ANOVA (assumes balanced design)
n = 10
means = [12, 15, 18]
sd = 4

f = np.sqrt(np.sum((means - np.mean(means)) ** 2) / len(means) / sd ** 2)
eta = f ** 2 / (1 + f ** 2)

# Given power = 0.8, solve for n
pg.power_anova(eta = eta, k = 3, n = None, power = 0.8)

# Given n = 10, solve for power
pg.power_anova(eta = eta, k = 3, n = 10, power = None)

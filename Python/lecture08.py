
# STAT 521: Lecture 8

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import statsmodels.graphics.gofplots as sm 
import pingouin as pg
from scipy import stats

# Example 2: Data
fibro = np.repeat(["Healthy", "Fibrosis"], [9, 13])  
iron = [16.2, 21.2, 13.9, 27.9, 14.4, 22.9, 14.3, 26.8, 12.6, 17.0, 15.4, 
        12.0, 12.9,  3.8, 16.1, 14.2, 19.2, 22.4,  2.5,  4.8,  6.2,  8.2]
        
iron = pd.DataFrame({"fibro": fibro, "iron": iron})

# Box plot by group
sns.boxplot(x = "fibro", y = "iron", data = iron)
plt.show()
plt.clf()

# Descriptive stats by group
iron.groupby("fibro").describe().round(2)

# Check normality using normal QQ plot
g1 = iron.iron[fibro == "Healthy"]
g2 = iron.iron[fibro == "Fibrosis"]

fig, (ax1, ax2) = plt.subplots(1, 2)
fig.subplots_adjust(wspace=.5)
pg.qqplot(g1, dist = "norm", ax = ax1)
pg.qqplot(g2, dist = "norm", ax = ax2)
ax1.set_title("Healthy")
ax2.set_title("C.Fibrosis")
ax1.set_box_aspect(1)
ax2.set_box_aspect(1)
plt.show()
plt.clf()

# Two-sample t-test, equal variances
# Using pingouin library
pg.ttest(g1, g2, correction = False).round(4)

# Alternatively, using scipy library
stats.ttest_ind(g1, g2, equal_var = True)

# Equality of variance using Levene's test
stats.levene(g1, g2)

# Example 3: Data
subj = np.repeat(["Hyp", "Norm"], [15, 30])
stif = [16.82, 21.43, 12.82, 27.35, 14.57, 20.21, 15.18, 28.67, 11.30,
        23.41, 22.10, 19.38, 20.08, 12.17, 21.92,  9.69, 12.10, 12.11,
         6.17,  7.60,  8.38,  9.37, 10.08, 12.14, 11.25, 10.56,  9.97,
        11.65, 11.26,  7.84,  9.89, 11.62,  1.68, 12.20,  6.39,  9.53, 
        11.74, 11.32,  4.06, 12.37, 12.04,  9.56,  8.43,  4.86, 10.15]
aortic = pd.DataFrame({"subj": subj, "stif": stif})
aortic

# Boxplot by group
p = sns.boxplot(x = "subj", y = "stif", data = aortic)
p.set(xlabel = "Hyper/normo-tensive", ylabel = "Stiffness")
plt.show()
plt.clf()

# Descriptive stats by group
aortic.groupby("subj").describe()

# Check normality using normal QQ plot
g1 = aortic.stif[subj == "Hyp"]
g2 = aortic.stif[subj == "Norm"]

fig, (ax1, ax2) = plt.subplots(1, 2)
fig.subplots_adjust(wspace=.5)
pg.qqplot(g1, dist = "norm", ax = ax1)
pg.qqplot(g2, dist = "norm", ax = ax2)
ax1.set_title("Hypertensive")
ax2.set_title("Normotensive")
ax1.set_box_aspect(1)
ax2.set_box_aspect(1)
plt.show()
plt.clf()

# Two-sample t-test, unequal variances
# Using pingouin library
pg.ttest(g1, g2).round(4)

# Alternatively, using scipy library
stats.ttest_ind(g1, g2, equal_var = False)

# Equality of variance using Levene's test
stats.levene(g1, g2)

# Example 5: Data
CornFlake = [4.61, 6.42, 5.40, 4.54, 3.98, 3.82, 5.01, 
             4.34, 3.80, 4.56, 5.35, 3.89, 2.25, 4.24]
OatBran   = [3.84, 5.57, 5.85, 4.80, 3.68, 2.96, 4.41, 
             3.72, 3.49, 3.84, 5.26, 3.73, 1.84, 4.41]

# Paired t-test
# Using pingouin library
# Two-tailed p-vlaue
pg.ttest(CornFlake, OatBran, paired = True)

# Upper-tailed p-value
pg.ttest(CornFlake, OatBran, paired = True, tail = "greater").round(3)

# using scipy library
# Two-tailed p-value
stats.ttest_rel(CornFlake, OatBran)

# Upper-tailed p-value
stats.ttest_rel(CornFlake, OatBran, alternative = "greater")


# Power & sample size calculation for two-sample/paired problem
# Two-sample, unequal variance

# Using pingouin library
sd1 = 15
sd2 = 18
sd_pooled = np.sqrt((sd1 ** 2 + sd2 ** 2)/2)

pg.power_ttest(d = 10 / sd_pooled, n = None, power = 0.8, contrast = "two-samples")

# Two-sample, equal variance
pg.power_ttest(d = 10 / 17, n = None, power = 0.8, contrast = "two-samples")

# Two-sample, unbalanced case
sd1 = 17
sd2 = 17
k   =  2
sd_pooled = np.sqrt((sd1 ** 2 + sd2 ** 2 / k)/2)

n1 = pg.power_ttest(d = 10 / sd_pooled, n = None, power = 0.8, contrast = "two-samples")
n1 = round(n1)
n2 = n1 * k
print(n1, n2)

# Two-sample, unbalanced case, solve for power
pg.power_ttest2n(30, 60, d = 10 / 17, power = None)

# Paired case
rho = 0.5
sd1 = 40
sd2 = 32
sd_paired = np.sqrt(sd1 ** 2 + sd2 ** 2 - 2 * rho * sd1 * sd2)

pg.power_ttest(d = 20 / sd_paired, n = None, power = 0.8, contrast = "paired", tail = "greater")

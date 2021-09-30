
# STAT 521: Lecture 2

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Example 1: discrete prob distribution
x = list(range(5))
prob = [.06, .20, .30, .25, .19]
df = pd.DataFrame({"x": x, "prob": prob})
df

# Calculate x * p(x) and x ^ 2 * p(x)  
df = df.assign(xp = df.x * df.prob, x2p = df.x ** 2 * df.prob)
df

# Mean is the sum of x * p(x)
sum(df.xp)

# Variance: sum(x ^ 2 * prob) - mean ^ 2
sum(df.x2p) - sum(df.xp) ** 2

# Example 2: discrete prob distribution
x = list(range(6))
prob = [.031, .156, .313, .313, .156, .031]
df = pd.DataFrame({"x": x, "prob": prob})
df

# Calculate x * p(x) and x ^ 2 * p(x)  
df = df.assign(xp = df.x * df.prob, x2p = df.x ** 2 * df.prob)
df

# Mean is the sum of x * p(x)
sum(df.xp)

# Variance: sum(x ^ 2 * prob) - mean ^ 2
sum(df.x2p) - sum(df.xp) ** 2


# Binomial probabilities
# Set parameters
from scipy.stats import binom
n = 10
p = 0.4

x = list(range(n + 1))
pdf = binom.pmf(x, n, p)
cdf = binom.cdf(x, n, p)

df = pd.DataFrame({"x": x, "pdf": pdf, "cdf": cdf})
df

# Probability histogram of bin(n = 10, p = 0.4)
sns.barplot(x = x, y = pdf, data = df, color = "gray")
plt.show()
plt.clf()

# Normal approximation to binomial
# Function to plot bin(n, p)
def binom_plot(n, p, ax =  None):
  x = list(range(n + 1))
  pdf = binom.pmf(x, n, p)
  cdf = binom.cdf(x, n, p)
  df = pd.DataFrame({"x": x, "pdf": pdf, "cdf": cdf})
  sns.barplot(x = x, y = pdf, data = df, color = "gray", ax = ax)
  return

fig, ax = plt.subplots(2, 2)
fig.subplots_adjust(wspace=.3)
  binom_plot( 3, 0.5, ax = ax[0, 0])
  binom_plot( 5, 0.5, ax = ax[0, 1])
  binom_plot(10, 0.5, ax = ax[1, 0])
  binom_plot(30, 0.5, ax = ax[1, 1])
plt.show()
plt.clf()

# Poisson probabilities
from scipy.stats import poisson
mu = 3
xmax = 15

x = list(range(xmax + 1))
pdf = poisson.pmf(x, mu)
cdf = poisson.cdf(x, mu)

df = pd.DataFrame({"x": x, "pdf": pdf, "cdf": cdf})
df

# Probability histogram of Pois(lambda = 3)
sns.barplot(x = x, y = pdf, data = df, color = "gray")
plt.show()
plt.clf()

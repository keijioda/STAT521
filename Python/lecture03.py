
# STAT 521: Lecture 3

import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

# Normal distribution
x = np.arange(-5, 5, 0.01)
mu = 0
sd = 1  

plt.plot(x, norm.pdf(x, mu, sd))
plt.show()

# Change mu
mu = 1
plt.plot(x, norm.pdf(x, mu, sd))
plt.show()

mu = -1
plt.plot(x, norm.pdf(x, mu, sd))
plt.show()
plt.clf()

# Change sigma
mu = 0
plt.plot(x, norm.pdf(x, mu, sd))
plt.plot(x, norm.pdf(x, mu, 1.5))
plt.plot(x, norm.pdf(x, mu, 2.0))
plt.plot(x, norm.pdf(x, mu, 3.0))
plt.show()
plt.clf()

# CDF of N(0,1);
# Change the z-score as you wish;
z = 1.96
norm.cdf(z)

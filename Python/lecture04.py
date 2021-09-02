
# STAT 521: Lecture 4

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from random import sample

# Central limit theorem
# Set up a hypothetical population
population = np.random.exponential(20, 10 ** 4) + 20

# Population distribution
ax = sns.displot(population)
ax.fig.suptitle("Population distribution (hypothetical)")
plt.show()
plt.clf()

# Mean & SD of the population distribution
# Mean is around 40, SD is around 20
df = pd.DataFrame({"population": population})
df.describe()

# Take a random sample of n = 40
n = 40
samp1 = sample(list(population), n)
sns.displot(samp1)
plt.show()
plt.clf()

df = pd.DataFrame({"sample 1": samp1})
df.describe()

# Now take 1000 samples of n = 40
n_samples = 1000
df2 = pd.DataFrame(index = range(1, n + 1))

for i in range(1, n_samples + 1):
    sample_i = sample(list(population), n)
    col = f"sample {i}"
    df2[col] = sample_i

# ...and calculate a mean from each sample
sample_means = df2.mean()
sample_means.head(n = 10)

# Sampling distribution of means
ax = sns.displot(sample_means, kde = True)
ax.fig.suptitle("Sampling distribution of means")
plt.show()
plt.clf()

# Look at the mean & SD of sample means
# Mean should be around 40 and SD around 20/sqrt(40) = 3.16
sample_means.describe()

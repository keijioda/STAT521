
# STAT 521: Lecture 1

# Probability as long-run relative frequency
# Estimating p(Head) in a coin toss

import pandas as pd, numpy as np, matplotlib.pyplot as plt
from scipy.stats import binom 

# Define function
def lln(n = 1000, chains = 5, **kwargs):
  x = binom.rvs(1, 0.5, size = n * chains).reshape(n, chains)
  df = pd.DataFrame(x)
  pt = df.cumsum().div(list(np.arange(1, n + 1)), axis = 0)
  for chains in pt:
    plt.plot(pt[chains], **kwargs)
  plt.plot([0, n], [.5, .5], color = "red", ls = '--')
  plt.ylim(-0.05, 1.05)
  plt.title("Probability as long-run relative frequency")
  plt.xlabel("Trials")
  plt.ylabel("Probability: p(Head)")
  plt.show()
  return

# Run the function for 1 chain of 1000 trials
lln(chains = 1)
plt.clf()

# By default, it runs 1000 trials for each of 5 chains
lln()
plt.clf()

# 2000 trials, 10 chains
lln(n = 2000, chains = 10)
plt.clf()

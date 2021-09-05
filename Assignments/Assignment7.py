
# STAT 521: Assignment 7 

import numpy as np
import pandas as pd

# Problem 1: Birth weight of infants
wt = [8.56, 8.47, 6.39, 9.26, 7.98, 6.84, 7.87, 
      7.39, 8.64, 8.54, 5.37, 9.21, 6.63, 
      5.97, 6.77, 7.26, 5.74, 8.74, 6.30, 5.52, 
      7.03, 5.24, 6.14, 6.74, 6.62, 7.37, 4.94, 6.34]

labels = np.array(["1:ns", "2:ex", "3:<1/2", "4:>=1/2"])
smoke = np.repeat(labels, [7, 6, 7, 8])

# Create a data frame
prob1 = pd.DataFrame({"weight": wt, "smoking": smoke})
prob1


# STAT 521: Lecture 11

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import statsmodels.api as sm
import statsmodels.formula.api as smf
import numpy as np

# Example 1: Data
age = [20, 43, 63, 26, 53, 31, 58, 46, 59, 70]
SBP = [120, 128, 141, 126, 134, 129, 136, 132, 140, 144]
dat = pd.DataFrame({"age": age, "SBP": SBP})

# Scatterplot with regression line using seaborn
sns.regplot(x = "age", y = "SBP", data = dat)
plt.show()
plt.clf()

# Run simple regression using statmodels library
mod = smf.ols(formula = "SBP ~ age", data = dat).fit()
sm.stats.anova_lm(mod)
mod.summary()

# Matrix algebra to solve for betas
x1 = np.ones((dat.shape[0], 1))
x2 = np.array(dat["age"]).reshape(-1, 1)
x = np.concatenate((x1, x2), axis = 1)
y = np.array(dat["SBP"]).reshape(-1, 1)
beta = np.dot(np.linalg.inv(np.dot(x.T, x)), np.dot(x.T, y))
beta

# 95% CI for beta is shwon in the last 2 columnbs of the summary table
mod.summary()

# Prediction
pred = mod.get_prediction(dat.age).summary_frame()
pred.round(2)

# Prediction, its SE, and 95% confidence interval
pred[["mean", "mean_se", "mean_ci_lower", "mean_ci_upper"]].round(2)

# Prediction, its SE, and 95% prediction interval
pred[["mean", "mean_se", "obs_ci_lower", "obs_ci_upper"]].round(2)

# Residual plot against x
residuals = mod.resid
sns.scatterplot(x = mod.predict(), y = residuals)
plt.xlabel("Predicted value")
plt.ylabel("Residual")
plt.axhline(0, ls='--')
plt.show()
plt.clf()

# Normal probability plot of residuals
stats.probplot(residuals, dist = "norm", plot = plt)
plt.show()
plt.clf()

# Studentized residuals
stud_res = mod.outlier_test()["student_resid"]
stud_res

# Plot of studentized residuals against predicted
sns.scatterplot(x = mod.predict(), y = stud_res)
plt.xlabel("Predicted value")
plt.ylabel("Studentized residual")
plt.axhline(0, ls='--')
plt.show()
plt.clf()

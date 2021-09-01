
# STAT 521: Lecture 5

# Simulation of 95% confidence intervals
# Require TeachingDemos package -- install if necessary
# install.packages('TeachingDemos')
library(TeachingDemos)

# Generate 100 CIs for a *true* mu = 100
set.seed(135)
ci.examp(100, 15, 30, 100)

# Family of t-distributions with different df
xlim <- c(-4, 4)
ylim <- c(0, 0.5)
curve(dt(x, df =  2), col = "red", xlim = xlim, ylim = ylim, xlab = "t", ylab = "Density")
curve(dt(x, df =  5), col = "blue",  add = TRUE)
curve(dt(x, df = 30), col = "green",  add = TRUE)

# Comparison with the standard normal
curve(dnorm(x), col = "red", xlim = xlim, ylim = ylim, xlab = "", ylab = "Density", lwd = 2)
curve(dt(x, df =  2), col = "blue",  add = TRUE)
curve(dt(x, df =  5), col = "blue",  add = TRUE)
curve(dt(x, df = 30), col = "blue",  add = TRUE)

# Example 6: 95% confidence interval for mean
weight <- c(67.2, 93.8, 74.1, 64.8, 80.0, 55.9, 71.2, 60.2, 
            80.1, 88.6, 75.8, 66.0, 84.5, 49.1, 63.9, 68.8) 

t.test(weight, conf.level = .95) 

# Example 7: 99% CI for the difference of two means
gender <- c(rep(1, 12), rep(2, 9)) 
diam <- c(12.70, 13.41, 11.95, 14.66, 12.22, 13.42, 12.40, 
          15.00, 11.72, 14.07, 13.74, 13.23, 11.17,  9.69, 
          11.59, 11.10, 11.97, 12.75,  9.81, 10.27, 10.67) 

t.test(diam ~ gender, conf.level = .99, var.equal = TRUE)

# Example 9: 90% CI for proportion
# Requires binom package -- install if necessary
# install.packages("binom")
library(binom)

# Asymptotic CI
binom.confint(88, 125, conf.level = .90, method = "asymptotic")

# Wilson CI
binom.confint(88, 125, conf.level = .90, method = "wilson")

# Exact CI
binom.confint(88, 125, conf.level = .90, method = "exact")

# Example 10: 95% CI for the difference of two proportions 
drug <- matrix(c(40, 16, 20, 48), ncol = 2)
dimnames(drug) <- list(c('drug', 'placebo'), c('fav', 'unfav'))
drug

prop.test(drug, correct = FALSE)


# STAT 521: Lecture 9

# Require tidyverse packages
library(tidyverse)

# Data
y <- c(25, 30, 35, 40, 40, 45, 50, 55,
       35, 40, 45, 50, 50, 55, 60, 65,
       45, 50, 55, 60, 60, 65, 70, 75)

# Grouping variable must be factored
one <- data.frame(group = rep(1:3, each = 8), y = y) %>% 
  mutate(group = factor(group))

# Show group means using tidyverse packages
one %>% 
  group_by(group) %>% 
  summarise(n = n(), Mean = mean(y), SD = sd(y))

# Boxplot
one %>% 
  ggplot(aes(x = group, y = y, fill = group)) +
  geom_boxplot()

# One-way ANOVA
lm.out <- lm(y ~ group, data = one)
aov(lm.out) %>% summary()

# Bartlett test for homogeneity of variance
bartlett.test(y ~ group, data = one)

# CI for factor level means
# Require lsmeans package -- install if necessary
# install.packages('emmeans')
library(emmeans)

# LS means and its 95% CI
lsm <- emmeans(lm.out, "group")
emm_options(opt.digits = FALSE)
lsm

# Plot LS means
plot(lsm)

# Pairwise comparisons without adjustment
pairs(lsm, adjust = "none")

# Multiple comparisons
# using Tukey
aov(lm.out) %>% TukeyHSD()

# Alternatively,
pairs(lsm)

# using Bonferroni
pairs(lsm, adjust = "bon")

# Power analysis for one-way ANOVA
# Manually define power
oneway.power <- function(n, means, withinVar, alpha = 0.05){
  lambda <- n * crossprod(means - mean(means)) / withinVar
  df1   <- length(means) - 1
  df2   <- length(means) * (n - 1)
  cv    <- qf(1 - alpha, df1, df2)
  power <- 1 - pf(cv, df1, df2, lambda)
  return(data.frame(alpha = alpha, withinVar = withinVar, lambda = lambda, df1 = df1, df2 = df2, power = power))
}

oneway.power(n = 10, means = c(12, 15, 18), withinVar = 16)

# Solve backwards for sample size
oneway.ss <- function(means, withinVar, power = .80, alpha = 0.05){
  oneway.power <- function(n, means, withinVar){
    lambda <- n * crossprod(means - mean(means)) / withinVar
    df1   <- length(means) - 1
    df2   <- length(means) * (n - 1)
    cv    <- qf(1 - alpha, df1, df2)
    return(1 - pf(cv, df1, df2, lambda) - power)
  }
  n <- ceiling(uniroot(oneway.power, means, withinVar, interval = c(2, 100000))$root)
  return(data.frame(alpha = alpha, withinVar = withinVar, n = n))
}

oneway.ss(means = c(12, 15, 18), withinVar = 16, power = 0.8)

# Using R's power functions
group.means <- c(12, 15, 18)
power.anova.test(groups = 3, n = 10, between.var = var(group.means), within.var = 16)
power.anova.test(groups = 3, between.var = var(group.means), within.var = 16, power = 0.8)

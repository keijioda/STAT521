
# STAT 521: Lecture 11

# Require tidyverse packages
library(tidyverse)

# Data
age <- c( 20,  43,  63, 26,   53,  31,  58,  46,  59,  70)
SBP <- c(120, 128, 141, 126, 134, 129, 136, 132, 140, 144)
one <- data.frame(age = age, SBP = SBP)

# Simple regression
one.lm <- lm(SBP ~ age, data = one)
one.lm %>% anova()
one.lm %>% summary()

# Matrix algebra to solve for betas
x <- cbind(rep(1, length(age)), age)      # X matrix
y <- SBP                                  # Y vector
beta <- solve(t(x) %*% x) %*% t(x) %*% y  # Beta = inv(X'X)X'Y
beta

# 95% confidence intervals for betas
confint(one.lm)

# Confidence interval for Y given X
predict(one.lm, interval = "confidence")

# Prediction interval for Y given X
predict(one.lm, interval = "prediction")

# Diagnostic plot
par(mfrow = 1:2)
  plot(one.lm, which = 1:2)
par(mfrow = c(1, 1))

# Studentized residuals
# Require MASS package
library(MASS)
studres(one.lm)

plot(studres(one.lm) ~ predict(one.lm), xlab = "Predicted", ylab = "Studentized residual")
abline(h = 0, lty = 2, col = "blue")


# STAT 521: Lecture 10

# Require tidyverse packages
library(tidyverse)

# Data
age <- c( 20,  43,  63, 26,   53,  31,  58,  46,  59,  70)
SBP <- c(120, 128, 141, 126, 134, 129, 136, 132, 140, 144)
one <- data.frame(age = age, SBP = SBP)

# Scatterplot using ggplot
ggplot(one, aes(x = age, y = SBP)) + 
  geom_point() + 
  geom_smooth(method = "lm")

# Pearson correlation
one %>% summarize(r = cor(SBP, age))
one %>% cor.test(SBP, age, data = .)

# Random samples from Bivariate normal
par(mfrow = c(2, 4))
for (r in seq(-9, 9, by = 3) / 10) {
  Sigma <- matrix(c(1, r, r, 1), ncol = 2)
  sim <- MASS::mvrnorm(5000, mu = c(0, 0), Sigma = Sigma)
  plot(sim, pch = ".", col = "red", xlab = "x", ylab = "y", main = paste("Correlation r =", r))
}
par(mfrow = c(1, 1))

# Do this interactively
# Require tigerstats package -- install if necessary
# install.packages("tigerstats)

# Click the cog icon on the upper left corner of the plot and change the correlation
tigerstats::VaryCorrelation(n = 1000)

# 3d plot of the standard bivariate normal density
# Require mvtnorm package
library(mvtnorm)

# Specify the x- and y-axes
x <- y <- seq(-4, 4, by = .1)

# Make a grid, calculate density and generate a 3d plot
expand.grid(x, y) %>%
  as.matrix() %>% 
  dmvnorm() %>% 
  matrix(nrow = length(x)) %>%
  persp(col = "aquamarine", theta = 30, phi = 20, r = 50, expand = 0.5, 
        ltheta = 90, lphi = 180, shade = 0.5, axes = FALSE, box = FALSE)
title("Bivariate normal distribution")

# Power analysis for correlation
# Require pwr package -- install if necessary
# install.packages('pwr')
library(pwr)
pwr.r.test(r = 0.3, power = 0.8)

# Spearman rank correlation
one %>% summarize(r = cor(SBP, age, method = "spearman"))
one %>% cor.test(SBP, age, data = ., method = "spearman")

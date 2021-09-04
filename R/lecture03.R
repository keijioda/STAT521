
# STAT 521: Lecture 3

# Normal distribution
xlim <- c(-5, 5)
x <- seq(xlim[1], xlim[2], by = 0.01)
plot(dnorm(x) ~ x, xlim = xlim, type = "l", bty = "L", ylab = "Density")

# Changing mean, mu
lines(dnorm(x, mean = 1) ~ x, col = "red")
lines(dnorm(x, mean = -1) ~ x, col = "blue")

# Changing SD, sigma
plot(dnorm(x) ~ x, xlim = xlim, type = "l", bty = "L", ylab = "Density")
lines(dnorm(x, sd = 1.5) ~ x, col = "red")
lines(dnorm(x, sd = 2) ~ x, col = "blue")
lines(dnorm(x, sd = 3) ~ x, col = "purple")

# Do this interactively using Shiny app
# Require ABACUS package -- install if necessary
# install.packages("ABACUS")
# Run Shiny app
ABACUS::shiny_dnorm()

# CDF of N(0,1)
# Change the z-score as you wish
z <- 1.96
pnorm(z)

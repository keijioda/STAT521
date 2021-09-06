
# STAT 521: Lecture 3

# Require tigerstats package -- install if necessary
# install.packages("tigerstats")
library(tigerstats)

# Normal distribution
xlim <- c(-5, 5)
x <- seq(xlim[1], xlim[2], by = 0.01)
plot(dnorm(x) ~ x, xlim = xlim, type = "l", bty = "L", ylab = "Density")

# Area under the curve of the normal distribution
# Click the cog icon of the upper left corner of the plot
EmpRuleGC(mean = 0, sd = 1)

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

# Example 1: CDF of N(0,1)
# Change the z-score as you wish
z <- 1.96
pnorm(z)

# Example 2
pnorm(1.96) - pnorm(-1.96)

# Example 3
1 - pnorm(-0.5)

# Graph the area
pnormGC(-0.5, "above", graph = TRUE)

# Example 4
1 - pnorm(0.95) + pnorm(-1.25)
pnormGC(c(-1.25, 0.95), "outside", graph = TRUE)

# Example 5
1 - pnorm((130 - 120) / 10)
pnormGC(130, "above", mean = 120, sd = 10, graph = TRUE)

pnorm((140 - 120) / 10) - pnorm((110 - 120) / 10)
pnormGC(c(110, 140), "between", mean = 120, sd = 10, graph = TRUE)

1 - pnorm((150 - 120) / 10) + pnorm((110 - 120) / 10) 
pnormGC(c(110, 150), "outside", mean = 120, sd = 10, graph = TRUE)

# Example 6
1 - pnorm((150 - 132) / 15)
pnormGC(150, "above", mean = 132, sd = 15, graph = TRUE)

pnorm((100 - 132) / 15)
pnormGC(100, "below", mean = 132, sd = 15, graph = TRUE)

pnorm((145 - 132) / 15) - pnorm((105 - 132) / 15)
pnormGC(c(105, 145), "between", mean = 132, sd = 15, graph = TRUE)

# Example 7
1 - pnorm((4536 - 3250) / 550)
pnormGC(4536, "above", mean = 3250, sd = 550, graph = TRUE)

qnorm(0.025) * 550 + 3250
qnormGC(0.025, "below", mean = 3250, sd = 550, graph = TRUE)

qnorm(0.9) * 550 + 3250
qnormGC(0.1, "above", mean = 3250, sd = 550, graph = TRUE)

# Example 8
qnorm(0.10) * 10 + 120
qnormGC(0.10, "below", mean = 120, sd = 10, graph = TRUE)

qnorm(0.95) * 10 + 120
qnormGC(0.05, "above", mean = 120, sd = 10, graph = TRUE)

# Example 9
# Normal approximation
z <- (250 - 700 * 0.3) / sqrt(700 * 0.3 * 0.7)
1 - pnorm(z)

# Apply the continuity correction
z <- ((250 - 0.5) - 700 * 0.3) / sqrt(700 * 0.3 * 0.7)
1 - pnorm(z)

# Compare with the exact probability using Bin(700, 0.3)
sum(dbinom(250:700, 700, 0.3))

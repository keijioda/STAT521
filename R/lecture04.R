
# STAT 521: Lecture 4

# Central limit theorem
# Require MASS package
library(MASS)

# Set up a hypothetical population
# (using an exponential distribution)
population <- rexp(10 ^ 4, 1 / 20) + 20

# Population distribution
truehist(population)
title('Population distribution (hypothetical)')

# Mean & SD of the population distribution
# Mean is around 40, SD is around 20
describe <- function(x) c(Mean = mean(x), SD = sd(x))
describe(population)

# Take a random sample of n = 40
n <- 40
samp1 <- sample(population, n)
truehist(samp1)
describe(samp1)

# Now take 1000 samples of n = 40
# and calculate a mean each time
samp.mean <- rep(NA, 1000)
samp.mean[] <- sapply(samp.mean, function(x) mean(sample(population, n)))
samp.mean

# Sampling distribution of means
truehist(samp.mean, nbins = 30)
lines(density(samp.mean), col = 'red', lwd = 2)
title('Sampling distribution of means')

# Look at the mean & SD of sample means
# Mean should be around 40 and SD around 20/sqrt(40) = 3.16
describe(samp.mean)

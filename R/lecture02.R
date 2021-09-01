
# STAT 521: Lecture 2

# Binomial probabilities
# Set parameters
n <- 10
p <- 0.4
x <- 0:n

# Show PMF & CDF
data.frame(x = x, pdf = dbinom(x, n, p), cdf = pbinom(x, n, p))

# Probability histogram
barplot(dbinom(x, n, p), names.arg = x)

# Normal approximation to binomial
binom.plot <- function(n, p) {
  barplot(dbinom(0:n, n, p), names.arg = 0:n)
  title(paste('n = ', n))
}

par(mfrow = c(2, 2))
  binom.plot( 3, 0.5)
  binom.plot( 5, 0.5)
  binom.plot(10, 0.5)
  binom.plot(30, 0.5)
par(mfrow = c(1, 1))

# Poisson probabilities
# Mean
lambda <- 3

# Show PMF & CDF up to x = 15
x <- 0:15
data.frame(x = x, pdf = dpois(x, lambda), cdf = ppois(x, lambda))

# Poisson Probability histogram
barplot(dpois(x, lambda), names.arg = x)

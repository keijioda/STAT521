
# STAT 521: Lecture 6

# Sample size for estimating mean
Sample.Size.For.Estimating.Mean <- function (alpha, SD, width) {
  z <- qnorm(1- alpha / 2) 
  n <- (z * SD / width) ^ 2
  return(n) 
}

Sample.Size.For.Estimating.Mean(alpha = .05, SD = 15, width = 2)
Sample.Size.For.Estimating.Mean(alpha = .10, SD = 20, width = 5)
Sample.Size.For.Estimating.Mean(alpha = .05, SD = .6, width = .2)

# Sample size for estimating proportion
Sample.Size.For.Estimating.Prop <- function (alpha, prop, width) {
  z <- qnorm(1- alpha / 2) 
  n <- (z / width) ^ 2 * prop * (1 - prop)
  return(n) 
}

Sample.Size.For.Estimating.Prop(alpha = .10, prop = .75, width = .04)
Sample.Size.For.Estimating.Prop(alpha = .05, prop = .50, width = .05)

# Chi-square distribution
curve(dchisq(x, df = 1), bty = "L", xlim = c(0, 10))
curve(dchisq(x, df = 2), add = TRUE, col = "red")
curve(dchisq(x, df = 3), add = TRUE, col = "blue")
curve(dchisq(x, df = 4), add = TRUE, col = "purple")

curve(dchisq(x, df = 10), bty = "L", xlim = c(0, 100))
curve(dchisq(x, df = 20), add = TRUE, col = "red")
curve(dchisq(x, df = 30), add = TRUE, col = "blue")
curve(dchisq(x, df = 50), add = TRUE, col = "purple")

# Chi-square percentiles
qchisq(.025, df = 29)
qchisq(.975, df = 29)

# Confidence interval for variance
one <- c(74, 81, 70, 70, 74, 77, 76, 70, 71, 72)

# Function to construct CI for variance
var.CI <- function(data, alpha = 0.05) {
  n <- length(data)
  CI <- (n - 1) * var(data) / qchisq(c(1 - alpha / 2, alpha / 2), n - 1)
  cat('\nSample variance:', var(data), '\n')
  cat(100 * (1 - alpha), '% confidence interval for variance: ')
  cat('(', CI[1], ',', CI[2], ')\n\n')
}

# 95% CI for variance
var.CI(one)

# 99% CI for variance
var.CI(one, alpha = 0.01)

# F distribution
curve(df(x, df1 = 10, df2 = 2), bty = "L", xlim = c(0, 6), ylim = c(0, 1), xlab = "F", ylab = "Density")
curve(df(x, df1 = 10, df2 = 10), add = TRUE, col = "red")
curve(df(x, df1 = 10, df2 = 20), add = TRUE, col = "blue")
curve(df(x, df1 = 10, df2 = 50), add = TRUE, col = "purple")

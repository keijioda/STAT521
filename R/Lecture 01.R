
# STAT 521: Lecture 1

# Probability as long-run relative frequency
# Estimating p(Head) in a coin toss

# Define function
lln <- function(n = 1000, chains = 5){
  df <- data.frame(matrix(NA, nrow = n, ncol = chains))
  df[] <- lapply(df, function(x) cumsum(rbinom(n, 1, 0.5)) / (1:n))
  plot(df[, 1], type = "n", ylim = c(0,1), 
       xlab = "Trial", ylab = "Probability: p(Head)",
       main = "Probability as long-run relative frequency")
  invisible(lapply(df, lines, col = "gray"))
  abline(h = 0.5, lty = 2, col = "red")
}

# Run the function for 1 chain of 1000 trials
lln(chains = 1)

# By default, it runs 1000 trials for each of 5 chains
lln()

# 2000 trials, 10 chains
lln(n = 2000, chains = 10)

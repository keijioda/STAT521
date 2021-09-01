
# STAT 521: Lecture 12

# Goodness-of-fit test
# Ho: A fair coin of p(head) = p(tail) = 0.5
coin <- c(40, 60)
chisq.test(coin, p = c(0.5, 0.5))

# Ho: a fair dice of p(i) =  1/6 for i = 1,2,...,6
dice <- c(18, 23, 15, 22, 17, 25)
chisq.test(dice, p = rep(1/6, 6))

# Test of independence or homogeneity
smoke <- matrix(c(60, 40, 80, 70), ncol = 2, byrow = TRUE)
smoke

# Without continuity correction
chisq.test(smoke, correct = FALSE)

# With continuity correction
chisq.test(smoke)

income <- matrix(c(45, 10, 5, 38, 40, 12, 17, 50, 33), ncol = 3, byrow = TRUE)
chisq.test(income, correct = FALSE)

narco <- matrix(c(21, 75, 19, 77), ncol = 2, byrow = TRUE)
chisq.test(narco, correct = FALSE)

# Fisher's Exact test
ex <- matrix(c(2, 9, 8, 7), ncol = 2, byrow = TRUE)
fisher.test(ex)

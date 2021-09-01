
# STAT 521: Lecture 7

# One-sample t-test
head <- c(33.38, 32.15, 33.99, 34.10, 33.97,
          34.34, 33.95, 33.85, 34.23, 32.73,
          33.46, 34.13, 34.45, 34.19, 34.05)

# Some summary statistics
meansd <- function(x) c(n = sum(!is.na(x)), mean = mean(x), sd = sd(x))
meansd(head)

# Check histogram and normal QQ plot
hist(head)
qqnorm(head); qqline(head)

# One-sample t-test against mu = 34.5
t.test(head, mu = 34.5)

# Power & sample size for one-sample case
# Solving for sample size at power 80%
power.t.test(power = 0.8, delta = 5, sd = 25, type = 'one.sample', alternative = 'one.sided')

# Solving for power at n = 130
power.t.test(n = 130, delta = 5, sd = 25, type = 'one.sample', alternative = 'one.sided')

# Solving for sample size at power 90%, two-tailed
power.t.test(power = 0.9, delta = 5, sd = 25, type = 'one.sample')

# Power function
# Range of power
power <- seq(0.7, 0.99, by = 0.01)
out   <- expand.grid(power = power, delta = c(5, 8), sd = 5 * (4:6))

# Function to calculate sample size
func.pow <- function(power, delta, sd) {
  power.t.test(power = power, delta = delta, sd = sd, type = "one.sample")$n
}

# Plot power curve using ggplot
library(tidyverse)
out %>% 
  mutate(n = pmap_dbl(list(power, delta, sd), func.pow),
         delta = factor(delta), 
         sd = factor(sd)) %>%
  ggplot(aes(x = n, y = power, color = delta, shape = sd, group = interaction(delta, sd))) +
  geom_point() + geom_line() +
  labs(x = "Sample size", y = "Power")

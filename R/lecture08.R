
# STAT 521: Lecture 8

# Require tidyverse packages
library(tidyverse)

# Data
fibro <- c(rep(0, 9), rep(1, 13))  
iron <- c(16.2, 21.2, 13.9, 27.9, 14.4, 22.9, 14.3, 26.8, 12.6, 17.0, 15.4, 
          12.0, 12.9,  3.8, 16.1, 14.2, 19.2, 22.4,  2.5,  4.8,  6.2,  8.2)
iron <- data.frame(fibro = fibro, iron = iron)

# Factor group
iron <- iron %>% 
  mutate(fibro = factor(fibro, labels = c("Healthy", "C.Fibrosis")))

# Box plot by group
iron %>% 
  ggplot(aes(x = fibro, y = iron, fill = fibro)) +
  geom_boxplot() +
  labs(y = "Serum iron")

# Descriptive stats by group
iron %>% 
  group_by(fibro) %>% 
  summarise(n = n(), Mean = mean(iron), SD = sd(iron))

# Check normality using normal QQ plot
iron %>% 
  ggplot(aes(sample = iron, color = fibro)) + 
  stat_qq() +
  stat_qq_line() +
  facet_grid(~ fibro)

# Two-sample t-test, equal variances
t.test(iron ~ fibro, data = iron, var.equal = TRUE)

# Equality of variance test
var.test(iron ~ fibro, data = iron)

# Data
subj <- c(rep("Hyp", 15), rep("Norm", 30))
stif <- c(16.82, 21.43, 12.82, 27.35, 14.57, 20.21, 15.18, 28.67, 11.30,
          23.41, 22.10, 19.38, 20.08, 12.17, 21.92,  9.69, 12.10, 12.11,
          6.17,  7.60,  8.38,  9.37, 10.08, 12.14, 11.25, 10.56,  9.97,
          11.65, 11.26,  7.84,  9.89, 11.62,  1.68, 12.20,  6.39,  9.53, 
          11.74, 11.32,  4.06, 12.37, 12.04,  9.56,  8.43,  4.86, 10.15)
aortic <- data.frame(subj = subj, stif = stif)
aortic

# Boxplot by group
aortic %>% 
  ggplot(aes(x = subj, y = stif, fill = subj)) + 
  geom_boxplot() +
  labs(y = "Stiffness")

# Descriptive stats by group
aortic %>% 
  group_by(subj) %>% 
  summarise(n = n(), Mean = mean(stif), SD = sd(stif))

# Check normality using normal QQ plot
aortic %>% 
  ggplot(aes(sample = stif, color = subj)) +
  stat_qq() + stat_qq_line() + facet_grid(~ subj)

# Two-sample t-test, unequal variances
t.test(stif ~ subj, data = aortic, var.equal = F)

# Equality of variance test
var.test(stif ~ subj, data = aortic)

# Data
CornFlake <- c(4.61, 6.42, 5.40, 4.54, 3.98, 3.82, 5.01, 
               4.34, 3.80, 4.56, 5.35, 3.89, 2.25, 4.24)
OatBran   <- c(3.84, 5.57, 5.85, 4.80, 3.68, 2.96, 4.41, 
               3.72, 3.49, 3.84, 5.26, 3.73, 1.84, 4.41)

# Paired t-test
t.test(CornFlake, OatBran, paired = TRUE)

# Upper-tailed p-value
t.test(CornFlake, OatBran, paired = TRUE, alternative = 'greater')

# Power & sample size calculation for two-sample/paired problem
# Two-sample, unequal variance
sd1 <- 15
sd2 <- 18
sd.pooled <- sqrt((sd1 ^ 2 + sd2 ^ 2) / 2)
power.t.test(delta = 10, sd = sd.pooled, power = 0.8)

# Two-sample, equal variance
power.t.test(delta = 10, sd = 17, power = 0.8)

# Two-sample, unbalanced case
sd1 <- 17
sd2 <- 17
k   <-  2
sd.pooled <- sqrt((sd1 ^ 2 + sd2 ^ 2 / k) / 2)
power.t.test(delta = 10, sd = sd.pooled, power = 0.8)

# Paired case
rho <- 0.5
sd1 <- 40
sd2 <- 32
sd.paired <- sqrt(sd1 ^ 2 + sd2 ^2 - 2 * rho * sd1 * sd2)
power.t.test(delta = 20, sd = sd.paired, power = 0.8, type = 'paired', alternative = 'one.sided')

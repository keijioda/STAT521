
# STAT 521: Assignment 7 

# Problem 1: Birth weight of infants
wt <- c(8.56, 8.47, 6.39, 9.26, 7.98, 6.84, 7.87, 
        7.39, 8.64, 8.54, 5.37, 9.21, 6.63, 
        5.97, 6.77, 7.26, 5.74, 8.74, 6.30, 5.52, 
        7.03, 5.24, 6.14, 6.74, 6.62, 7.37, 4.94, 6.34)

smoke <- c(rep("1:ns", 7), rep("2:ex", 6), rep("3:<1/2", 7), rep("4:>=1/2", 8))

# Create a data frame
prob1 <- data.frame(weight = wt, smoking = smoke)

# Grouping variable must be factored
prob1$smoking <- factor(prob1$smoking)
prob1

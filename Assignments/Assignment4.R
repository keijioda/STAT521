
# STAT 521: Assignment 4

# Problem 1: data
pulse <- c(54, 63, 88, 72, 49, 92, 70, 73, 69, 101, 48, 66, 80, 64, 77, 83, 91)


# Problem 2: set up data
# Read lowbwt data from a website (require internet connection)
url <- "http://openwetware.org/images/8/8c/Lowbwt.txt"
lowbwt <- read.table(url, skip=2)

# Assign variable names
names(lowbwt) <- c("sbp", "sex", "tox", "grmhem", "gestage", "apgar5")

# Take a look
lowbwt

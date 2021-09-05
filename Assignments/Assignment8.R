
# STAT 521: Assignment 8

# Read data from Website
url <- "http://www.stat.ufl.edu/~rrandles/sta4210/Rclassnotes/data/textdatasets/KutnerData/Chapter%20%201%20Data%20Sets/CH01PR27.txt"
muscle <- read.table(url, col.names = c("mass", "age"))
muscle

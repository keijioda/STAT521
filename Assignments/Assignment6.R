
# STAT 521: Assignment 6

# Require tidyverse packages -- install if necessary
# install.packages("tidyverse")
library(tidyverse)
library(magrittr)

# Download a data zip file from Website
url <- "http://higheredbcs.wiley.com/legacy/college/daniel/1118302796/data_sets/csv/ch07_all.zip"

temp <- tempfile() %T>%
  download.file(url, .)

# Unzip file and read the data for Problem 2
prob2 <- read_csv(unz(temp, "REV_C07_22.csv"), col_names = TRUE)

# See the data
prob2


# Read the data for Problem 4
prob4 <- read_csv(unz(temp, "EXR_C07_S04_02.csv"), col_names = TRUE)
unlink(temp)

# See the data
prob4

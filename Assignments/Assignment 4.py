
# STAT 521: Assignment 4

import pandas as pd

# Problem 1: data
pulse = [54, 63, 88, 72, 49, 92, 70, 73, 69, 101, 48, 66, 80, 64, 77, 83, 91]
data = pd.DataFrame({"pulse": pulse})

# Problem 2: set up data
# Read lowbwt data from a website (require internet connection)
url = "http://openwetware.org/images/8/8c/Lowbwt.txt"
lowbwt = pd.read_table(url, skiprows = 2, header = None, delim_whitespace = True)
lowbwt.columns = ["sbp", "sex", "tox", "grmhem", "gestage", "apgar5"]

# Take a look
lowbwt

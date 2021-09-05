
# STAT 521: Assignment 6

import requests, zipfile, io
import pandas as pd

# Download a data zip file from URL and save it to "Download" folder
url = "http://higheredbcs.wiley.com/legacy/college/daniel/1118302796/data_sets/csv/ch07_all.zip"

# Make sure to change the file destination below
out = "C:/Users/Keiji/Downloads/temp.zip"

r = requests.get(url)
zf = zipfile.ZipFile(io.BytesIO(r.content))
zf.extractall(out)

# Unzip file and read the data for Problem 2
prob2 = pd.read_csv(zf.open('REV_C07_22.csv'))

# Check data
prob2

# Read the data for Problem 4
prob4 = pd.read_csv(zf.open('EXR_C07_S04_02.csv'))

# Check data
prob4

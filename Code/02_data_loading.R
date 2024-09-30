# Loading datasets for the project on Ebola and Scabies data

# Load necessary packages
library(tidyverse)

# Load Scabies dataset
scabies <- read.csv(file = "S1-Dataset_CSV.csv", header = TRUE, sep = ",")
# View(scabies) # Uncomment to inspect the dataset

# Load Ebola dataset
ebola <- read.csv(file = "mmc1.txt", header = TRUE, sep = ",")

# View(ebola) # Uncomment to inspect the dataset


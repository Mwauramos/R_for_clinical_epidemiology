# This script handles data cleaning and manipulation for the Ebola and Scabies datasets

# Load necessary packages
library(tidyverse)
library(finalfit)

# Load datasets
scabies <- read.csv(file = "S1-Dataset_CSV.csv", header = TRUE, sep = ",")
ebola <- read.csv(file = "mmc1.txt", header = TRUE, sep = ",")

# Data Cleaning and Manipulation

## 1. Discard unwanted variables from the Scabies dataset
scabies <- select(scabies, -scabies_distribution_region, -scabieslesions_number_range, -impetigolesions_number_range)

## 2. Discard unwanted rows from the Ebola dataset to create a subset
ebola_men <- filter(ebola, sex == "male")

## 3. Convert continuous variables into categorical variables
scabies$agegroups <- as.factor(cut(scabies$age, c(0,10,20,Inf), labels = c("0-10","11-20","21+"), include.lowest = TRUE))
scabies$house_cat <- as.factor(cut(scabies$house_inhabitants, c(0,5,10,Inf), labels = c("0-5","6-10","10+"), include.lowest = TRUE))

## 4. Convert categorical variables into numeric variables
# Check for non-numeric values in the status column
unique(ebola$status)  # Inspect unique values in status column

# Convert to numeric after ensuring only numeric values or NAs
ebola$status <- as.numeric(as.character(ebola$status))

## 5. Recode categorical variables
ebola$transmission <- recode(ebola$transmission, syringe = "needle")

## 6. Set baseline groups for categorical variables
scabies$house_cat <- relevel(scabies$house_cat, ref = "0-5")
scabies$agegroups <- relevel(scabies$agegroups, ref = "21+")
# Ensure transmission is a factor before releveling
ebola$transmission <- factor(ebola$transmission)
ebola$transmission <- relevel(ebola$transmission, ref = "person_to_person")

## 7. Work with dates by converting character strings to date format
ebola$disease_onset <- as.Date(ebola$disease_onset, format = "%Y-%m-%d")
ebola$disease_ended <- as.Date(ebola$disease_ended, format = "%Y-%m-%d")

## 8. Reshape datasets if necessary
# Example: Wide to long transformation
# df2 <- gather(df, test, score, A:B)

# Example: Long to wide transformation
# df3 <- spread(df2, test, score)

## 9. Generate sequence numbers by groups
# Example: Generate sequence numbers for grouping variables
# dataset$n <- ave(1:length(dataset$grouping_var), dataset$grouping_var, FUN = seq_along)

## 10. Expand datasets by replicating rows based on count
# Example: Expand rows based on a count column
# dt3 <- expandRows(dt, 2)

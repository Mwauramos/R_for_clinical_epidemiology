# Load necessary packages
library(finalfit)
library(epiR)

# Ensure 'scabies_infestation' and 'impetigo_active' are factors
scabies$scabies_infestation <- as.factor(scabies$scabies_infestation)
scabies$impetigo_active <- as.factor(scabies$impetigo_active)

# Using stat.table:

# Summary statistics by gender
stat.table(gender, mean(age), data = scabies)
# Outputs: Mean age by gender

# Summary statistics by gender including median
stat.table(gender, list(mean(age), median(age)), data = scabies)
# Outputs: Mean and median age by gender

# Using tableby:

# Summary statistics by gender
summary_data <- tableby(gender ~ age + scabies_infestation, data = scabies)
summary(summary_data)
# Outputs: Mean, SD, IQR, and range for numeric variables; count and % for categorical variables

# T-test to compare mean age between male and female
t.test(scabies$age[scabies$gender == "male"], scabies$age[scabies$gender == "female"])
# Outputs: t statistic, degrees of freedom, p-value, confidence interval

# Confidence intervals for proportions
prop.test(x = 179, n = 366)
# Outputs: Proportion, confidence interval, and p-value

# Cross-tabulation of impetigo and scabies infestation
table(scabies$impetigo_active, scabies$scabies_infestation)
# Outputs: Frequency table

# Use epi.2by2 for chi-square and odds ratio calculations

# Relevel the factors to ensure correct order for epi.2by2
scabies$scabies_infestation <- relevel(scabies$scabies_infestation, ref = "yes")
scabies$impetigo_active <- relevel(scabies$impetigo_active, ref = "yes")

# Create a table with the correct order
table_data <- table(scabies$scabies_infestation, scabies$impetigo_active)

# Calculate chi-square and odds ratios
epi_results <- epi.2by2(table_data)
print(epi_results)

# Stratified analysis by gender
stratum <- epi.2by2(table(scabies$scabies_infestation, scabies$impetigo_active, scabies$gender))
print(stratum)

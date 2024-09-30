# 7.1 Load Required Libraries
library(broom)   # For tidy model output
library(dplyr)   # For data manipulation
library(lmtest)  # For likelihood ratio test

# 7.2 Load the Scabies Dataset
scabies <- read.csv(file = "S1-Dataset_CSV.csv", header = TRUE, sep = ",")

# 7.3 Recode scabies_infestation to Binary (0 and 1)
scabies$scabies_infestation <- ifelse(scabies$scabies_infestation == "yes", 1, 0)

# 7.4 Categorize the Age Variable into Three Groups: 0-10, 11-20, 21+
scabies$agegroups <- as.factor(cut(scabies$age, c(0, 10, 20, Inf), 
                                   labels = c("0-10", "11-20", "21+")))

# 7.5 Set the Baseline for Agegroups as '21+'
scabies$agegroups <- relevel(scabies$agegroups, ref = "21+")

# 7.6 Categorize Household Size into Three Groups: 0-5 inhabitants, 6-10 inhabitants, 10+ inhabitants
scabies$house_cat <- as.factor(cut(scabies$house_inhabitants, c(0, 5, 10, Inf), 
                                   labels = c("0-5", "6-10", "10+")))

# 7.7 Set the Baseline for Household Size as '0-5'
scabies$house_cat <- relevel(scabies$house_cat, ref = "0-5")

# 7.8 Handle Missing Data
# Option 1: Remove Rows with Missing Data
scabies <- na.omit(scabies)

# Option 2: Impute Missing Data (Example: using the median for numeric variables)
scabies$age <- ifelse(is.na(scabies$age), median(scabies$age, na.rm = TRUE), scabies$age)

# 7.9 Fit the Logistic Regression Model to Investigate the Association Between Household Size and Scabies Risk
scabiesrisk <- glm(scabies_infestation ~ factor(agegroups) + factor(gender) + factor(house_cat),
                   data = scabies, family = binomial())

# 7.10 Check for Warnings
warnings()

# 7.11 Summarize the Model to Inspect the Output
summary(scabiesrisk)

# 7.12 Calculate Odds Ratios (ORs) and Confidence Intervals (CIs)
scabiesrisk_OR <- exp(cbind(OR = coef(scabiesrisk), confint(scabiesrisk)))
scabiesrisk_summary <- cbind(scabiesrisk_OR, summary(scabiesrisk)$coefficients)
print(scabiesrisk_summary)

# 7.13 Logistic Regression for Impetigo (impetigo_odds) and Scabies (scabies_infestation)
impetigo_model <- glm(impetigo_odds ~ scabies_infestation + factor(agegroups) + factor(gender) + factor(house_cat),
                      data = scabies, family = binomial())

# 7.14 Summarize the Impetigo Model
impetigo_summary <- tidy(impetigo_model, exponentiate = TRUE, conf.int = TRUE)
print(impetigo_summary)

# 7.15 Compare Two Models Using Likelihood Ratio Test
scabiesrisk2 <- glm(scabies_infestation ~ factor(agegroups) + factor(gender),
                    data = scabies, family = binomial())

# Perform Likelihood Ratio Test
lrtest_result <- lrtest(scabiesrisk, scabiesrisk2)
print(lrtest_result)

# 7.16 Fit an Interaction Term Model
interaction_model <- glm(scabies_infestation ~ factor(agegroups) * factor(gender),
                         data = scabies, family = binomial())

# Summarize the Interaction Model
interaction_summary <- tidy(interaction_model, exponentiate = TRUE, conf.int = TRUE)
print(interaction_summary)

# 7.17 Compare Models with and without Interaction Term
lrtest_interaction <- lrtest(scabiesrisk2, interaction_model)
print(lrtest_interaction)

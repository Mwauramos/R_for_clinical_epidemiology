# Load necessary libraries
library(survival)
library(dplyr)

# Assume 'dataframe' is the data containing the matched case-control study
# Assume 'case' is the binary outcome variable (1 = case, 0 = control)
# Assume 'independent_variable' is the predictor of interest
# Assume 'matching_var' is the variable used for matching

# Conditional Logistic Regression Model
conditional_model <- clogit(case ~ independent_variable + strata(matching_var), data = dataframe)

# Calculate Odds Ratios (ORs) and 95% Confidence Intervals (CIs)
conditional_OR <- exp(cbind(OR = coef(conditional_model), confint(conditional_model)))

# Summarize the model output
conditional_summary <- summary(conditional_model)
conditional_summary <- cbind(conditional_OR, conditional_summary$coefficients)

# Display the results
print(conditional_summary)


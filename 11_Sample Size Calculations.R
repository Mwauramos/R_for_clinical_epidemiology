# ========================================================================
# Sample Size Calculations for Epidemiological Studies
# ========================================================================
# This script provides a comprehensive approach to sample size calculations
# for various types of epidemiological studies. The script covers sample 
# size calculations for single proportion, comparing two proportions, 
# comparing two means, and calculating power for studies.

# Load necessary packages
if (!require(pwr)) install.packages("pwr")
library(pwr)

# ========================================================================
# Section 1: Sample Size Calculation for a Single Proportion
# ========================================================================
# This section calculates the required sample size for estimating a single
# proportion with a specified confidence level and margin of error.
#
# Example Scenario:
# You want to estimate the proportion of a population that has a certain 
# disease. You expect the proportion to be around 50%, and you want the 
# margin of error to be 5% with a 95% confidence level.

# Define parameters
p <- 0.5        # Estimated proportion (e.g., 50% prevalence of the disease)
alpha <- 0.05   # Significance level (95% confidence interval)
moe <- 0.05     # Margin of error (5%)

# Calculate the z-value for the confidence level
z <- qnorm(1 - alpha/2)

# Calculate the required sample size
n_single_prop <- (z^2 * p * (1 - p)) / (moe^2)

# Print the result
cat("Sample size required for a single proportion:", ceiling(n_single_prop), "\n")

# ========================================================================
# Section 2: Sample Size Calculation for Comparing Two Proportions
# ========================================================================
# This section calculates the sample size required to compare two independent
# proportions with a specified power and significance level.
#
# Example Scenario:
# You are planning a study to compare the effectiveness of two treatments 
# for a disease. You expect the cure rates to be 30% for treatment A and 
# 40% for treatment B. You want to detect this difference with 80% power 
# and a 5% significance level.

# Define parameters
p1 <- 0.3        # Proportion in group 1 (e.g., 30% cure rate for treatment A)
p2 <- 0.4        # Proportion in group 2 (e.g., 40% cure rate for treatment B)
alpha <- 0.05    # Significance level
power <- 0.8     # Desired power

# Calculate the effect size
effect_size <- ES.h(p1, p2)

# Calculate the required sample size per group
n_two_prop <- pwr.2p.test(h = effect_size, sig.level = alpha, power = power)$n

# Print the result
cat("Sample size required per group for comparing two proportions:", ceiling(n_two_prop), "\n")

# ========================================================================
# Section 3: Sample Size Calculation for Comparing Two Means
# ========================================================================
# This section calculates the sample size required to compare two independent
# means with a specified power and significance level.
#
# Example Scenario:
# You want to compare the mean blood pressure between two groups: a treatment 
# group and a control group. The expected mean blood pressure is 100 mmHg in 
# the control group and 110 mmHg in the treatment group, with a common 
# standard deviation of 15 mmHg. You want to detect this difference with 
# 80% power and a 5% significance level.

# Define parameters
mean1 <- 100         # Mean in group 1 (e.g., 100 mmHg in the control group)
mean2 <- 110         # Mean in group 2 (e.g., 110 mmHg in the treatment group)
sd <- 15             # Common standard deviation
alpha <- 0.05        # Significance level
power <- 0.8         # Desired power

# Calculate the effect size
effect_size <- (mean2 - mean1) / sd

# Calculate the required sample size per group
n_two_means <- pwr.t.test(d = effect_size, sig.level = alpha, power = power, type = "two.sample")$n

# Print the result
cat("Sample size required per group for comparing two means:", ceiling(n_two_means), "\n")

# ========================================================================
# Section 4: Power Calculation for a Given Sample Size
# ========================================================================
# This section calculates the power of a study for a given sample size and 
# effect size.
#
# Example Scenario:
# You already have 50 participants in each group of your study and want to 
# know the power of detecting an effect size of 0.5 with a 5% significance 
# level.

# Define parameters
n <- 50            # Sample size per group (e.g., 50 participants per group)
effect_size <- 0.5 # Effect size (Cohen's d)
alpha <- 0.05      # Significance level

# Calculate the power
power_calc <- pwr.t.test(n = n, d = effect_size, sig.level = alpha, type = "two.sample")$power

# Print the result
cat("Power of the study with sample size", n, "per group:", round(power_calc, 2), "\n")

# ========================================================================
# Section 5: Summary of Results
# ========================================================================
# This section provides a summary of the sample sizes and power calculated
# in the previous sections.

cat("Summary of Sample Size Calculations:\n")
cat("1. Sample size for a single proportion:", ceiling(n_single_prop), "\n")
cat("2. Sample size per group for comparing two proportions:", ceiling(n_two_prop), "\n")
cat("3. Sample size per group for comparing two means:", ceiling(n_two_means), "\n")
cat("4. Power of the study with sample size", n, "per group:", round(power_calc, 2), "\n")


# Load the cleaned Ebola dataset and set the person_to_person transmission route as baseline
ebola <- read.csv(file = "mmc1.txt", header = TRUE, sep = ",")
ebola$transmission <- relevel(ebola$transmission, "person_to_person")

# Convert date variables to decimal years
ebola$disease_onset <- cal.yr(as.Date(ebola$disease_onset, format = "%Y-%m-%d"))
ebola$disease_ended <- cal.yr(as.Date(ebola$disease_ended, format = "%Y-%m-%d"))

# 2. Declaring Follow-Up Periods
# Create a Lexis model
ebola_lexis_model <- Lexis(
  entry = list("calendar_time" = disease_onset),
  exit = list("calendar_time" = disease_ended),
  exit.status = status == "died",
  data = ebola
)

# 3. Making a Rate Table
# Calculate crude rates and rates stratified by a variable
average_rate <- rate(ebola_lexis_model, obs = lex.Xst, pyrs = lex.dur)
rate_by_transmission <- rate(ebola_lexis_model, obs = lex.Xst, pyrs = lex.dur, print = transmission)

# 4. Running a Poisson Regression
# Fit a Poisson regression model
poisson_model <- glm(lex.Xst ~ offset(log(lex.dur)) + independent_variable + independent_variable, 
                     data = lexis_dataframe, family = poisson)

# Calculate Hazard Ratios (HRs)
ebola_model <- glm(lex.Xst ~ factor(transmission) + sex + offset(log(lex.dur)), 
                   data = ebola_lexis_model, family = poisson)
ebola_ratios <- cbind(HR = exp(coef(ebola_model)), exp(confint(ebola_model)))
ebola_model_out <- summary(ebola_model)
ebola_model_out <- cbind(ebola_ratios, ebola_model_out$coefficients)
print(ebola_model_out)

# 5. Using Broom with Poisson
# For a more streamlined output
broom_ebola <- tidy(ebola_model, exponentiate = TRUE, conf.int = TRUE)
print(broom_ebola)

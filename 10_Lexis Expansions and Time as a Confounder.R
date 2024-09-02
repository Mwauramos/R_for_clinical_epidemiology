# 1. Expanding Lexis Model
# Load and prepare the simulated "Alcohol outcomes" dataset
alcohol <- read.csv(file = "alcohol_outcomes.csv", header = TRUE, sep = ",")
alcohol$timein <- cal.yr(as.Date(alcohol$timein, format = "%d/%m/%Y"))
alcohol$timeout <- cal.yr(as.Date(alcohol$timeout, format = "%d/%m/%Y"))
alcohol$timebth <- cal.yr(as.Date(alcohol$timebth, format = "%d/%m/%Y"))

# Create a Lexis model
alcohol_lexis <- Lexis(
  entry = list("calendar_time" = timein, "age" = timein - timebth),
  exit = list("calendar_time" = timeout),
  exit.status = death == 1,
  data = alcohol
)

# Perform Lexis expansion
split_alcohol_lexis <- splitLexis(alcohol_lexis, breaks = c(50, 60, 70, 80), time.scale = "age")
split_alcohol_lexis$age_blocks <- timeBand(split_alcohol_lexis, "age", type = "factor")
split_alcohol_lexis$age_blocks <- factor(split_alcohol_lexis$age_blocks)

# 2. Running a Poisson Regression with Time-Varying Variable
# Fit the Poisson regression model with time-varying age blocks
age_alcohol_model <- glm(lex.Xst ~ factor(alcohol) + factor(age_blocks) + offset(log(lex.dur)), 
                         data = split_alcohol_lexis, family = poisson)
age_alcohol_ratios <- cbind(HR = exp(coef(age_alcohol_model)), exp(confint(age_alcohol_model)))
age_alcohol_out <- summary(age_alcohol_model)
age_alcohol_out <- cbind(age_alcohol_ratios, age_alcohol_out$coefficients)
print(age_alcohol_out)

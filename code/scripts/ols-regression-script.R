# Load train, test set, and sca into working environment
load("../../data/train-and-test-set.RData")

# Check missing values
sum(is.na(scaled_credit))
# No missing value

# Convert matrix of data to dataframe
scaled_credit <- data.frame(scaled_credit)

# Fit a multiple linear regression model via Ordinary Least Squares (OLS)
osl_model <- lm(Balance ~ ., data = scaled_credit)
osl_summary <- summary(osl_model)

# Calculate mse
source("../functions/mse-function.R")
osl_mse <- mse(osl_model$fitted.values, scaled_credit$Balance)

# Obtain coefficients of multiple linear regression
osl_coef <- coef(osl_model)

# Save results in binary file
save(osl_model, osl_summary, osl_mse, osl_coef, file = "../../data/ols-regression.RData")

# Save results to a text file
sink("../../data/ols-regression-output.txt")
cat("Results of multiple linear regression model via Ordinary Least Square", "\n")
cat("Summary of multiple linear regression model", "\n", append = TRUE)
osl_summary
cat("MSE of multiple linear regression model", "\n", append = TRUE)
cat(osl_mse, append = TRUE)
sink()




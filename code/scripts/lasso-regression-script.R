# Load train, test set, and scaled credit into working environment
load("../../data/train-and-test-set.RData")

# Split scaled_credit into predictors matrix and Balance vector
x_matrix <- scaled_credit[, -ncol(scaled_credit)]
y_vector <- scaled_credit[, ncol(scaled_credit)]

# Check missing values
sum(is.na(y_vector))
sum(is.na(x_matrix))

library(glmnet)
# Initialize grid for lambda
grid = 10 ^ seq (10, -2, length = 100)

# Fit lasso regression on the train set using ten-fold cross-validation
set.seed (1)
lasso_cv <- cv.glmnet(x_matrix[train, ], y_vector[train], lambda = grid, 
                      alpha = 1, intercept = FALSE, standardize = FALSE)
# Plot the cross-validation errors in terms of the tuning parameter
plot(lasso_cv)


# Find the lambda for the best model
lasso_bestlam <- lasso_cv$lambda.min
lasso_bestlam

# Use the test set to compute the test Mean Square Error (test MSE)

lasso_pred <- predict(lasso_cv, s = lasso_bestlam, newx = x_matrix[test, ],
                intercept = FALSE, standardize = FALSE) 

# Load MSE function and calculate MSE
source("../functions/mse-function.R")
lasso_test_mse <- mse(lasso_pred, y_vector[test])
lasso_test_mse

# Refit model with full data set
lasso_model <- glmnet(x_matrix, y_vector, alpha = 1, lambda = lasso_bestlam, 
                      intercept = FALSE, standardize = FALSE)
lasso_coef <- coef(lasso_model)
lasso_coef

# Save cv output model, best lambda, test MSE, best model, 
# and official coefficients in a binary file
save(lasso_cv, lasso_bestlam, lasso_test_mse, lasso_model, lasso_coef,
     file = "../../data/lasso-regression.RData")

# Save cv output model, best lambda, test MSE, best model, 
# and official coefficients in text file
sink("../../data/lasso-regression-output.txt")
cat("Results of lasso regression", "\n")
cat("The best lambda from 10-fold cross validation:", lasso_bestlam, "\n", append = TRUE)
cat("\n", append = TRUE)
cat("Test Mean Square Error from best model:", lasso_test_mse, "\n", append = TRUE)
cat("\n", append = TRUE)
cat("Official coefficients from best model", "\n", append = TRUE)
lasso_coef
sink()

# Save the plot of cross-validation errors in terms of the tunning parameter
png("../../images/lasso-cv-lambda.png")
plot(lasso_cv)
dev.off()










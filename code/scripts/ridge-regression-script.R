# Load train, test set, and sca into working environment
load("../../data/train-and-test-set.RData")

# Split scaled_credit into predictors matrix and Balance vector
x_matrix <- scaled_credit[, -ncol(scaled_credit)]
y_vector <- scaled_credit[, ncol(scaled_credit)]

# Check mission values
sum(is.na(y_vector))
sum(is.na(x_matrix))


library(glmnet)
# Initialize grid for lambda
grid <- 10 ^ seq (10, -2, length = 100)

# Fit ridge regression on the train set using ten-fold cross-validation
set.seed(1)
ridge_cv <- cv.glmnet(x_matrix[train, ], y_vector[train], alpha = 0, 
                     lambda = grid, intercept = FALSE, standardize = FALSE)

# Plot the cross-validation errors in terms of the tunning parameter
plot(ridge_cv)


# Find the lambda for the best model
ridge_bestlam <- ridge_cv$lambda.min
ridge_bestlam

# Use the test set to compute the test Mean Square Error (test MSE)
ridge_pred <- predict(ridge_cv, s = ridge_bestlam, newx = x_matrix[test, ], 
                      intercept = FALSE, standardize = FALSE)
# Load mse function
source("../functions/mse-function.R")
ridge_test_mse <- mse(ridge_pred, y_vector[test])
ridge_test_mse

# Refit the model on the full data set using the best lambda and get official coefficients
ridge_model <- glmnet(x_matrix, y_vector, alpha = 0, lambda = ridge_bestlam, 
                      intercept = FALSE, standardize = FALSE)

ridge_coef <- coef(ridge_model)
ridge_coef

# Save cv output model, best lambda, test MSE, best model, 
# and official coefficients in a binary file
save(ridge_cv, ridge_bestlam, ridge_test_mse, ridge_model, ridge_coef, 
     file = "../../data/ridge-regression.RData")


# Save cv output model, best lambda, test MSE, best model, 
# and official coefficients in text file
sink("../../data/ridge-regression-output.txt")
cat("Results of ridge regression", "\n")
cat("The best lambda from 10-fold cross validation:", ridge_bestlam, "\n", append = TRUE)
cat("\n", append = TRUE)
cat("Test Mean Square Error from best model:", ridge_test_mse, "\n", append = TRUE)
cat("\n", append = TRUE)
cat("Official coefficients from best model", "\n", append = TRUE)
ridge_coef
sink()

# Save the plot of cross-validation errors in terms of the tunning parameter
png("../../images/ridge-cv-lambda.png")
plot(ridge_cv)
dev.off()

# Load train, test set, and sca into working environment
load("data/train-and-test-set.RData")

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
ridge_cv_plot <- plot(ridge_cv)
ridge_cv_plot

# Find the lambda for the best model
bestlam <- ridge_cv$lambda.min
bestlam

# Use the test set to compute the test Mean Square Error (test MSE)
ridge_pred <- predict(ridge_cv, s = bestlam, newx = x_matrix[test ,], 
                      intercept = FALSE, standardize = FALSE)
# Load mse function
source("code/functions/mse-function.R")
ridge_test_mse <- mse(ridge_pred, y_vector[test])
ridge_test_mse

# Refit the model on the full data set using the best lambda and get official coefficients
ridge_model <- glmnet(x_matrix, y_vector, alpha = 0, lambda = bestlam, 
                      intercept = FALSE, standardize = FALSE)

ridge_coef <- coef(ridge_model)
ridge_coef

# Save cross-validation in binary

# save ,.... in txt 
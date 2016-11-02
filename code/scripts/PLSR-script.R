# Load train, test set, and sca into working environment
load("../../data/train-and-test-set.RData")

# Split scaled_credit into predictors matrix and Balance vector
x_matrix <- scaled_credit[, -ncol(scaled_credit)]
y_vector <- scaled_credit[, ncol(scaled_credit)]

# Check missing values
sum(is.na(y_vector))
sum(is.na(x_matrix))

library(pls)
# Fit PLSR on the train set using ten-fold cross-validation
set.seed(1)
plsr_cv <- plsr(y_vector[train] ~ x_matrix[train, ], scale = FALSE, validation = "CV")

# Plot the cross-validation errors in terms of the tunning parameter: number of partial least squares directions
validationplot(plsr_cv, val.type = "MSEP")

# Find the best number of for the best model
plsr_cv$validation$PRESS
min(plsr_cv$validation$PRESS)
# The best parameter: 
plsr_bestncomp <- match(min(plsr_cv$validation$PRESS), plsr_cv$validation$PRESS)
plsr_bestncomp


# Use the test set to compute the test Mean Square Error (test MSE)
set.seed(1)
plsr_pred <- predict(plsr_cv, x_matrix[test, ], ncomp = plsr_bestncomp)
# Load mse function
source("../functions/mse-function.R")
plsr_test_mse <- mse(plsr_pred, y_vector[test])
plsr_test_mse

# Refit the model on the full data set using the best ncomp and get official coefficients
plsr_model <- plsr(y_vector ~ x_matrix, scale = FALSE, ncomp = 5)
plsr_coef <- coef(plsr_model)
plsr_coef
summary(plsr_model)
coef(plsr_model)

# Save cv output model, the best ncomp, test MSE, best model, 
# and official coefficients in a binary file
save(plsr_cv, plsr_bestncomp, plsr_test_mse, plsr_model, plsr_coef, 
     file = "../../data/PLSR.RData")

# Save cv output model, the best ncomp, test MSE, best model, 
# and official coefficients in text file
sink("../../data/PLSR-output.txt")
cat("Results of Principal Components Regression", "\n")
cat("The best number of principal components from 10-fold cross validation:", 
    plsr_bestncomp, "\n", append = TRUE)
cat("\n", append = TRUE)
cat("Test Mean Square Error from best model:", plsr_test_mse, "\n", append = TRUE)
cat("\n", append = TRUE)
cat("Official coefficients from best model", "\n", append = TRUE)
plsr_coef
sink()

# Save the plot of cross-validation errors in terms of the tuning parameter
###add titles
png("../../images/plsr-cv-ncomp.png")
validationplot(plsr_cv, val.type = "MSEP")
dev.off()

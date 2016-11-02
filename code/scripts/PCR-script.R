# Load train, test set, and sca into working environment
load("../../data/train-and-test-set.RData")

# Split scaled_credit into predictors matrix and Balance vector
x_matrix <- scaled_credit[, -ncol(scaled_credit)]
y_vector <- scaled_credit[, ncol(scaled_credit)]

# Check mission values
sum(is.na(y_vector))
sum(is.na(x_matrix))

library(pls)
# Fit PCR on the train set using ten-fold cross-validation
set.seed(1)
pcr_cv <- pcr(y_vector[train] ~ x_matrix[train, ], scale = FALSE, validation = "CV")

# Plot the cross-validation errors in terms of the tunning parameter: number of components
validationplot(pcr_cv, val.type = "MSEP")

# Find the best number of principal components for the best model
pcr_cv$validation$PRESS
min(pcr_cv$validation$PRESS)
# The best parameter: 
pcr_bestncomp <- match(min(pcr_cv$validation$PRESS), pcr_cv$validation$PRESS)
pcr_bestncomp


# Use the test set to compute the test Mean Square Error (test MSE
set.seed(1)
pcr_pred <- predict(pcr_cv, x_matrix[test, ], ncomp = pcr_bestncomp)
# Load mse function
source("../functions/mse-function.R")
pcr_test_mse <- mse(pcr_pred, y_vector[test])
pcr_test_mse

# Refit the model on the full data set using the best ncomp and get official coefficients
pcr_model <- pcr(y_vector ~ x_matrix, scale = FALSE, ncomp = pcr_bestncomp)
pcr_coef <- coef(pcr_model)
pcr_coef

# Save cv output model, the best ncomp, test MSE, best model, 
# and official coefficients in a binary file
save(pcr_cv, pcr_bestncomp, pcr_test_mse, pcr_model, pcr_coef, 
     file = "../../data/PCR.RData")


# Save cv output model, the best ncomp, test MSE, best model, 
# and official coefficients in text file
sink("../../data/PCR-output.txt")
cat("Results of Principal Components Regression", "\n")
cat("The best number of principal components from 10-fold cross validation:", 
    pcr_bestncomp, "\n", append = TRUE)
cat("\n", append = TRUE)
cat("Test Mean Square Error from best model:", pcr_test_mse, "\n", append = TRUE)
cat("\n", append = TRUE)
cat("Official coefficients from best model", "\n", append = TRUE)
pcr_coef
sink()

# Save the plot of cross-validation errors in terms of the tunning parameter
png("../../images/pcr-cv-ncomp.png")
validationplot(pcr_cv, val.type = "MSEP")
dev.off()

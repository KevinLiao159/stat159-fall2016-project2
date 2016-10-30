# Load data into working environment
credit <- read.csv("data/Credit.csv")
credit <- credit[, -1]

scaled_credit <- read.csv("data/scaled-credit.csv")

load("data/train-and-test-set.RData")

library(glmnet)
x_matrix <- as.matrix(scaled_credit[, 2:12])
y_vector <- scaled_credit[, 13]

sum(is.na(y_vector))
sum(is.na(x_matrix))

# lasso regression
grid = 10 ^ seq (10, -2, length = 100)
lasso_model = glmnet(x_matrix[train, ], y_vector[train], alpha = 1, lambda =grid)
model_coef_lasso = coef(lasso_model)
head(model_coef_lasso)
# 11 features + 1 intercept for 100 lambdas
dim(model_coef_lasso)
# coef for the 50th lambda
grid[50]
lasso_model$lambda[50]
coef(lasso_model)[,50]
model_coef[,50]
# ell2 norm (size of penalty; measure distance of β from zero)
coef(lasso_model)[ -1 ,50]
dim(coef(lasso_model)[ -1 ,50])
sqrt(sum(coef(lasso_model)[-1 ,50]^2) )


# cross-validation
set.seed (1)
cv_out <- cv.glmnet(x_matrix[train, ], y_vector[train],
                   alpha = 1,
                   intercept=F,
                   standardize=F)
plot(cv_out)
bestlam <- cv_out$lambda.min

# Compute test MSE with best model
source("code/functions/mse-function.R")
pred <- predict(lasso_model, s = bestlam, newx = x_matrix[test, ]) 
lasso_test_mse <- mse(pred, y_vector[test])

# Refit model with full data set
lasso_out <- glmnet(x_matrix, y_vector, alpha = 1, lambda = grid)

lasso_coef <- predict(lasso_out, type="coefficients", s=bestlam)[1:12, ]

# Save outputs
save(cv_out, bestlam, lasso_test_mse, lasso_coef, file='data/lasso.RData')

sink("data/lasso-output.txt")
cat("Lambda of Best Fit Model\n", append = TRUE)
print(bestlam)
cat("Mean-squared Error of Test\n", append = TRUE)
print(lasso_test_mse)
cat("Lasso Coefficients\n", append = TRUE)
print(lasso_coef)
sink()

png("images/cross-validation-errors.png")
plot(cv_out)
dev.off()










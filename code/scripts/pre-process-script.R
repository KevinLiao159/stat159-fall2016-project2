# load data into working environment
credit <- read.csv("data/Credit.csv")
credit <- credit[, -1]

# (a) Convert factors into dummy variables
# dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)

# removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)


# (b) Mean Centering and Standardizing
# scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

# export scaled data
write.csv(scaled_credit, file = "data/scaled-credit.csv")


# Training and Testing Sets
# Create an index vector
index <- 1 : nrow(credit)
# Sample 300 values for trainning with no replacement
set.seed(1)
train <- sample(index, size = 300, replace = FALSE)
# The rest of 100 values for testing set
test <- setdiff(index, train)

# Save the train and test vectors in 
save(train, test, file = "data/train-and-test-set.RData")




# 
x_matrix <- scaled_credit[, -ncol(scaled_credit)]
y_vector <- scaled_credit[, ncol(scaled_credit)]


# playing
credit[train, ]

lm(Balance ~ ., data = credit, subset = train)


summary(lm(Balance ~ ., data = credit, subset = train))

library(glmnet)
x_matrix = model.matrix(Balance ~ ., data = credit)[, -1]
y_vector = credit$Balance

sum(is.na(y_vector))
sum(is.na(x_matrix))

# ridge gression
grid =10 ^ seq (10, -2, length = 100)
ridge.model = glmnet(x_matrix[train, ], y_vector[train], alpha = 0, lambda =grid)
model_coef = coef(ridge.model)
head(model_coef)
# 11 features + 1 intercept for 100 lambdas
dim(model_coef)
# coef for the 50th lambda
grid[50]
ridge.model$lambda[50]
coef(ridge.model)[,50]
model_coef[,50]
# ell2 norm (size of penalty; measure distance of β from zero)
coef(ridge.model)[ -1 ,50]
dim(coef(ridge.model)[ -1 ,50])
sqrt(sum(coef(ridge.model)[-1 ,50]^2) )
# see coefficient when lambda = s
predict(ridge.model, s = 50, type = "coefficients")
# check mse against test for lambda = s
source("code/functions/mse-function.R")
pred = predict(ridge.model, s = 4, newx = x_matrix[test, ]) 
mse(pred, y_vector[test])

# non penalized fit (regression)
lm1 <- lm(Balance ~ ., data = credit, subset = train)
summary(lm1)
predict(ridge.model, s=0, exact =T, type="coefficients")
# check mse against testing set 
lm.pred <- predict.lm(lm1, newdata = credit[test, -11])
mse(lm.pred, y_vector[test])
ridge.pred <- predict(ridge.model, s = 0, newx = x_matrix[test ,])
mse(ridge.pred, y_vector[test])

# cross-validation
set.seed(1)
cv.out = cv.glmnet(x_matrix[train, ], y_vector[train], alpha = 0)
plot(cv.out)
bestlam =cv.out$lambda.min
bestlam

# check mse against test for lambda the best 
ridge.pred=predict(ridge.model, s = bestlam, newx = x_matrix[test ,])
mse(ridge.pred, y_vector[test])
# ????????? much larger

# Refit ridge regression using best lambda and see its coef
refit.rid.ml <- glmnet(x_matrix, y_vector, alpha = 0, lambda = bestlam)
predict(refit.rid.ml, type = "coefficients")

#Done

# PCA
library(pls)
# fit PCR
set.seed(1)
pcr.fit = pcr(Balance ~ ., data = credit, subset = train, scale = TRUE, validation ="CV")
# ?????????? not same 
pcr.fit = pcr(Balance ~ ., data = credit[train, ], scale = TRUE, validation ="CV")
summary(pcr.fit)
# Notice CV score = root MSE

# Plot MSE for CV and find the lowest M
validationplot(pcr.fit, val.type = "MSEP")
which(min(pcr.fit$validation$PRESS))
min(pcr.fit$validation$PRESS)
pcr.fit$validation$PRESS
# M = 10
# check mse against test for # of components
set.seed(1)
pcr.pred = predict(pcr.fit, x_matrix[test, ], ncomp = 10)
mse(pcr.pred, y_vector[test])

# refit the PCR
pcr.fit=pcr(Balance ~., data = credit, scale =TRUE, ncomp = 10)
summary(pcr.fit)


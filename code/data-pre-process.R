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
test <- setdiff(index, train_i)

# Save the train and test vectors in 
save(train, test, file = "data/train-and-test-set.RData")


# playing
credit[train,]

lm(Balance ~ ., data = credit, subset = train)


summary(lm(Balance ~ ., data = credit, subset = train))

library(glmnet)
x_matrix = model.matrix(Balance ~ ., data = credit)
y_vector = credit$Balance
grid =10 ^ seq (10, -2, length = 100)
ridge.model = glmnet(x_matrix, y_vector, alpha = 0, lambda =grid)
check = coef(ridge.model)
head(check)
dim(check)
coef(ridge.model)[,50]
ridge.model$lambda[50]
coef(ridge.model)[ -1 ,50]
dim(coef(ridge.model)[ -1 ,50])
# coefficient
predict(ridge.model, s = 50, type = "coefficients")





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
index <- 1 : 400
# Sample 300 values for trainning with no replacement
set.seed(1)
train_i <- sample(index, size = 300, replace = FALSE)
# The rest of 100 values for testing set
testing_i <- setdiff(index, train_i)

# Save the train and test vectors in 
save(train_i, testing_i , file = "data/train-and-test-set.RData")






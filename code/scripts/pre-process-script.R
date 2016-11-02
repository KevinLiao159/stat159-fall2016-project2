# load credit data into working environment
credit <- read.csv("../../data/Credit.csv")
credit <- credit[, -1]

# (a) Convert factors into dummy variables
# dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)

# removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[ , -1], Balance = credit$Balance)


# (b) Mean Centering and Standardizing
# scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

# export scaled data
write.csv(scaled_credit, file = "../../data/scaled-credit.csv", row.names = FALSE)


# Training and Testing Sets
# Create an index vector
index <- 1 : nrow(credit)
# Sample 300 values for trainning with no replacement
set.seed(1)
train <- sample(index, size = 300, replace = FALSE)
# The rest of 100 values for testing set
test <- setdiff(index, train)

# Save the train, test vectors, and scaled_credit in a binary file
save(train, test, scaled_credit, file = "../../data/train-and-test-set.RData")



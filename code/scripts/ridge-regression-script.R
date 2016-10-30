# Load train, test set, and sca into working environment
load("data/train-and-test-set.RData")




library(glmnet)
ridge.model = glmnet(as.matrix(scaled_credit[train, ]), scaled_credit$Balance[train], alpha = 0)

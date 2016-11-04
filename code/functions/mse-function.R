# Title: MSE function
# Description: Compute Mean Square Error for Models
# Input: fitted values a numeric vector or matrix 
# Input: testing values a numeric vector or matrix
# Output: Mean squre error for the model 


mse <- function(fitted_values, test_value) {
  mse = mean((as.numeric(fitted_values) - as.numeric(test_value)) ^ 2)
  return(mse)
}
# Title: MSE function
# Description: Compute Mean Square Error for Models
# Inputs: Fitted values, Testing values
# Output: Mean squre error for model


mse <- function(fitted_values, test_value) {
  mse = mean((as.numeric(fitted_values) - as.numeric(test_value)) ^ 2)
  return(mse)
}
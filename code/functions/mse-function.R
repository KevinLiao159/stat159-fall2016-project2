# MSE function
mse <- function(fitted_values, test_value) {
  mse = mean((fitted_values - test_value) ^ 2)
  return(mse)
}
# MSE function
mse <- function(fitted_values, test_value) {
  mse = mean((as.numeric(fitted_values) - as.numeric(test_value)) ^ 2)
  return(mse)
}
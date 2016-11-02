# load data into working environment
credit <- read.csv("../../data/Credit.csv")
credit <- credit[, -1]

# Compute and save quantitative variable summary statistics to eda-quantitative-output.txt
# Minimum, Maximum, Range
# Median, First and Third quartiles, and interquartile range (IQR)
# Mean and Standard Deviation

# Use for loop to save statistics above for all quantitative variables 
# Quantitative variables: Income, Limit, Rating, Cards, Age, Education, Balance
sink("../../data/eda-quantitative-output.txt")
for (quant_var in c("Income", "Limit", "Rating", "Cards", "Age", "Education", "Balance")) {
  cat(c("Summary Statistics of", quant_var, "\n"), append = TRUE)
  cat(c("Summary of", quant_var, "\n"), append = TRUE)
  print(summary(credit[quant_var]))
  cat(c("Range:", max(credit[quant_var]) - min(credit[quant_var]), "\n"), append = TRUE)
  cat(c("Interquartile Range:", IQR(unlist(credit[quant_var])), "\n"), append = TRUE)
  cat(c("Mean:", mean(unlist(credit[quant_var])), "\n"), append = TRUE)
  cat(c("Standard Deviation:", sd(unlist(credit[quant_var])), "\n"), append = TRUE)
  cat(" \n", append = TRUE)
}
sink()


# Create and save histograms and boxplots of all quantitative variables in PNG format
# Use for loop to create and save histogram and boxplot of each quantitative variable
for (quant_var in c("Income", "Limit", "Rating", "Cards", "Age", "Education", "Balance")) {
  # Create and save histograms
  png(paste0("../../images/histogram-", quant_var, ".png"))
  hist(unlist(credit[quant_var]), breaks=10, main = paste("Histogram of", quant_var), xlab = quant_var)
  dev.off()
  # Create and save boxplots
  png(paste0("../../images/boxplot-", quant_var, ".png"))
  boxplot(credit[quant_var], main = paste("Boxplot of", quant_var), xlab = quant_var)
  dev.off()
}


# Save correlation matrix as RData
corr_matrix <- cor(credit[, c(1 : 6, 11)])
save(corr_matrix, file = "../../data/correlation-matrix.RData")

# Create image for scatterplot matrix ??
png("../../images/scatterplot-matrix.png")
pairs(credit[,c(1 : 6, 11)])
dev.off()

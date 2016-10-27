# load data into working environment
credit <- read.csv("data/Credit.csv")
credit <- credit[, -1]

# Compute and save quantitative variable summary statistics to eda-quantitative-output.txt
# Minimum, Maximum, Range
# Median, First and Third quartiles, and interquartile range (IQR)
# Mean and Standard Deviation

# Use for loop to save statistics above for all quantitative variables 
# Quantitative variables: Income, Limit, Rating, Cards, Age, Education, Balance
sink("data/eda-quantitative-output.txt")
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
  png(paste0("images/histogram-", quant_var, ".png"))
  hist(unlist(credit[quant_var]), breaks=10, main = c("Histogram of Income", xlab = quant_var)
  
}



png("images/histogram-income.png")
hist(credit$Income, breaks=10, main="Histogram of Income", xlab="Income")
dev.off()


png("images/histogram-limit.png")
hist(credit$Limit, breaks=10, main="Histogram of Limit", xlab="Limit")
dev.off()

png("images/histogram-rating.png")
hist(credit$Rating, breaks=10, main="Histogram of Rating", xlab="Rating")
dev.off()

png("images/histogram-cards.png")
hist(credit$Cards, breaks=10, main="Histogram of No. of Cards", xlab="No. of Cards")
dev.off()

png("images/histogram-age.png")
hist(credit$Age, breaks=10, main="Histogram of Age", xlab="Age")
dev.off()

png("images/histogram-education.png")
hist(credit$Education, breaks=10, main="Histogram of Education", xlab="Education")
dev.off()

png("images/histogram-balance.png")
hist(credit$Balance, breaks=10, main="Histogram of Balance", xlab="Balance")
dev.off()

#Create images for boxplots of quantitative variables

png("images/boxplot-income.png")
boxplot(credit$Income, main="Boxplot of Income", xlab="Income")
dev.off()

png("images/boxplot-limit.png")
boxplot(credit$Limit, main="Boxplot of Limit", xlab="Limit")
dev.off()

png("images/boxplot-rating.png")
boxplot(credit$Rating, main="Boxplot of Rating", xlab="Rating")
dev.off()

png("images/boxplot-cards.png")
boxplot(credit$Cards, main="Boxplot of No. of Cards", xlab="No. of Cards")
dev.off()

png("images/boxplot-age.png")
boxplot(credit$Age, main="Boxplot of Age", xlab="Age")
dev.off()

png("images/boxplot-education.png")
boxplot(credit$Education, main="Boxplot of Education", xlab="Education")
dev.off()

png("images/boxplot-balance.png")
boxplot(credit$Education, main="Boxplot of Balance", xlab="Balance")
dev.off()

#Save correlation matrix as RData
corr_matrix <- cor(credit[, c(2:7,12)])
save(corr_matrix, file = 'data/correlation-matrix.RData')

#Create image for scatterplot matrix
png("images/scatterplot-matrix.png")
pairs(credit[,c(2:7,12)])
dev.off()

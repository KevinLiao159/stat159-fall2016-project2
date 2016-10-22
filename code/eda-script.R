credit <- read.csv("data/Credit.csv")

#Save summary statistics to eda-output.txt
sink("data/eda-quantitative-output.txt")
cat("Summary of Income\n", append = TRUE)
print(summary(credit$Income))
cat("Interquartile Range:", append = TRUE)
print(IQR(credit$Income)[[1]])
cat("Standard Deviation:", append = TRUE)
print(sd(credit$Income))
cat("Range:", append = TRUE)
print(max(credit$Income)-min(credit$Income))

cat(" \n", append = TRUE)
cat("Summary of Limit\n", append = TRUE)
print(summary(credit$Limit))
cat("Interquartile Range:", append = TRUE)
print(IQR(credit$Limit)[[1]])
cat("Standard Deviation:", append = TRUE)
print(sd(credit$Limit))
cat("Range:", append = TRUE)
print(max(credit$Limit)-min(credit$Limit))

cat(" \n", append = TRUE)
cat("Summary of Rating\n", append = TRUE)
print(summary(credit$Rating))
cat("Interquartile Range:", append = TRUE)
print(IQR(credit$Rating)[[1]])
cat("Standard Deviation:", append = TRUE)
print(sd(credit$Rating))
cat("Range:", append = TRUE)
print(max(credit$Rating)-min(credit$Rating))

cat(" \n", append = TRUE)
cat("Summary of Cards\n", append = TRUE)
print(summary(credit$Cards))
cat("Interquartile Range:", append = TRUE)
print(IQR(credit$Cards)[[1]])
cat("Standard Deviation:", append = TRUE)
print(sd(credit$Cards))
cat("Range:", append = TRUE)
print(max(credit$Cards)-min(credit$Cards))

cat(" \n", append = TRUE)
cat("Summary of Age\n", append = TRUE)
print(summary(credit$Age))
cat("Interquartile Range:", append = TRUE)
print(IQR(credit$Age)[[1]])
cat("Standard Deviation", append = TRUE)
print(sd(credit$Age))
cat("Range:", append = TRUE)
print(max(credit$Age)-min(credit$Age))

cat(" \n", append = TRUE)
cat("Summary of Education\n", append = TRUE)
print(summary(credit$Education))
cat("Interquartile Range:", append = TRUE)
print(IQR(credit$Education)[[1]])
cat("Standard Deviation", append = TRUE)
print(sd(credit$Education))
cat("Range:", append = TRUE)
print(max(credit$Education)-min(credit$Education))

cat(" \n", append = TRUE)
cat("Summary of Balance\n", append = TRUE)
print(summary(credit$Balance))
cat("Interquartile Range:", append = TRUE)
print(IQR(credit$Balance)[[1]])
cat("Standard Deviation", append = TRUE)
print(sd(credit$Balance))
cat("Range:", append = TRUE)
print(max(credit$Balance)-min(credit$Balance))

sink()

#Create images for histograms of variables
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
hist(credit$Education, breaks=10, main="Histogram of Balance", xlab="Balance")
dev.off()

#Create images for boxplots of variables

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

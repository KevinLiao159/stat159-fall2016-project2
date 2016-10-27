# load data into working environment
credit <- read.csv("data/Credit.csv")
credit <- credit[, -1]

# Save frequency tables of qualitative variables to eda-qualitative-output.txt
sink("data/eda-qualitative-output.txt")
for (categorical in c("Gender", "Ethnicity", "Student", "Married")) {
  cat(c(categorical, "\n"), append = TRUE)
  m <- cbind(table(credit[categorical]), table(credit[categorical])/nrow(credit[categorical]))
  colnames(m) <- c("Count", "Proportion")
  print(m)
  cat(" \n", append = TRUE)
}

# Save anova's between Balance and all the qualitative variables to eda-qualitative-output.txt as well
cat(" \n", append = TRUE)
cat("Anova's between Balance and all the qualitative variables\n", append = TRUE)
summary(aov(Balance ~ Gender + Ethnicity + Student + Married, data = credit))
sink()


# Create and save barcharts of such frequencies for all qualitative variables
for (categorical in c("Gender", "Ethnicity", "Student", "Married")) {
  png(paste0("images/barchart-", categorical, ".png"))
  barplot(table(credit[categorical]), ylim = c(0, nrow(credit[categorical])),
          main = paste("Frequencies of", categorical))
  dev.off()
}

# Create and save conditional boxplots of Balance and the qualitative variables
for (categorical in c("Gender", "Ethnicity", "Student", "Married")) {
  png(paste0("images/boxplot-balance-", categorical, ".png"))
  boxplot(unlist(credit["Balance"]) ~ unlist(credit[categorical]), 
          main = paste("Boxplot of Balance Conditioned to", categorical))
  dev.off()
}







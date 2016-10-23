credit <- read.csv("data/Credit.csv")

#Save qualitative variable summary statistics to eda-qualitative-output.txt
sink("data/eda-qualitative-output.txt")
cat("Gender\n", append = TRUE)
print(matrix(c(summary(credit$Gender)[1],
               summary(credit$Gender)[1]/sum(summary(credit$Gender)),
               summary(credit$Gender)[2],
               summary(credit$Gender)[2]/sum(summary(credit$Gender))),
             nrow=2, ncol=2,
             dimnames=list(c("Count","Proportion"), c("Male", "Female"))))

cat(" \n", append = TRUE)
cat("Student\n", append = TRUE)
print(matrix(c(summary(credit$Student)[1],
               summary(credit$Student)[1]/sum(summary(credit$Student)),
               summary(credit$Student)[2],
               summary(credit$Student)[2]/sum(summary(credit$Student))),
             nrow=2, ncol=2,
             dimnames=list(c("Count","Proportion"), c("No", "Yes"))))

cat(" \n", append = TRUE)
cat("Married\n", append = TRUE)
print(matrix(c(floor(summary(credit$Married)[1]),
               summary(credit$Married)[1]/sum(summary(credit$Married)),
               summary(credit$Married)[2],
               summary(credit$Married)[2]/sum(summary(credit$Married))),
             nrow=2, ncol=2,
             dimnames=list(c("Count","Proportion"), c("No", "Yes"))))

cat(" \n", append = TRUE)
cat("Ethnicity\n", append = TRUE)
print(matrix(c((summary(credit$Ethnicity)[1]),
               summary(credit$Ethnicity)[1]/sum(summary(credit$Ethnicity)),
               summary(credit$Ethnicity)[2],
               summary(credit$Ethnicity)[2]/sum(summary(credit$Ethnicity)),
               summary(credit$Ethnicity)[3],
               summary(credit$Ethnicity)[3]/sum(summary(credit$Ethnicity))),       
             nrow=2, ncol=3,
             dimnames=list(c("Count","Proportion"), c("African American", "Asian", "Caucasian"))))

sink()

#Create images for barcharts of qualitative variables
png("images/barchart-gender.png")
barplot(summary(credit$Gender), ylim=c(0,250), main="Frequencies of Gender")
dev.off()

png("images/barchart-student.png")
barplot(summary(credit$Student), ylim=c(0,400), main="Frequencies of Student Status")
dev.off()

png("images/barchart-married.png")
barplot(summary(credit$Married), ylim=c(0,300),  main="Frequencies of Marriage Status")
dev.off()

png("images/barchart-Ethnicity.png")
barplot(summary(credit$Ethnicity), ylim=c(0,250), main="Frequencies of Ethnicity")
dev.off()

#Create conditional boxplots of Balance and qualitative variables
png("images/boxplot-balance-gender.png")
boxplot(credit[grep("F", credit$Gender),]$Balance, credit[grep("M", credit$Gender),]$Balance,
        names = c("Male", "Female"),
        main = "Boxplot of Balance between Gender")
dev.off()

png("images/boxplot-balance-student.png")
boxplot(credit[grep("Y", credit$Student),]$Balance, credit[grep("N", credit$Student),]$Balance,
        names = c("Student", "Not Student"),
        main = "Boxplot of Balance between Student Status")
dev.off()

png("images/boxplot-balance-married.png")
boxplot(credit[grep("Y", credit$Married),]$Balance, credit[grep("N", credit$Married),]$Balance,
        names = c("Married", "Not Married"),
        main = "Boxplot of Balance between Marriage Status")
dev.off()

png("images/boxplot-balance-ethnicity.png")
boxplot(credit[grep("As", credit$Ethnicity),]$Balance, credit[grep("C", credit$Ethnicity),]$Balance,
        credit[grep("Af", credit$Ethnicity),]$Balance,
        names = c("Asian", "Caucasian", "African American"),
        main = "Boxplot of Balance between Ethnicity")
dev.off()





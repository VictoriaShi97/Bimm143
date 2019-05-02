#' ---
#' title: "Class 5: R Graphics"
#' author: "Victoria Shi"
#' date: "April 18, 2019"
#' ---

# Class 5 R graphics

# 2A. Line plot
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
plot(weight$Age, weight$Weight, typ="o", pch=15, cex=1.5, lwd=2, ylim=c(2,10), xlab="Age (months)", ylab="Weight (kg)", main="Baby weight with age")

# 2B. Barplot
mouse <- read.table("bimm143_05_rstats/feature_counts.txt", sep="\t", header=TRUE)
barplot(mouse$Count)
par(mar=c(3.1, 11.1, 4.1, 2))
barplot(mouse$Count, names.arg=mouse$Feature, horiz=TRUE, ylab="", main="Number of features in the mouse GRCm38 genome", las=1, xlim=c(0,80000))

# 2C. Histogram
x <- c(rnorm(10000),rnorm(10000)+4)
hist(x, breaks=80)

#3A. Providing color vectors
mf<-read.delim("bimm143_05_rstats/male_female_counts.txt", sep = "\t", header = TRUE)
barplot(mf$Count, names.arg = mf$Sample, col = rainbow(nrow(mf)),las=2, ylab = "Counts")
  
#3B. Coloring by value
genes<-read.delim("bimm143_05_rstats/up_down_expression.txt", sep="\t", header=TRUE)
table(genes$State)
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")
palette(c("blue","gray","red"))
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")




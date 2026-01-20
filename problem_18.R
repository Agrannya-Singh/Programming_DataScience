# Problem 18: Analysis of heights
# Created by Agrannya Singh (23BCE0965)

heights <- c(150, 160, 165, 155, 170, 175, 180)

# 1. Mean and Median
cat("Mean:", mean(heights), "\n")
cat("Median:", median(heights), "\n")

# 2. Max and Min
cat("Max:", max(heights), "Min:", min(heights), "\n")

# 3. Count taller than 165
# Logical condition returns TRUE/FALSE vector, sum counts TRUEs
count <- sum(heights > 165)
cat("Taller than 165:", count, "\n")

# 4. Sort
cat("Sorted:", sort(heights), "\n")

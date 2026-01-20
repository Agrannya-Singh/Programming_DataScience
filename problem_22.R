# Problem 22: Recycling Rule
# Created by Agrannya Singh (23BCE0965)

# Recycling Demo
v1 <- c(1, 2)
v2 <- c(10, 20, 30, 40, 50, 60)

# v1 is recycled to c(1, 2, 1, 2, 1, 2) to match v2 length
result <- v1 + v2 

cat("v1:", v1, "\n")
cat("v2:", v2, "\n")
cat("Result (Recycled):", result, "\n")

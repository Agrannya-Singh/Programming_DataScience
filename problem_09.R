# Problem 9: Calculation of Square
# Created by Agrannya Singh (23BCE0965)

# Function Definition
calculate_square <- function(number) {
  # Returns the number multiplied by itself
  return(number ^ 2)
}

# --- Driver Code / Test Cases ---
num1 <- 4
num2 <- -3
num3 <- 0
num4 <- 5.7

# Printing Results
cat("Square of 4:", calculate_square(num1), "\n")
cat("Square of -3:", calculate_square(num2), "\n")
cat("Square of 0:", calculate_square(num3), "\n")
cat("Square of 5.7:", calculate_square(num4), "\n")

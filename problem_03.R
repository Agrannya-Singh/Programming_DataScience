# Problem 3: Multiplication of two numbers
# Created by Agrannya Singh (23BCE0965)

# Function Definition
mul_numbers <- function(a, b) {
  # Returns the product of a and b
  return(a * b)
}

# --- Driver Code / Test Cases ---
result1 <- mul_numbers(5, 10)
result2 <- mul_numbers(-3, 7)
result3 <- mul_numbers(0, 0)
result4 <- mul_numbers(3.5, 2.1)

# Printing Results
cat("Result of multiplicating 5 and 10:", result1, "\n")
cat("Result of multiplicating -3 and 7:", result2, "\n")
cat("Result of multiplicating 0 and 0:", result3, "\n")
cat("Result of multiplicating 3.5 and 2.1:", result4, "\n")

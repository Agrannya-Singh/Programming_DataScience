# Problem 1: Addition of two numbers
# Created by Agrannya Singh (23BCE0965)

# Function Definition
add_numbers <- function(a, b) {
  # Returns the sum of a and b
  return(a + b)
}

# --- Driver Code / Test Cases ---
# Case 1: Positive Integers
result1 <- add_numbers(5, 10)
# Case 2: Negative and Positive Integer
result2 <- add_numbers(-3, 7)
# Case 3: Zero values
result3 <- add_numbers(0, 0)
# Case 4: Floating point numbers
result4 <- add_numbers(3.5, 2.1)

# Printing Results using cat() for formatted output
cat("Result of adding 5 and 10:", result1, "\n")
cat("Result of adding -3 and 7:", result2, "\n")
cat("Result of adding 0 and 0:", result3, "\n")
cat("Result of adding 3.5 and 2.1:", result4, "\n")

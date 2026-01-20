# Problem 2: Subtraction of two numbers
# Created by Agrannya Singh (23BCE0965)

# Function Definition
sub_numbers <- function(a, b) {
  # Returns the result of a minus b
  return(a - b)
}

# --- Driver Code / Test Cases ---
result1 <- sub_numbers(5, 10)
result2 <- sub_numbers(-3, 7)
result3 <- sub_numbers(0, 0)
result4 <- sub_numbers(3.5, 2.1)

# Printing Results
cat("Result of substracting 5 and 10:", result1, "\n")
cat("Result of substracting -3 and 7:", result2, "\n")
cat("Result of substracting 0 and 0:", result3, "\n")
cat("Result of substracting 3.5 and 2.1:", result4, "\n")

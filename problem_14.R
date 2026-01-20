# Problem 14: Check Odd or Even
# Created by Agrannya Singh (23BCE0965)

# Function Definition
check_odd_even <- function(num) {
  # Modulus operator %% returns the remainder
  if (num %% 2 == 0) {
    return("The number is even")
  } else {
    return("The number is odd")
  }
}

# --- Driver Code / Test Cases ---
cat("10: ", check_odd_even(10), "\n")   # Positive Even
cat("7: ", check_odd_even(7), "\n")     # Positive Odd
cat("0: ", check_odd_even(0), "\n")     # Zero
cat("-4: ", check_odd_even(-4), "\n")   # Negative Even
cat("-3: ", check_odd_even(-3), "\n")   # Negative Odd

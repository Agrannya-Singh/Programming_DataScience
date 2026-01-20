# Problem 17: Armstrong Number
# Created by Agrannya Singh (23BCE0965)

# Function Definition
is_armstrong <- function(num) {
  # Convert number to character to split into digits
  digits <- as.numeric(unlist(strsplit(as.character(num), "")))
  
  # Get number of digits
  p <- length(digits)
  
  # Calculate sum of powers
  sum_val <- sum(digits ^ p)
  
  if (sum_val == num) {
    return("The number is an Armstrong number.")
  } else {
    return("The number is not an Armstrong number.")
  }
}

# --- Driver Code / Test Cases ---
cat("153: ", is_armstrong(153), "\n")
cat("123: ", is_armstrong(123), "\n")
cat("1634: ", is_armstrong(1634), "\n")
cat("7: ", is_armstrong(7), "\n")

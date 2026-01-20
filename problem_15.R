# Problem 15: Fibonacci Sequence
# Created by Agrannya Singh (23BCE0965)

# Function Definition
generate_fibonacci <- function(n) {
  # Error handling for non-positive inputs
  if (n <= 0) return("Please enter positive integer")
  if (n == 1) return(0)
  
  # Initialize vector
  fib <- numeric(n)
  fib[1] <- 0
  fib[2] <- 1
  
  # Loop from 3 to n
  for(i in 3:n) {
    fib[i] <- fib[i-1] + fib[i-2]
  }
  return(fib)
}

# --- Driver Code / Test Cases ---
cat("5 terms: ", generate_fibonacci(5), "\n")
cat("10 terms: ", generate_fibonacci(10), "\n")
cat("20 terms: ", generate_fibonacci(20), "\n")

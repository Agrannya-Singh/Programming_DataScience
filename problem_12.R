# Problem 12: Get input from user (Integer)
# Created by Agrannya Singh (23BCE0965)

# Function Definition
getintinpt <- function() {
  user_input <- readline(prompt = "Enter an integer: ")
  # Explicitly cast string to integer
  integer_input <- as.integer(user_input)
  return(integer_input)
}

# --- Driver Code Simulation ---
# Simulated Output scenarios:
# Input: "42" -> Output: 42 (Type: Integer)
# Input: "100" -> Output: 100

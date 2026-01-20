# Problem 13: Get input as floating point
# Created by Agrannya Singh (23BCE0965)

# Function Definition
getfloatinpt <- function() {
  user_input <- readline(prompt = "Enter a floating point number: ")
  # as.numeric converts to double precision float
  float_input <- as.numeric(user_input)
  return(float_input)
}

# --- Driver Code Simulation ---
# Simulated Output scenarios:
# Input: "42" -> Output: 42.0 (Type: Numeric/Double)
# Input: "3.14" -> Output: 3.14

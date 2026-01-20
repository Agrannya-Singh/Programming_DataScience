# Problem 7: Calculation of Celsius to Fahrenheit
# Created by Agrannya Singh (23BCE0965)

# Function Definition
celsius_to_fahrenheit <- function(celsius) {
  # Transformation Formula
  fahrenheit <- (celsius * 9/5) + 32
  return(fahrenheit)
}

# --- Driver Code / Test Cases ---
temp1 <- celsius_to_fahrenheit(0)
temp2 <- celsius_to_fahrenheit(25)
temp3 <- celsius_to_fahrenheit(-10)
temp4 <- celsius_to_fahrenheit(100)

# Printing Results
cat("0 degrees Celsius is", temp1, "degrees Fahrenheit\n")
cat("25 degrees Celsius is", temp2, "degrees Fahrenheit\n")
cat("-10 degrees Celsius is", temp3, "degrees Fahrenheit\n")
cat("100 degrees Celsius is", temp4, "degrees Fahrenheit\n")

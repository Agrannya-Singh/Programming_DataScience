# Problem 8: Calculation of area of circle
# Created by Agrannya Singh (23BCE0965)

# Function Definition
calculate_circle_area <- function(radius) {
  # Area = Pi * r^2
  # 'pi' is a built-in constant in R
  return(pi * radius^2)
}

# --- Driver Code / Test Cases ---
radius1 <- 3
radius2 <- 5.5
radius3 <- 0
radius4 <- 7.2

# Printing Results
cat("Area of circle with radius 3:", calculate_circle_area(radius1), "\n")
cat("Area of circle with radius 5.5:", calculate_circle_area(radius2), "\n")
cat("Area of circle with radius 0:", calculate_circle_area(radius3), "\n")
cat("Area of circle with radius 7.2:", calculate_circle_area(radius4), "\n")

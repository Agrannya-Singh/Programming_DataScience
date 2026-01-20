# Problem 5: Calculation of area of a rectangle
# Created by Agrannya Singh (23BCE0965)

# Function Definition
calculate_rect_area <- function(width, height) {
  # Area = Width * Height
  return(width * height)
}

# --- Driver Code / Test Cases ---
area1 <- calculate_rect_area(5, 10)
area2 <- calculate_rect_area(7, 3)
area3 <- calculate_rect_area(0, 8)
area4 <- calculate_rect_area(4.5, 6.2)

# Printing Results
cat("Area of rectangle with width 5 and height 10:", area1, "\n")
cat("Area of rectangle with width 7 and height 3:", area2, "\n")
cat("Area of rectangle with width 0 and height 8:", area3, "\n")
cat("Area of rectangle with width 4.5 and height 6.2:", area4, "\n")

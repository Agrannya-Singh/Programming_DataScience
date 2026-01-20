# Problem 6: Calculation of BMI
# Created by Agrannya Singh (23BCE0965)

# Function Definition
calculate_bmi <- function(height, weight) {
  # BMI Formula: weight (kg) / [height (m)]^2
  bmi <- weight / (height ^ 2)
  return(bmi)
}

# --- Driver Code / Test Cases ---
# Note: Inputs passed as (height, weight) per problem statement
bmi1 <- calculate_bmi(1.75, 70)
bmi2 <- calculate_bmi(1.60, 60)
bmi3 <- calculate_bmi(1.80, 85)
bmi4 <- calculate_bmi(1.65, 50)

# Printing Results
cat("BMI for height 1.75m and weight 70kg:", bmi1, "\n")
cat("BMI for height 1.60m and weight 60kg:", bmi2, "\n")
cat("BMI for height 1.80m and weight 85kg:", bmi3, "\n")
cat("BMI for height 1.65m and weight 50kg:", bmi4, "\n")

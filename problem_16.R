# Problem 16: Leap Year Check
# Created by Agrannya Singh (23BCE0965)

# Function Definition
is_leap_year <- function(year) {
  # Logic: (Divisible by 4 AND NOT 100) OR (Divisible by 400)
  if((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)) {
    return("The year is a leap year.")
  } else {
    return("The year is not a leap year.")
  }
}

# --- Driver Code / Test Cases ---
cat("2024: ", is_leap_year(2024), "\n")
cat("2023: ", is_leap_year(2023), "\n")
cat("2000: ", is_leap_year(2000), "\n")
cat("1900: ", is_leap_year(1900), "\n")

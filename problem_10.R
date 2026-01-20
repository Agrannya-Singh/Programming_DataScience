# Problem 10: Creation of full name
# Created by Agrannya Singh (23BCE0965)

# Function Definition
make_full_name <- function(first_name, last_name) {
  # paste() joins strings with a space separator by default
  full_name <- paste(first_name, last_name)
  return(full_name)
}

# --- Driver Code / Test Cases ---
name1 <- make_full_name("John", "Doe")
name2 <- make_full_name("Alice", "Smith")
name3 <- make_full_name("Rahul", "Sharma")
name4 <- make_full_name("Emily", "Blunt")

# Printing Results
cat("Full name for John and Doe:", name1, "\n")
cat("Full name for Alice and Smith:", name2, "\n")
cat("Full name for Rahul and Sharma:", name3, "\n")
cat("Full name for Emily and Blunt:", name4, "\n")

# Problem 11: Get input from user and print same
# Created by Agrannya Singh (23BCE0965)

# Function Definition
gettxtinpt <- function() {
  # readline prompts user in the console
  user_input <- readline(prompt = "Enter your input: ")
  return(user_input)
}

# --- Driver Code Simulation ---
# Note: In a static report, we simulate the interaction.
# In a real R environment, you would run:
# val <- gettxtinpt()
# cat("Captured Input:", val, "\n")

# Simulated output description:
# Input: "Hello, world" -> Output: "Hello, world"
# Input: "42" -> Output: "42" (Still a string type)

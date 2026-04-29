# Created by Agrannya Singh(23BCE0965)
check_odd_even <- function(num) {
# Modulus operator %% returns the remainder
if (num %% 2 == 0) {
return(" The number is even ")
} else {
return(" The number is odd ")
}
}
# --- Driver Code / Test Cases --cat("10: ", check_odd_even(10), "\n")
cat("7: ", check_odd_even(7), "\n")
cat("0: ", check_odd_even(0), "\n")
cat("-4: ", check_odd_even (- 4), "\n")
cat("-3: ", check_odd_even (- 3), "\n")
# Positive Even
# Positive Odd
# Zero
# Negative Even
# Negative Odd

# Created by Agrannya Singh (23 BCE0965 )
is_ armstrong <- function ( num ) {
# Convert number to character to split into digits
digits <- as. numeric( unlist( strsplit ( as. charact er ( num ), "")))
# Get number of digits
p <- length ( digits)
# Calculate sum of powers
sum_val <- sum ( digits ^ p)
if ( sum_val == num ) {
return (" The number is an Armstrong number.")
} else {
return (" The number is not an Armstrong number.")
}
}
# --- Driver Code / Test Cases --cat(" 153: ", is_ armstrong (153) , "\n")
cat(" 123: ", is_ armstrong (123) , "\n")
cat(" 1634: ", is_ armstrong (1634) , "\n")
cat(" 7: ", is_ armstrong (7), "\n")
Page 31
PDS Lab Record
# Created by Agrannya Singh (23 BCE0965 )
is_ armstrong <- function ( num ) {
# Convert number to character to split into digits
digits <- as. numeric( unlist( strsplit ( as. charact er ( num ), "")))
# Get number of digits
p <- length ( digits)
# Calculate sum of powers
sum_val <- sum ( digits ^ p)
if ( sum_val == num ) {
return (" The number is an Armstrong number.")
} else {
return (" The number is not an Armstrong number.")
}
}
# --- Driver Code / Test Cases --cat(" 153: ", is_ armstrong (153) , "\n")
cat(" 123: ", is_ armstrong (123) , "\n")
cat(" 1634: ", is_ armstrong (1634) , "\n")
cat(" 7: ", is_ armstrong (7), "\n")
Page 31
PDS Lab Record
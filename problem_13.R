# Created by Agrannya Singh (23 BCE0965)
# Function Definition
getfloatinpt <- function() {
user_input <- readline (prompt = " Enter a floating point number: ")
# as. numeric converts to double prec ision float
float_input <- as. nu meric (user_input)
return(float_input)
}
# --- Driver Code Simulatio n --# S imulated Output scenario s:
# Input: "42" -> Output: 42.0 (Type: Numeric / Double)
# Input: "3.14" -> Output: 3.14

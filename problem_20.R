# Problem 20: Vector Conversion
# Created by Agrannya Singh (23BCE0965)

temps_c <- c(0, 20, 25, 30, 35, 40)

# 1. Convert
# Formula applies to every element in the vector simultaneously
temps_f <- (temps_c * 9/5) + 32
cat("Temps in F:", temps_f, "\n")

# 2. Identify > 90F
hot_temps <- temps_f[temps_f > 90]
cat("Temps > 90F:", hot_temps, "\n")

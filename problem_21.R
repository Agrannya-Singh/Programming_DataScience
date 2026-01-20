# Problem 21: String Vectors
# Created by Agrannya Singh (23BCE0965)

names <- c("Alice", "Bob", "Charlie", "David")

# 1. Uppercase
cat("Uppercase:", toupper(names), "\n")

# 2. Count chars
cat("Char counts:", nchar(names), "\n")

# 3. Contains 'a'
# grep returns values matching the pattern
has_a <- grep("a", names, value = TRUE)
cat("Names with 'a':", has_a, "\n")

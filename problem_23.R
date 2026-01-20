# Problem 23: Unique & Duplicates
# Created by Agrannya Singh (23BCE0965)

numbers <- c(5, 3, 8, 3, 9, 5, 2, 8)

# 1. Unique
cat("Unique:", unique(numbers), "\n")

# 2. Identify Duplicates
# duplicated() returns boolean vector. 
cat("Duplicated values:", numbers[duplicated(numbers)], "\n")

# 3. Remove duplicates (same result as unique)
clean_nums <- numbers[!duplicated(numbers)]
cat("Cleaned:", clean_nums, "\n")

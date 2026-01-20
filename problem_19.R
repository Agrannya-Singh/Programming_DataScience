# Problem 19: Sales Analysis
# Created by Agrannya Singh (23BCE0965)

sales <- c(12, 15, 10, 18, 20, 22, 25, 28, 30, 35, 40, 45)

# 1. Total
cat("Total Sales:", sum(sales), "\n")

# 2. Average
cat("Average Sales:", mean(sales), "\n")

# 3. Months > 25 (Indices or values)
# Square bracket subsetting extracts values meeting condition
high_sales <- sales[sales > 25]
cat("Sales > 25k:", high_sales, "\n")

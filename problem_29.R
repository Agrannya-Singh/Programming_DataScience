# Created by Agrannya Singh (23 BCE0965)
customers <- list(
Alice = c(200, 150, 300),
Bob = c(100, 80, 150),
Charlie = c(250, 300, 100)
)
# 3. Total per customer (apply sum to each list element)
totals <- sapply(customers, sum)
cat("Totals :\n")
print(totals)
# 4. Highest / Lowest
cat("Highest Sp ende r:", names(which . max(t ot als)), "\n")
cat("Lowest Spe nde r:", names (which . min (t ot als)), "\n")

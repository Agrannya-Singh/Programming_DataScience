# Created by Agrannya Singh (23BCE0965)
# Problem 38: Data Integration and Analysis using Join Operations in R (Customers)

if (!requireNamespace('dplyr', quietly = TRUE)) install.packages('dplyr')
library(dplyr)

# --- Step 1: Customers dataset ----
Customers <- data.frame(
  CustomerName = c('Alice', 'Bob', 'Charlie', 'Diana', 'Eve'),
  City = c('New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'),
  MemberSince = c(2018, 2019, 2020, 2017, 2021),
  stringsAsFactors = FALSE)

# --- Step 2: Purchases dataset ----
Purchases <- data.frame(
  CustomerName = c('Alice', 'Bob', 'Alice', 'Charlie', 'Frank', 'Bob'),
  PurchaseAmount = c(250, 150, 300, 100, 200, 175),
  Date = as.Date(c('2023-01-15', '2023-02-10', '2023-03-05',
                    '2023-04-20', '2023-05-15', '2023-06-01')),
  stringsAsFactors = FALSE)

cat('\n--- Customers ---\n')
print(Customers)
cat('\n--- Purchases ---\n')
print(Purchases)

# --- LEFT JOIN ----
cat('\n=== LEFT JOIN ===\n')
print(left_join(Customers, Purchases, by = 'CustomerName'))

# --- RIGHT JOIN ----
cat('\n=== RIGHT JOIN ===\n')
print(right_join(Customers, Purchases, by = 'CustomerName'))

# --- INNER JOIN ----
cat('\n=== INNER JOIN ===\n')
inner <- inner_join(Customers, Purchases, by = 'CustomerName')
print(inner)

# --- FULL OUTER JOIN ----
cat('\n=== FULL OUTER JOIN ===\n')
print(full_join(Customers, Purchases, by = 'CustomerName'))

# --- Rank top spenders ----
cat('\n=== Top Spenders (from inner join) ===\n')
print(inner |>
  arrange(desc(PurchaseAmount)) |>
  mutate(Rank = row_number()) |>
  select(Rank, CustomerName, PurchaseAmount, Date))
cat(sprintf('Average purchase: $%.2f\n', mean(Purchases$PurchaseAmount)))

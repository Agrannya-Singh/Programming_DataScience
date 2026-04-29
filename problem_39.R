# ============================================================
# Lab 39 - Customer-Purchase Join Analysis (E-Commerce)
# Package: dplyr | Reg. No: 23BCE0965
# ============================================================

if (!requireNamespace('dplyr', quietly = TRUE))
  install.packages('dplyr')
library(dplyr)

# --- Step 1: Customers ----
Customers <- data.frame(
  CustomerName = c('John Doe','Jane Smith','Robert Brown',
                   'Emily Davis','Michael Green'),
  Email = c('john@example.com','jane@example.com','robert@example.com',
            'emily@example.com','michael@example.com'),
  stringsAsFactors = FALSE)

# --- Step 2: Purchases ----
Purchases <- data.frame(
  CustomerName = c('John Doe','Jane Smith','Robert Brown',
                   'Sarah Johnson','Emily Davis'),
  PurchaseAmount = c(150, 200, 120, 180, 220),
  Date = as.Date(c('2023-01-01','2023-01-02','2023-01-03',
                    '2023-01-04','2023-01-05')),
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

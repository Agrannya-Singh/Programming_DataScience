# Created by Agrannya Singh (23BCE0965)
# Problem 37: Data Integration and Analysis using Join Operations in R (Donors)

if (!requireNamespace('dplyr', quietly = TRUE)) install.packages('dplyr')
library(dplyr)

# --- Step 1: Donors dataset ----
Donors <- data.frame(
  DonorName = c('Maria Franca Fissolo', 'Yang Huiyan', 'Alice Walton',
                'Susanne Klatte', 'Jacqueline Mars'),
  Country = c('Italy', 'China', 'USA', 'Germany', 'USA'),
  NetWorth = c(25.2, 23.8, 54.4, 21.3, 37.4),
  stringsAsFactors = FALSE)

# --- Step 2: Donations dataset ----
Donations <- data.frame(
  DonorName = c('Maria Franca Fissolo', 'Yang Huiyan',
                'Maria Franca Fissolo', 'Alice Walton',
                'Susanne Klatte', 'Yang Huiyan'),
  Amount = c(100, 50, 75, 25, 100, 150),
  Date = as.Date(c('2018-02-15', '2018-02-15', '2018-02-16',
                    '2018-02-17', '2018-02-17', '2018-02-18')),
  stringsAsFactors = FALSE)

cat('\n--- Donors ---\n')
print(Donors)
cat('\n--- Donations ---\n')
print(Donations)

# --- LEFT JOIN ----
cat('\n=== LEFT JOIN ===\n')
print(left_join(Donors, Donations, by = 'DonorName'))

# --- RIGHT JOIN ----
cat('\n=== RIGHT JOIN ===\n')
print(right_join(Donors, Donations, by = 'DonorName'))

# --- INNER JOIN ----
cat('\n=== INNER JOIN ===\n')
inner <- inner_join(Donors, Donations, by = 'DonorName')
print(inner)

# --- FULL OUTER JOIN ----
cat('\n=== FULL OUTER JOIN ===\n')
print(full_join(Donors, Donations, by = 'DonorName'))

# --- Summary: total per donor ----
cat('\n=== Total Donated per Registered Donor ===\n')
print(inner |>
  group_by(DonorName) |>
  summarise(Total = sum(Amount), Transactions = n(), .groups = 'drop') |>
  arrange(desc(Total)))

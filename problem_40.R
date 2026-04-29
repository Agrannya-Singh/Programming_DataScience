# ============================================================
# Lab 40 - Wide/Long Transformations using tidyr
# Package: tidyr (>= 1.0) | Reg. No: 23BCE0965
# ============================================================

if (!requireNamespace('tidyr', quietly = TRUE))
  install.packages('tidyr')
library(tidyr)

# --- PART A: Wide to Long ----
wide_data <- data.frame(
  ID = 1:3,
  Year2019 = c(10, 15, 20),
  Year2020 = c(12, 18, 24))
cat('\n--- Original WIDE data ---\n')
print(wide_data)

long_data <- wide_data |>
  pivot_longer(cols = c(Year2019, Year2020),
               names_to = 'Year',
               values_to = 'Value')
cat('\n--- Converted to LONG format ---\n')
print(long_data)
cat('Rows:', nrow(long_data), ' Cols:', ncol(long_data), '\n')

# --- PART B: Long to Wide ----
long_data2 <- data.frame(
  ID = c(1, 1, 2, 2, 3, 3),
  Year = c('2019','2020','2019','2020','2019','2020'),
  Value = c(10, 12, 15, 18, 20, 24))
cat('\n--- Original LONG data ---\n')
print(long_data2)

wide_data2 <- long_data2 |>
  pivot_wider(names_from = 'Year',
              values_from = 'Value')
cat('\n--- Restored to WIDE format ---\n')
print(wide_data2)

# --- Round-trip verification ----
names(wide_data2) <- c('ID', 'Year2019', 'Year2020')
cat('\n--- Round-trip check (TRUE = identical) ---\n')
cat(isTRUE(all.equal(as.data.frame(wide_data),
                     as.data.frame(wide_data2))), '\n')

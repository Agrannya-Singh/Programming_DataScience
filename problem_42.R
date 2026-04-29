# Created by Agrannya Singh (23BCE0965)
# Problem 42: JSON Read/Write with jsonlite

if (!requireNamespace('jsonlite', quietly = TRUE)) install.packages('jsonlite')
library(jsonlite)

input_file <- 'inventory.json'
output_file <- 'inventory_updated.json'

# --- Step 1: Auto-create sample if file absent ----
if (!file.exists(input_file)) {
  sample <- list(products = list(
    list(id = 1, name = 'Laptop',     category = 'Electronics', price = 999.99, stock = 50),
    list(id = 2, name = 'Keyboard',   category = 'Electronics', price = 79.99,  stock = 200),
    list(id = 3, name = 'Desk Chair', category = 'Furniture',   price = 299.99, stock = 30),
    list(id = 4, name = 'Monitor',    category = 'Electronics', price = 399.99, stock = 75),
    list(id = 5, name = 'Notebook',   category = 'Stationery',  price = 4.99,   stock = 500)))
  write_json(sample, input_file, pretty = TRUE, auto_unbox = TRUE)
  cat('Sample inventory.json created.\n')
}

# --- Step 2: Read existing inventory ----
inventory <- fromJSON(input_file, simplifyDataFrame = TRUE)
cat('\n=== Current Inventory ===\n')
print(inventory$products)

# --- Step 3: Add new product ----
max_id <- max(inventory$products$id, na.rm = TRUE)
new_product <- data.frame(
  id = max_id + 1L, name = 'Wireless Mouse',
  category = 'Electronics', price = 49.99, stock = 150L,
  stringsAsFactors = FALSE)
cat('\n=== New Product ===\n')
print(new_product)
inventory$products <- rbind(inventory$products, new_product)

# --- Step 4: Write updated inventory ----
write_json(inventory, output_file, pretty = TRUE, auto_unbox = TRUE)
cat('\nWritten to:', output_file, '\n')

# --- Step 5: Verify by re-reading ----
verified <- fromJSON(output_file, simplifyDataFrame = TRUE)
cat('\n=== Verified Contents ===\n')
print(verified$products)

# --- Step 6: Summary statistics ----
prods <- verified$products
cat(sprintf('\nTotal products : %d\n', nrow(prods)))
cat(sprintf('Total stock    : %d units\n', sum(prods$stock)))
cat(sprintf('Avg price      : $%.2f\n', mean(prods$price)))
cat(sprintf('Most expensive : %s ($%.2f)\n',
            prods$name[which.max(prods$price)], max(prods$price)))
cat(sprintf('Cheapest       : %s ($%.2f)\n',
            prods$name[which.min(prods$price)], min(prods$price)))
cat('\n=== Stock by Category ===\n')
sb <- aggregate(stock ~ category, data = prods, FUN = sum)
print(sb[order(-sb$stock), ])

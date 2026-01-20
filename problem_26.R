# Problem 26: Shopping List Application
# Created by Agrannya Singh (23BCE0965)

# Initialize Global List
shopping_list <- list()

# Add Function
add_item <- function(item) {
  # Use <<- to modify global variable
  shopping_list <<- append(shopping_list, item)
}

# Remove Function
remove_item <- function(item) {
  # Filter out the item
  shopping_list <<- shopping_list[shopping_list != item]
}

# --- Driver Code ---
add_item("Apples")
add_item("Milk")
remove_item("Apples")

cat("Current List:", unlist(shopping_list), "\n")

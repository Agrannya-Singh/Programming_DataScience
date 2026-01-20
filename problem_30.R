# Problem 30: Library Book Borrowing System
# Created by Agrannya Singh (23BCE0965)

library_books <- list(
  Hobbit = c("Alice", "Bob"),
  N1984 = c("Charlie", "Alice"),
  MobyDick = c("Bob")
)

# 3. Total borrowers (length of vector)
borrower_counts <- sapply(library_books, length)
cat("Borrower Counts:\n")
print(borrower_counts)

# 4. High/Low
cat("Most Popular:", names(which.max(borrower_counts)), "\n")
cat("Least Popular:", names(which.min(borrower_counts)), "\n")

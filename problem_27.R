# Problem 27: Student Grades Management
# Created by Agrannya Singh (23BCE0965)

grades <- list()

add_grade <- function(name, grade) {
  # Add Key-Value pair
  grades[[name]] <<- grade
}

remove_grade <- function(name) {
  # Setting to NULL removes the key
  grades[[name]] <<- NULL
}

calc_avg <- function() {
  if (length(grades) == 0) return(0)
  return(mean(unlist(grades)))
}

# --- Driver Code ---
add_grade("Alice", 90)
add_grade("Bob", 85)
add_grade("Charlie", 95)
remove_grade("Charlie")

cat("Average Grade:", calc_avg(), "\n")

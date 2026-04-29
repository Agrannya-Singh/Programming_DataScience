# Created by Agrannya Singh (23 BCE0965)
# Initia lize Global List
shopping_list <- list ()
# Add Function
add_item <- function(item) {
# Use < <- to modify global variable
shopping_list <<- append (shopping_list, item)
}
# Remove Function
remove_item <- function(item) {
# Filter out the item
shopping_list <<- shopping_list[ shopping_list ! = item ]
}
# --- Driver Code --add_item (" Apples ")
add_item (" Milk")
remove_item (" Apples")
cat("Current List :", unlist (shopping_list), "\n")
Snap
Explanation
& Inference
References
Explanation: This simulates state management. Since R functions have
ing‘! =
their own scope, we use the superassignment operator ‘¡¡-‘ to modify the
‘shoppinglist‘thatexistsoutsidethefunction.
Inference:Thelistgrowsdynamically.‘append‘adds to the end, while logical
index
‘filters it emsout.
https://github.com/Agrannya-Singh/Programming_DataScience
Title
Problem
ment
Agrannya Singh - 23BCE0965
Program Serial No. 27
Student Grades Management
StateCreate a program to manage student grades, allowing for adding, removing,
and calculating the average grade of students.
Create a list: Initialize an empty list to store student names and their grades.
Add grades: Create a function to add student names and grades to the list.
Remove grades: Create a function to remove student names and grades
from the list.
Calculate average: Create a function to calculate the average grade of the
students.
# Created by Agrannya Singh (23 BCE0965)
grades <- list ()
add_grade <- function(name, grade) {
#
Add
Key - Value
pair
grades [[ name ]] <<- grade
}
remove_grade <- function(name) {
# Setting to NULL removes the key
grades [[ name ]] <<- NULL
}
calc_avg <- function() {
return(mean (unlist (grades)))
}
# --- Driver Code --add_grade (" Alice ", 90)
add_grade (" Bob ", 85)
add_grade (" Charlie ", 95)
remove_grade (" Charlie ")
cat("Average Grade :", calc_av g (), "\n")

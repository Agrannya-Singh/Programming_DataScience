# Created by Agrannya Singh (23 BCE0965 )
grades <- list ()
add_grade <- function ( name , grade ) {
#
Add
Key - Value
pair
grades [[ name ]] <<- grade
}
remove_grade <- function ( name ) {
# Setting to NULL removes the key
grades [[ name ]] <<- NULL
}
calc_ avg <- function () {
return ( mean ( unlist ( grades )))
}
# --- Driver Code --add_grade (" Alice ", 90)
add_grade (" Bob ", 85)
add_grade (" Charlie ", 95)
remove_grade (" Charlie ")
cat(" Average Grade :", calc _av g (), "\n")
Page 43
PDS Lab Record
# Created by Agrannya Singh (23 BCE0965 )
grades <- list ()
add_grade <- function ( name , grade ) {
#
Add
Key - Value
pair
grades [[ name ]] <<- grade
}
remove_grade <- function ( name ) {
# Setting to NULL removes the key
grades [[ name ]] <<- NULL
}
calc_ avg <- function () {
return ( mean ( unlist ( grades )))
}
# --- Driver Code --add_grade (" Alice ", 90)
add_grade (" Bob ", 85)
add_grade (" Charlie ", 95)
remove_grade (" Charlie ")
cat(" Average Grade :", calc _av g (), "\n")
Page 43
PDS Lab Record
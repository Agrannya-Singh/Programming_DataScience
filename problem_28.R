# Created by Agrannya Singh(23BCE0965)
tasks <- list()
add_task <- function(task) {
# Default status is Pending
tasks [[ task ]] <<- " Pending "
}
complete_task <- function(task) {
# Update status
tasks [[ task ]] <<- " C ompleted "
}
# --- Driver Code
--add_task(" Lab Report")
add_task(" Quiz")
complete_task(" Lab Report")
# View
print(tasks)

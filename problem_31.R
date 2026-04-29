# Created by Agrannya Singh (23 BCE0965)
teams <- list(
Team A = c(90, 85, 88),
Team B = c(78, 82, 79),
Team C = c(88, 92, 90)
)
# 3. Avg Score
avgs <- sapply(teams, mean)
cat("Average Scores :\n")
print(avgs)
# 4. Rank (Sort desc ending)
cat("Rank ings :", names(sort(avgs, decreasing = TRUE)), "\n")

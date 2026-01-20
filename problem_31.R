# Problem 31: Sports Team Performance Tracking
# Created by Agrannya Singh (23BCE0965)

teams <- list(
  TeamA = c(90, 85, 88),
  TeamB = c(78, 82, 79),
  TeamC = c(88, 92, 90)
)

# 3. Avg Score
avgs <- sapply(teams, mean)
cat("Average Scores:\n")
print(avgs)

# 4. Rank (Sort descending)
cat("Rankings:", names(sort(avgs, decreasing=TRUE)), "\n")

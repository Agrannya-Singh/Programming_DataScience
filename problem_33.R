# Created by Agrannya Singh (23BCE0965)
# Problem 33: Retail Branch Sales Analytics Using R Data Frames

# ---- 1) Create vectors ----
BranchID <- c('B001', 'B002', 'B003', 'B004', 'B005',
              'B006', 'B007', 'B008', 'B009', 'B010')
BranchName <- c('Downtown', 'Uptown', 'Eastside', 'Westend', 'Central',
                'Northgate', 'Southpark', 'Lakeside', 'Hilltop', 'Riverside')
Region <- c('North', 'South', 'East', 'West', 'North',
            'South', 'East', 'West', 'North', 'South')
Q1 <- c(150, 180, 120, 200, 170, 140, 190, 160, 130, 175)
Q2 <- c(160, 175, 130, 210, 180, 150, 185, 170, 140, 180)
Q3 <- c(170, 190, 140, 195, 175, 160, 200, 165, 150, 185)
Q4 <- c(180, 185, 135, 205, 190, 155, 195, 175, 145, 190)

# ---- 2) Build data frame and write CSV ----
input_csv <- 'branches_input.csv'
branches <- data.frame(
  BranchID, BranchName, Region, Q1, Q2, Q3, Q4,
  stringsAsFactors = FALSE
)
write.csv(branches, file = input_csv, row.names = FALSE, na = '')
cat('Input CSV written:', normalizePath(input_csv, winslash = '/'), '\n')

# ---- 3) Read CSV for analytics ----
branches_in <- read.csv(input_csv, stringsAsFactors = FALSE, check.names = TRUE)
str(branches_in)
quarter_cols <- c('Q1', 'Q2', 'Q3', 'Q4')
required_cols <- c('BranchID', 'BranchName', 'Region', quarter_cols)
missing <- setdiff(required_cols, names(branches_in))
if (length(missing) > 0) stop('Missing columns: ', paste(missing, collapse = ', '))
for (cn in quarter_cols) {
  if (!is.numeric(branches_in[[cn]])) {
    branches_in[[cn]] <- as.numeric(branches_in[[cn]])
  }
}

# ---- 4) Per-branch analytics ----
branches_in$Sum <- rowSums(branches_in[, quarter_cols], na.rm = TRUE)
branches_in$Average <- branches_in$Sum / length(quarter_cols)
branches_in$Rank <- rank(-branches_in$Sum, ties.method = 'min')
branches_by_rank <- branches_in[order(branches_in$Rank, branches_in$BranchID), ]
cat("\n=== 2. Branches by Rank ===\n")
write.csv(branches_by_rank, file = "", row.names = FALSE, na = '')

# ---- 5) Quarter-wise averages ----
quarter_wise_avg <- colMeans(branches_in[, quarter_cols], na.rm = TRUE)
quarter_avg_df <- data.frame(
  Quarter = names(quarter_wise_avg),
  Average = as.numeric(quarter_wise_avg),
  stringsAsFactors = FALSE
)
cat("\n=== 3. Quarter-wise Averages ===\n")
write.csv(quarter_avg_df, file = "", row.names = FALSE, na = '')

# ---- 6) Region-wise averages ----
region_quarter_avg <- aggregate(
  branches_in[, quarter_cols],
  by = list(Region = branches_in$Region),
  FUN = function(x) mean(x, na.rm = TRUE)
)
region_quarter_avg$Overall_Average <- rowMeans(region_quarter_avg[, quarter_cols], na.rm = TRUE)
region_quarter_avg <- region_quarter_avg[
  order(-region_quarter_avg$Overall_Average, region_quarter_avg$Region), ]
cat("\n=== 4. Region-wise Averages ===\n")
write.csv(region_quarter_avg, file = "", row.names = FALSE, na = '')
cat("\n")

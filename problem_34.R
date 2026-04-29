# Created by Agrannya Singh (23BCE0965)
# Problem 34 (Q34): Retail Branch Sales Analytics with CSV I/O (Base R Only)

## ---- 1) Create vectors from the table ----
BranchID <- c('BR001','BR002','BR003','BR004','BR005',
              'BR006','BR007','BR008','BR009','BR010')
BranchName <- c('Vellore Town','Chennai Central','Mumbai Andheri',
                'Pune Hinjewadi','Delhi Karol Bagh','Noida Sector 18',
                'Kolkata Park St','Hyderabad Hitech',
                'Ahmedabad CG Rd','Jaipur MI Road')
Region <- c('South','South','West','West','North','North',
            'East','South','West','North')
Segment <- c('Grocery','Electronics','Grocery','Home','Apparel',
             'Electronics','Grocery','Home','Apparel','Home')
Q1 <- c(120,140,110,95,150,132,105,128,115,108)
Q2 <- c(115,150,118,100,142,138,107,131,120,112)
Q3 <- c(130,145,122,108,155,136,112,134,125,118)
Q4 <- c(125,160,120,112,158,140,115,137,129,121)
Q3_Sales <- Q3 # verification duplicate column

## ---- 2) Create data frame ----
branches_in <- data.frame(
  BranchID, BranchName, Region, Segment,
  Q1, Q2, Q3, Q4, Q3_Sales,
  stringsAsFactors = FALSE
)
cat("\n=== 1. Input Data ===\n")
write.csv(branches_in, file = "", row.names = FALSE, na = '')

## ---- 3) Verify columns for analytics ----
quarter_cols <- c('Q1','Q2','Q3','Q4')
required_cols <- c('BranchID','BranchName','Region','Segment',
                   quarter_cols,'Q3_Sales')
missing <- setdiff(required_cols, names(branches_in))
if (length(missing) > 0) stop('Missing columns: ', paste(missing, collapse = ', '))
for (cn in quarter_cols) {
  if (!is.numeric(branches_in[[cn]])) {
    branches_in[[cn]] <- as.numeric(branches_in[[cn]])
  }
}

## ---- 4) Per-branch analytics ----
branches_in$Sum <- rowSums(branches_in[, quarter_cols], na.rm = TRUE)
branches_in$Average <- branches_in$Sum / length(quarter_cols)
branches_in$Rank <- rank(-branches_in$Sum, ties.method = 'min')
branches_by_rank <- branches_in[order(branches_in$Rank, branches_in$BranchID), ]
cat("\n=== 2. Branches by Rank ===\n")
write.csv(branches_by_rank, file = "", row.names = FALSE, na = '')

## ---- 5) Quarter-wise averages ----
quarter_wise_avg <- colMeans(branches_in[, quarter_cols], na.rm = TRUE)
quarter_avg_df <- data.frame(
  Quarter = names(quarter_wise_avg),
  Average = as.numeric(quarter_wise_avg),
  stringsAsFactors = FALSE
)
cat("\n=== 3. Quarter-wise Averages ===\n")
write.csv(quarter_avg_df, file = "", row.names = FALSE, na = '')

## ---- 6) Region-wise averages ----
region_quarter_avg <- aggregate(
  branches_in[, quarter_cols],
  by = list(Region = branches_in$Region),
  FUN = function(x) mean(x, na.rm = TRUE)
)
region_quarter_avg$Overall_Average <-
  rowMeans(region_quarter_avg[, quarter_cols], na.rm = TRUE)
region_quarter_avg <- region_quarter_avg[
  order(-region_quarter_avg$Overall_Average, region_quarter_avg$Region), ]
cat("\n=== 4. Region-wise Averages ===\n")
write.csv(region_quarter_avg, file = "", row.names = FALSE, na = '')
cat("\n")

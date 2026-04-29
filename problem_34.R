# Created by Agrannya Singh (23BCE0965)
# Problem 34: Student Marks Analytics with CSV I/O

# ---- 0) File names ----
input_csv <- 'students_input.csv'
rank_csv <- 'students_by_rank.csv'
assess_avg_csv <- 'assessment_wise_averages.csv'
spec_avg_csv <- 'specialization_wise_averages.csv'

# ---- 1) Create vectors ----
RegNo <- c('24BCE1001', '24BCE1002', '24BCE1003', '24BCE1004', '24BCE1005',
           '24BCE1006', '24BCE1007', '24BCE1008', '24BCE1009', '24BCE1010')
Name <- c('Aadesh Kumar', 'Bhavya Reddy', 'Charan Iyer', 'Divya Sharma',
           'Esha Nair', 'Farhan Khan', 'Gayathri Raj',
           'Harish Kumar', 'Ishita Menon', 'Jai Verma')
Programme <- rep('B.Tech', 10)
Specialization <- c('CSE', 'AI', 'DS', 'IT', 'CSE', 'ECE', 'Cyber', 'AI', 'DS', 'IT')
Assess1 <- c(18, 15, 20, 14, 20, 12, 17, 16, 19, 18)
Assess2 <- c(17, 16, 19, 15, 20, 14, 18, 17, 18, 17)
Assess3 <- c(19, 14, 18, 15, 19, 13, 17, 16, 19, 16)
Assess4 <- c(18, 18, 20, 16, 20, 16, 19, 15, 18, 19)

# ---- 2) Build data frame and write CSV ----
students <- data.frame(
  RegNo, Name, Programme, Specialization,
  Assess1, Assess2, Assess3, Assess4,
  stringsAsFactors = FALSE
)
write.csv(students, file = input_csv, row.names = FALSE, na = '')
cat('Input CSV written:', normalizePath(input_csv, winslash = '/'), '\n')

# ---- 3) Read CSV for analytics ----
students_in <- read.csv(input_csv, stringsAsFactors = FALSE, check.names = TRUE)
str(students_in)
assess_cols <- c('Assess1', 'Assess2', 'Assess3', 'Assess4')
required_cols <- c('RegNo', 'Name', 'Programme', 'Specialization', assess_cols)
missing <- setdiff(required_cols, names(students_in))
if (length(missing) > 0) stop('Missing columns: ', paste(missing, collapse = ', '))
for (cn in assess_cols)
  if (!is.numeric(students_in[[cn]])) students_in[[cn]] <- as.numeric(students_in[[cn]])

# ---- 4) Per-student analytics ----
students_in$Total <- rowSums(students_in[, assess_cols], na.rm = TRUE)
students_in$Average <- round(students_in$Total / 4, 2)
students_in$Rank <- rank(-students_in$Total, ties.method = 'min')
students_by_rank <- students_in[order(students_in$Rank, students_in$RegNo), ]
write.csv(students_by_rank, file = rank_csv, row.names = FALSE, na = '')
cat('Ranked output CSV:', normalizePath(rank_csv, winslash = '/'), '\n')

# ---- 5) Assessment-wise averages ----
assess_avg <- colMeans(students_in[, assess_cols], na.rm = TRUE)
assess_avg_df <- data.frame(
  Assessment = names(assess_avg),
  Average = round(as.numeric(assess_avg), 2),
  stringsAsFactors = FALSE
)
write.csv(assess_avg_df, file = assess_avg_csv, row.names = FALSE, na = '')
cat('Assessment averages CSV:', normalizePath(assess_avg_csv, winslash = '/'), '\n')
print(assess_avg_df)

# ---- 6) Specialization-wise averages ----
spec_avg <- aggregate(
  students_in[, assess_cols],
  by = list(Specialization = students_in$Specialization),
  FUN = function(x) round(mean(x, na.rm = TRUE), 2)
)
spec_avg$Overall_Average <- round(rowMeans(spec_avg[, assess_cols], na.rm = TRUE), 2)
spec_avg <- spec_avg[order(-spec_avg$Overall_Average, spec_avg$Specialization), ]
write.csv(spec_avg, file = spec_avg_csv, row.names = FALSE, na = '')
cat('Specialization averages CSV:', normalizePath(spec_avg_csv, winslash = '/'), '\n')
print(spec_avg)

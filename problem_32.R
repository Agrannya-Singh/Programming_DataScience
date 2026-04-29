# Created by Agrannya Singh (23BCE0965)
# Problem 32: Patient Test Score Analytics Using R Data Frames

# ---- 1) Create vectors ----
PatientID <- c('P001', 'P002', 'P003', 'P004', 'P005',
               'P006', 'P007', 'P008', 'P009', 'P010')
Name <- c('Ramesh', 'Suresh', 'Priya', 'Anitha', 'Karthik',
           'Divya', 'Rahul', 'Sneha', 'Vijay', 'Meena')
Department <- c('Cardiology', 'Neurology', 'Cardiology', 'Orthopedics', 'Neurology',
                'Orthopedics', 'Cardiology', 'Neurology', 'Orthopedics', 'Cardiology')
Diagnosis <- c('Hypertension', 'Migraine', 'Arrhythmia', 'Fracture', 'Epilepsy',
               'Arthritis', 'Heart Failure', 'Stroke', 'Sprain', 'Angina')
Test1 <- c(85, 78, 92, 70, 88, 65, 90, 82, 75, 88)
Test2 <- c(80, 82, 88, 72, 85, 70, 92, 78, 80, 85)
Test3 <- c(88, 75, 90, 68, 82, 72, 88, 85, 78, 90)
Test4 <- c(82, 80, 85, 75, 90, 68, 85, 80, 82, 87)
Test3_Score <- Test3

# ---- 2) Build data frame ----
patients <- data.frame(
  PatientID, Name, Department, Diagnosis,
  Test1, Test2, Test3, Test4, Test3_Score,
  stringsAsFactors = FALSE
)
str(patients)
head(patients)

# ---- 3) Patient-level Sum, Average, Rank ----
test_cols <- c('Test1', 'Test2', 'Test3', 'Test4')
patients$Sum <- rowSums(patients[, test_cols], na.rm = TRUE)
patients$Average <- round(patients$Sum / 4, 2)
patients$Rank <- rank(-patients$Sum, ties.method = 'min')
# Tie note: ties.method='min' assigns the lowest rank to all tied entries
print(patients)
print(patients[order(patients$Rank), ])

# ---- 4) Test-wise averages (overall) ----
test_wise_avg <- colMeans(patients[, test_cols], na.rm = TRUE)
print(round(test_wise_avg, 2))

# ---- 5) Department-wise averages ----
dept_avg <- aggregate(
  patients[, test_cols],
  by = list(Department = patients$Department),
  FUN = function(x) round(mean(x, na.rm = TRUE), 2)
)
dept_avg$Overall_Average <- round(rowMeans(dept_avg[, test_cols], na.rm = TRUE), 2)
dept_avg <- dept_avg[order(-dept_avg$Overall_Average), ]
print(dept_avg)

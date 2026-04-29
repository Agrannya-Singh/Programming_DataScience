# Created by Agrannya Singh (23BCE0965)
# Problem 33 (Q33): Patient Diagnostic Analytics Using R Data Frames

# ---- 1) Column vectors ----
PatientID <- c('HOS1001','HOS1002','HOS1003','HOS1004','HOS1005',
               'HOS1006','HOS1007','HOS1008','HOS1009','HOS1010')
Name <- c('Arjun Menon','Bhavana Iyer','Chirag Gupta','Devika Nair',
           'Eshwar Rao','Farida Sheikh','Gaurav Kumar',
           'Harini Krishnan','Ishita S','Jatin Verma')
Department <- c('Cardiology','Neurology','Endocrinology','Pulmonology',
                'Cardiology','Endocrinology','Neurology',
                'Pulmonology','Cardiology','Endocrinology')
Diagnosis <- c('Hypertension','Migraine','Type-2 Diabetes','Asthma',
               'Hypertension','Thyroid Disorder','Epilepsy',
               'COPD','Arrhythmia','Type-1 Diabetes')
Test1 <- c(82,71,90,64,95,60,78,68,87,83)
Test2 <- c(76,69,92,70,94,63,82,72,85,79)
Test3 <- c(88,73,86,67,93,61,79,70,90,77)
Test4 <- c(84,75,91,72,96,66,81,69,88,85)
Test3_Score <- Test3 # duplicate verification column

# ---- 2) Build data frame ----
patients <- data.frame(
  PatientID, Name, Department, Diagnosis,
  Test1, Test2, Test3, Test4, Test3_Score,
  stringsAsFactors = FALSE
)
str(patients)
head(patients)

# ---- 3) Patient-level Sum, Average, Rank ----
test_cols <- c('Test1','Test2','Test3','Test4')
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

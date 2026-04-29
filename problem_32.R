# ============================================================
# Lab 32 - Student Marks Analytics Using R Data Frames
# Tool: Base R only | Reg. No: 23BCE0965
# ============================================================

# --- Step 1: Define column vectors ----
Reg.No <- c('24BCE1001','24BCE1002','24BCE1003','24BCE1004','24BCE1005',
            '24BCE1006','24BCE1007','24BCE1008','24BCE1009','24BCE1010')
Name <- c('Aadesh Kumar','Bhavya Reddy','Charan Iyer','Divya Sharma',
          'Esha Nair','Farhan Khan','Gayathri Raj','Harish Kumar',
          'Ishita Menon','Jai Verma')
Programme <- rep('B.Tech', 10)
Specialization <- c('CSE','AI','DS','IT','CSE','ECE','Cyber','AI','DS','IT')
Subject1 <- c(86, 72, 90, 65, 94, 58, 77, 69, 88, 82)
Subject2 <- c(78, 68, 88, 70, 96, 62, 81, 75, 85, 79)
Subject3 <- c(91, 74, 85, 69, 93, 60, 79, 72, 90, 76)
Subject4 <- c(84, 80, 92, 73, 95, 66, 83, 70, 87, 85)

# --- Step 2: Build data frame ----
students <- data.frame(
  Reg.No = Reg.No, Name = Name, Programme = Programme,
  Specialization = Specialization,
  Subject1 = Subject1, Subject2 = Subject2,
  Subject3 = Subject3, Subject4 = Subject4,
  stringsAsFactors = FALSE)
str(students)
print(head(students))

# --- Step 3: Compute Sum (vectorised) ----
students$Sum <- rowSums(students[, c('Subject1','Subject2','Subject3','Subject4')])

# --- Step 4: Average ----
students$Average <- students$Sum / 4

# --- Step 5: Rank (highest Sum = Rank 1) ----
students$Rank <- rank(-students$Sum, ties.method = 'min')

# --- Step 6: Print in specified column order ----
cols <- c('Reg.No','Name','Programme','Specialization',
          'Subject1','Subject2','Subject3','Subject4','Sum','Average','Rank')
cat('\n=== Complete Student Marks Table ===\n')
print(students[, cols])

# --- Step 7: Sort by Rank ascending ----
cat('\n=== Sorted by Rank ===\n')
print(students[order(students$Rank), cols])

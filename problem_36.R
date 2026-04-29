# Created by Agrannya Singh (23BCE0965)
# Problem 36: Student Marks Analytics Using R Data Frames

# --- Step 1: Create vectors ----
Reg.No <- c('23BCE0001', '23BCE0002', '23BCE0003', '23BCE0004', '23BCE0005',
            '23BCE0006', '23BCE0007', '23BCE0008', '23BCE0009', '23BCE0010')
Name <- c('Aarav', 'Bhavya', 'Chetan', 'Divya', 'Esha',
          'Farhan', 'Gayathri', 'Harish', 'Ishita', 'Jai')
Programme <- rep('B.Tech', 10)
Specialization <- c('CSE', 'AI', 'DS', 'IT', 'CSE', 'ECE', 'Cyber', 'AI', 'DS', 'IT')
Subject1 <- c(85, 78, 92, 70, 88, 65, 90, 82, 75, 88)
Subject2 <- c(80, 82, 88, 72, 85, 70, 92, 78, 80, 85)
Subject3 <- c(88, 75, 90, 68, 82, 72, 88, 85, 78, 90)
Subject4 <- c(82, 80, 85, 75, 90, 68, 85, 80, 82, 87)

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
students$Sum <- rowSums(students[, c('Subject1', 'Subject2', 'Subject3', 'Subject4')])

# --- Step 4: Average ----
students$Average <- students$Sum / 4

# --- Step 5: Rank (highest Sum = Rank 1) ----
students$Rank <- rank(-students$Sum, ties.method = 'min')

# --- Step 6: Print in specified column order ----
cols <- c('Reg.No', 'Name', 'Programme', 'Specialization',
          'Subject1', 'Subject2', 'Subject3', 'Subject4', 'Sum', 'Average', 'Rank')
cat('\n=== Complete Student Marks Table ===\n')
print(students[, cols])

# --- Step 7: Sort by Rank ascending ----
cat('\n=== Sorted by Rank ===\n')
print(students[order(students$Rank), cols])

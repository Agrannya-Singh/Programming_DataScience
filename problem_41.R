# ============================================================
# Lab 41 - Reshaping and Cleaning with tidyr Key Functions
# Packages: tidyr, dplyr | Reg. No: 23BCE0965
# ============================================================

for (pkg in c('tidyr', 'dplyr')) {
  if (!requireNamespace(pkg, quietly = TRUE))
    install.packages(pkg)
  library(pkg, character.only = TRUE)
}

# --- Build messy dataset ----
messy <- data.frame(
  StudentID = 1:4,
  Name = c('Alice','Bob','Charlie','Dana'),
  Math_2020 = c(85, 90, NA, 70),
  Math_2021 = c(88, NA, 78, 75),
  Eng_2020 = c(80, 92, 85, NA),
  Eng_2021 = c(82, 95, NA, 77),
  ExtraInfo = c('A-2020-S1','B-2021-S2','C-2020-S1', NA),
  stringsAsFactors = FALSE)
cat('\n--- Original messy data ---\n')
print(messy)

# --- Step 1: pivot_longer ----
long1 <- messy |>
  pivot_longer(cols = Math_2020:Eng_2021,
               names_to = 'SubjectYear',
               values_to = 'Score')
cat('\n--- After pivot_longer() ---\n')
print(long1)

# --- Step 2: separate SubjectYear ----
long2 <- long1 |>
  separate(col = 'SubjectYear', into = c('Subject','Year'), sep = '_')
cat('\n--- After separate() ---\n')
print(long2)

# --- Step 3: drop_na ----
long3 <- long2 |> drop_na(Score)
cat('\n--- After drop_na(): rows =', nrow(long3), '---\n')
print(long3)

# --- Step 4: separate ExtraInfo ----
extra <- messy |> drop_na(ExtraInfo) |>
  separate('ExtraInfo', into = c('Initial','InfoYear','Section'), sep = '-')
print(extra[, c('StudentID','Name','Initial','InfoYear','Section')])

# --- Step 5: pivot_wider ----
wide2 <- long3 |>
  pivot_wider(names_from = 'Year',
              values_from = 'Score')
cat('\n--- After pivot_wider() ---\n')
print(wide2)

# --- Step 6: unite ----
united <- wide2 |> unite(col = 'Name_Subject', Name, Subject, sep = '_')
cat('\n--- After unite() ---\n')
print(united)

# --- Step 7: fill ----
att <- data.frame(
  StudentID = c(1, 1, 1, 2, 2, 2),
  Subject = c('Math','Eng','Science','Math','Eng','Science'),
  Attendance = c(90, NA, NA, 85, NA, 92))
att_filled <- att |> group_by(StudentID) |>
  fill(Attendance, .direction = 'down') |> ungroup()
cat('\n--- After fill() ---\n')
print(att_filled)

# Created by Agrannya Singh (23 BCE0965 )
teams <- list(
Team A = c(90 , 85 , 88),
Team B = c(78 , 82 , 79),
Team C = c(88 , 92 , 90)
)
# 3. Avg Score
avgs <- sapply( teams , mean )
cat(" Average Scores :\n")
print( avgs)
# 4. Rank ( Sort desc ending )
cat(" Rank ings :" , names( sort( avgs , decreasing = TRUE )), "\n")
# Created by Agrannya Singh (23 BCE0965 )
teams <- list(
Team A = c(90 , 85 , 88),
Team B = c(78 , 82 , 79),
Team C = c(88 , 92 , 90)
)
# 3. Avg Score
avgs <- sapply( teams , mean )
cat(" Average Scores :\n")
print( avgs)
# 4. Rank ( Sort desc ending )
cat(" Rank ings :" , names( sort( avgs , decreasing = TRUE )), "\n")
# ---- 2) Build data frame ---patients <- data.frame(
PatientID, Name, Department, Diagnosis,
Test1, Test2, Test3, Test4, Test3_Score,
stringsAsFactors = FALSE
)
str(patients)
head(patients)
# ---- 3) Patient-level Sum, Average, Rank ---test_cols <- c('Test1','Test2','Test3','Test4')
patients$Sum
<- rowSums(patients[, test_cols], na.rm = TRUE)
patients$Average <- round(patients$Sum / 4, 2)
patients$Rank
<- rank(-patients$Sum, ties.method = 'min')
# Tie note: ties.method='min' assigns the lowest rank to all tied entries
print(patients)
print(patients[order(patients$Rank), ])
# ---- 4) Test-wise averages (overall) ---test_wise_avg <- colMeans(patients[, test_cols], na.rm = TRUE)
print(round(test_wise_avg, 2))
# ---- 5) Department-wise averages ---dept_avg <- aggregate(
patients[, test_cols],
by = list(Department = patients$Department),
FUN = function(x) round(mean(x, na.rm = TRUE), 2)
)
dept_avg$Overall_Average <- round(rowMeans(dept_avg[, test_cols], na.rm=TRUE),2)
dept_avg <- dept_avg[order(-dept_avg$Overall_Average), ]
print(dept_avg)
if (length(missing) > 0) stop('Missing columns: ', paste(missing, collapse=', '))
for (cn in quarter_cols) {
if (!is.numeric(branches_in[[cn]])) {
branches_in[[cn]] <- as.numeric(branches_in[[cn]])
}
}
## ---- 4) Per-branch analytics ---branches_in$Sum
<- rowSums(branches_in[, quarter_cols], na.rm=TRUE)
branches_in$Average <- branches_in$Sum / length(quarter_cols)
branches_in$Rank
<- rank(-branches_in$Sum, ties.method='min')
branches_by_rank
<- branches_in[order(branches_in$Rank, branches_in$BranchID),
]
cat("\n=== 2. Branches by Rank ===\n")
write.csv(branches_by_rank, file="", row.names=FALSE, na='')
## ---- 5) Quarter-wise averages ---quarter_wise_avg <- colMeans(branches_in[, quarter_cols], na.rm=TRUE)
quarter_avg_df
<- data.frame(
Quarter=names(quarter_wise_avg),
Average=as.numeric(quarter_wise_avg),
stringsAsFactors=FALSE
)
cat("\n=== 3. Quarter-wise Averages ===\n")
write.csv(quarter_avg_df, file="", row.names=FALSE, na='')
## ---- 6) Region-wise averages ---region_quarter_avg <- aggregate(
branches_in[, quarter_cols],
by = list(Region = branches_in$Region),
FUN = function(x) mean(x, na.rm=TRUE)
)
region_quarter_avg$Overall_Average <rowMeans(region_quarter_avg[, quarter_cols], na.rm=TRUE)
region_quarter_avg <- region_quarter_avg[
order(-region_quarter_avg$Overall_Average, region_quarter_avg$Region), ]
cat("\n=== 4. Region-wise Averages ===\n")
write.csv(region_quarter_avg, file="", row.names=FALSE, na='')
cat("\n")
## ---- 0) File names ---input_csv
<- 'students_input.csv'
rank_csv
<- 'students_by_rank.csv'
assess_avg_csv <- 'assessment_wise_averages.csv'
spec_avg_csv
<- 'specialization_wise_averages.csv'
## ---- 1) Create vectors ---RegNo <- c('24BCE1001','24BCE1002','24BCE1003','24BCE1004','24BCE1005',
'24BCE1006','24BCE1007','24BCE1008','24BCE1009','24BCE1010')
Name
<- c('Aadesh Kumar','Bhavya Reddy','Charan Iyer','Divya Sharma',
'Esha Nair','Farhan Khan','Gayathri Raj',
'Harish Kumar','Ishita Menon','Jai Verma')
Programme
<- rep('B.Tech', 10)
Specialization <- c('CSE','AI','DS','IT','CSE','ECE','Cyber','AI','DS','IT')
Assess1 <- c(18,15,20,14,20,12,17,16,19,18)
Assess2 <- c(17,16,19,15,20,14,18,17,18,17)
Assess3 <- c(19,14,18,15,19,13,17,16,19,16)
Assess4 <- c(18,18,20,16,20,16,19,15,18,19)
## ---- 2) Build data frame and write CSV ---students <- data.frame(
RegNo, Name, Programme, Specialization,
Assess1, Assess2, Assess3, Assess4,
stringsAsFactors = FALSE
)
write.csv(students, file=input_csv, row.names=FALSE, na='')
cat('Input CSV written:', normalizePath(input_csv, winslash='/'), '\n')
## ---- 3) Read CSV for analytics ---students_in <- read.csv(input_csv, stringsAsFactors=FALSE, check.names=TRUE)
str(students_in)
assess_cols
<- c('Assess1','Assess2','Assess3','Assess4')
required_cols <- c('RegNo','Name','Programme','Specialization', assess_cols)
missing <- setdiff(required_cols, names(students_in))
if (length(missing) > 0) stop('Missing columns: ', paste(missing, collapse=', '))
for (cn in assess_cols)
if (!is.numeric(students_in[[cn]])) students_in[[cn]] <as.numeric(students_in[[cn]])
## ---- 4) Per-student analytics ---students_in$Total
<- rowSums(students_in[, assess_cols], na.rm=TRUE)
students_in$Average <- round(students_in$Total / 4, 2)
students_in$Rank
<- rank(-students_in$Total, ties.method='min')
students_by_rank
<- students_in[order(students_in$Rank, students_in$RegNo), ]
write.csv(students_by_rank, file=rank_csv, row.names=FALSE, na='')
cat('Ranked output CSV:', normalizePath(rank_csv, winslash='/'), '\n')
## ---- 5) Assessment-wise averages ---assess_avg
<- colMeans(students_in[, assess_cols], na.rm=TRUE)
assess_avg_df <- data.frame(
Assessment = names(assess_avg),
Average
= round(as.numeric(assess_avg), 2),
stringsAsFactors = FALSE
)
write.csv(assess_avg_df, file=assess_avg_csv, row.names=FALSE, na='')
cat('Assessment averages CSV:', normalizePath(assess_avg_csv, winslash='/'), '\n')
print(assess_avg_df)
## ---- 6) Specialization-wise averages ---spec_avg <- aggregate(
students_in[, assess_cols],
by = list(Specialization = students_in$Specialization),
FUN = function(x) round(mean(x, na.rm=TRUE), 2)
)
spec_avg$Overall_Average <round(rowMeans(spec_avg[, assess_cols], na.rm=TRUE), 2)
spec_avg <- spec_avg[order(-spec_avg$Overall_Average, spec_avg$Specialization), ]
write.csv(spec_avg, file=spec_avg_csv, row.names=FALSE, na='')
cat('Specialization averages CSV:', normalizePath(spec_avg_csv, winslash='/'),
'\n')
print(spec_avg)
# ---- 2) Build data frame ---patients <- data.frame(
PatientID, Name, Department, Diagnosis,
Test1, Test2, Test3, Test4, Test3_Score,
stringsAsFactors = FALSE
)
str(patients)
head(patients)
# ---- 3) Patient-level Sum, Average, Rank ---test_cols <- c('Test1','Test2','Test3','Test4')
patients$Sum
<- rowSums(patients[, test_cols], na.rm = TRUE)
patients$Average <- round(patients$Sum / 4, 2)
patients$Rank
<- rank(-patients$Sum, ties.method = 'min')
# Tie note: ties.method='min' assigns the lowest rank to all tied entries
print(patients)
print(patients[order(patients$Rank), ])
# ---- 4) Test-wise averages (overall) ---test_wise_avg <- colMeans(patients[, test_cols], na.rm = TRUE)
print(round(test_wise_avg, 2))
# ---- 5) Department-wise averages ---dept_avg <- aggregate(
patients[, test_cols],
by = list(Department = patients$Department),
FUN = function(x) round(mean(x, na.rm = TRUE), 2)
)
dept_avg$Overall_Average <- round(rowMeans(dept_avg[, test_cols], na.rm=TRUE),2)
dept_avg <- dept_avg[order(-dept_avg$Overall_Average), ]
print(dept_avg)
# ---- vii) Average LMI grouped by homeworld ---lmi_by_world <- aggregate(
LMI ~ homeworld, data = humans,
FUN = function(x) round(mean(x, na.rm = TRUE), 2)
)
lmi_by_world <- lmi_by_world[order(-lmi_by_world$LMI), ]
cat('=== Average LMI by Homeworld ===\n')
print(lmi_by_world)
# ---- viii.a) Histogram of LMI ---humans_complete <- humans[!is.na(humans$LMI), ]
hist(humans_complete$LMI,
breaks = 8,
col
= 'steelblue',
border = 'white',
main
= 'Histogram of LMI for Human Characters',
xlab
= 'Lean Mass Index (LMI)',
ylab
= 'Frequency')
grid()
# ---- viii.b) Density plot by homeworld ---worlds <- unique(na.omit(humans_complete$homeworld))
cols
<- rainbow(length(worlds))
plot(
density(humans_complete$LMI, na.rm = TRUE),
main = 'LMI Density Distribution for Human Characters',
xlab = 'LMI', ylab = 'Density',
col = 'black', lwd = 2
)
for (i in seq_along(worlds)) {
sub_lmi <- humans_complete$LMI[humans_complete$homeworld == worlds[i]]
if (length(sub_lmi) > 1)
lines(density(sub_lmi), col = cols[i], lwd = 2)
}
legend('topright', legend = worlds, col = cols,
lwd = 2, title = 'Homeworld', cex = 0.7)
# ---- viii.c) Bar chart: avg LMI by height bin ---humans_complete$HeightBin <- cut(
humans_complete$height,
breaks = c(-Inf, 150, 179, 209, Inf),
labels = c('Below 150','150-179','180-209','210 & above')
)
avg_lmi_bin <- tapply(humans_complete$LMI,
humans_complete$HeightBin, mean, na.rm=TRUE)
barplot(avg_lmi_bin,
col = c('lightblue','lightgreen','lightyellow','salmon'),
main = 'Average LMI by Height Bin (Human Characters)',
xlab = 'Height Bin',
ylab = 'Average LMI',
border = 'grey40')
grid(axis = 'y')
# --- Step 2: Build data frame --students <- data.frame(
Reg.No = Reg.No, Name = Name, Programme = Programme,
Specialization = Specialization,
Subject1 = Subject1, Subject2 = Subject2,
Subject3 = Subject3, Subject4 = Subject4,
stringsAsFactors = FALSE)
str(students)
print(head(students))
# --- Step 3: Compute Sum (vectorised) --students$Sum <- rowSums(students[,
c('Subject1','Subject2','Subject3','Subject4')])
# --- Step 4: Average --students$Average <- students$Sum / 4
# --- Step 5: Rank (highest Sum = Rank 1) --students$Rank <- rank(-students$Sum, ties.method = 'min')
# --- Step 6: Print in specified column order --cols <- c('Reg.No','Name','Programme','Specialization',
'Subject1','Subject2','Subject3','Subject4','Sum','Average','Rank
')
cat('\n=== Complete Student Marks Table ===\n')
print(students[, cols])
# --- Step 7: Sort by Rank ascending --cat('\n=== Sorted by Rank ===\n')
print(students[order(students$Rank), cols])
Student Reg. No:
23BCE0965
Name: Agrannya Singh
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
5|P a g e
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
Date:
Program S. No.
# --- Step 2: Donations dataset --Donations <- data.frame(
DonorName = c('Maria Franca Fissolo','Yang Huiyan',
'Maria Franca Fissolo','Alice Walton',
'Susanne Klatte','Yang Huiyan'),
Amount = c(100, 50, 75, 25, 100, 150),
Date
= as.Date(c('2018-02-15','2018-02-15','2018-02-16',
'2018-02-17','2018-02-17','2018-02-18')),
stringsAsFactors = FALSE)
cat('\n--- Donors ---\n');
print(Donors)
cat('\n--- Donations ---\n'); print(Donations)
# --- LEFT JOIN --cat('\n=== LEFT JOIN ===\n')
print(left_join(Donors, Donations, by = 'DonorName'))
# --- RIGHT JOIN --cat('\n=== RIGHT JOIN ===\n')
print(right_join(Donors, Donations, by = 'DonorName'))
# --- INNER JOIN --cat('\n=== INNER JOIN ===\n')
inner <- inner_join(Donors, Donations, by = 'DonorName')
print(inner)
# --- FULL OUTER JOIN --cat('\n=== FULL OUTER JOIN ===\n')
print(full_join(Donors, Donations, by = 'DonorName'))
# --- Summary: total per donor --cat('\n=== Total Donated per Registered Donor ===\n')
print(inner |>
group_by(DonorName) |>
summarise(Total = sum(Amount), Transactions = n(), .groups =
'drop') |>
arrange(desc(Total)))
Student Reg. No:
23BCE0965
Name: Agrannya Singh
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
8|P a g e
Date:
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
Program S. No.
cat('\n--- Customers ---\n');
cat('\n--- Purchases ---\n');
print(Customers)
print(Purchases)
# --- LEFT JOIN --cat('\n=== LEFT JOIN ===\n')
print(left_join(Customers, Purchases, by = 'CustomerName'))
# --- RIGHT JOIN --cat('\n=== RIGHT JOIN ===\n')
print(right_join(Customers, Purchases, by = 'CustomerName'))
# --- INNER JOIN --cat('\n=== INNER JOIN ===\n')
inner <- inner_join(Customers, Purchases, by = 'CustomerName')
print(inner)
# --- FULL OUTER JOIN --cat('\n=== FULL OUTER JOIN ===\n')
print(full_join(Customers, Purchases, by = 'CustomerName'))
# --- Rank top spenders --cat('\n=== Top Spenders (from inner join) ===\n')
print(inner |>
arrange(desc(PurchaseAmount)) |>
mutate(Rank = row_number()) |>
select(Rank, CustomerName, PurchaseAmount, Date))
cat(sprintf('Average purchase: $%.2f\n',
mean(Purchases$PurchaseAmount)))
Student Reg. No:
23BCE0965
Name: Agrannya Singh
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
12 | P a g e
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
Date:
Program S. No.
Student Reg. No:
23BCE0965
Name: Agrannya Singh
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
15 | P a g e
Date:
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
Program S. No.
# ============================================================
# Lab 40 - Wide/Long Transformations using tidyr
# Package: tidyr (>= 1.0) | Reg. No: 23BCE0965
# ============================================================
if (!requireNamespace('tidyr', quietly = TRUE))
install.packages('tidyr')
library(tidyr)
# --- PART A: Wide to Long --wide_data <- data.frame(
ID = 1:3,
Year2019 = c(10, 15, 20),
Year2020 = c(12, 18, 24))
cat('\n--- Original WIDE data ---\n')
print(wide_data)
long_data <- wide_data |>
pivot_longer(cols
= c(Year2019, Year2020),
names_to = 'Year',
values_to = 'Value')
cat('\n--- Converted to LONG format ---\n')
print(long_data)
cat('Rows:', nrow(long_data), ' Cols:', ncol(long_data), '\n')
# --- PART B: Long to Wide --long_data2 <- data.frame(
ID
= c(1, 1, 2, 2, 3, 3),
Year = c('2019','2020','2019','2020','2019','2020'),
Value = c(10, 12, 15, 18, 20, 24))
cat('\n--- Original LONG data ---\n')
print(long_data2)
wide_data2 <- long_data2 |>
pivot_wider(names_from = 'Year',
values_from = 'Value')
cat('\n--- Restored to WIDE format ---\n')
print(wide_data2)
# --- Round-trip verification --names(wide_data2) <- c('ID', 'Year2019', 'Year2020')
cat('\n--- Round-trip check (TRUE = identical) ---\n')
cat(isTRUE(all.equal(as.data.frame(wide_data),
as.data.frame(wide_data2))), '\n')
# --- Step 1: pivot_longer --long1 <- messy |>
pivot_longer(cols = Math_2020:Eng_2021,
names_to = 'SubjectYear',
values_to = 'Score')
cat('\n--- After pivot_longer() ---\n'); print(long1)
# --- Step 2: separate SubjectYear --long2 <- long1 |>
separate(col = 'SubjectYear', into = c('Subject','Year'), sep =
'_')
cat('\n--- After separate() ---\n'); print(long2)
# --- Step 3: drop_na --long3 <- long2 |> drop_na(Score)
cat('\n--- After drop_na(): rows =', nrow(long3), '---\n')
print(long3)
# --- Step 4: separate ExtraInfo --extra <- messy |> drop_na(ExtraInfo) |>
separate('ExtraInfo', into = c('Initial','InfoYear','Section'),
sep = '-')
print(extra[,
c('StudentID','Name','Initial','InfoYear','Section')])
# --- Step 5: pivot_wider --wide2 <- long3 |>
pivot_wider(names_from = 'Year',
values_from = 'Score')
cat('\n--- After pivot_wider() ---\n'); print(wide2)
# --- Step 6: unite ---
Student Reg. No:
23BCE0965
Name: Agrannya Singh
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
20 | P a g e
Date:
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
Program S. No.
united <- wide2 |> unite(col = 'Name_Subject', Name, Subject, sep
= '_')
cat('\n--- After unite() ---\n'); print(united)
# --- Step 7: fill --att <- data.frame(
StudentID = c(1, 1, 1, 2, 2, 2),
Subject
= c('Math','Eng','Science','Math','Eng','Science'),
Attendance = c(90, NA, NA, 85, NA, 92))
att_filled <- att |> group_by(StudentID) |>
fill(Attendance, .direction = 'down') |> ungroup()
cat('\n--- After fill() ---\n'); print(att_filled)
# --- Step 3: Inspect tables --available <- dbListTables(con)
cat('Tables:', paste(available, collapse = ', '), '\n')
if (!'songs' %in% available) {
dbDisconnect(con); stop('Table songs not found.')
}
# --- Step 4: Lazy tbl reference --songs_tbl <- tbl(con, 'songs')
cat('Columns:', paste(colnames(songs_tbl), collapse = ', '),
'\n')
# --- Step 5: Build and show query --ARTIST_ID <- 11L
# Queen
queen_query <- songs_tbl |>
filter(artist_id == ARTIST_ID) |>
select(title, artist_id)
cat('\n=== Generated SQL ===\n')
show_query(queen_query)
# --- Step 6: Collect results --queen_songs <- queen_query |> collect()
cat('\n=== Queen Songs (artist_id =', ARTIST_ID, ') ===\n')
print(queen_songs)
cat('Total:', nrow(queen_songs), 'songs\n')
# --- Step 7: Aggregate - top 10 artists --cat('\n=== Top 10 Artists by Song Count ===\n')
print(songs_tbl |>
group_by(artist_id) |>
summarise(song_count = n(), .groups = 'drop') |>
Student Reg. No:
23BCE0965
Name: Agrannya Singh
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
25 | P a g e
Date:
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
Program S. No.
arrange(desc(song_count)) |>
head(10) |> collect())
# --- Step 8: Raw SQL alternative --sql <- paste('SELECT title, artist_id FROM songs',
'WHERE artist_id =', ARTIST_ID, 'ORDER BY title
ASC')
cat('\n=== Raw SQL Result ===\n')
print(dbGetQuery(con, sql))
# --- Step 9: Disconnect --dbDisconnect(con)
cat('Connection closed.\n')
# --- Step 1: Auto-create sample if file absent --if (!file.exists(input_file)) {
sample <- list(products = list(
list(id=1, name='Laptop',
category='Electronics',
price=999.99, stock=50),
list(id=2, name='Keyboard',
category='Electronics',
price=79.99, stock=200),
list(id=3, name='Desk Chair', category='Furniture',
price=299.99, stock=30),
list(id=4, name='Monitor',
category='Electronics',
price=399.99, stock=75),
list(id=5, name='Notebook',
category='Stationery',
price=4.99,
stock=500)))
write_json(sample, input_file, pretty = TRUE, auto_unbox =
TRUE)
cat('Sample inventory.json created.\n')
}
# --- Step 2: Read existing inventory --inventory <- fromJSON(input_file, simplifyDataFrame = TRUE)
cat('\n=== Current Inventory ===\n')
print(inventory$products)
# --- Step 3: Add new product --max_id
<- max(inventory$products$id, na.rm = TRUE)
new_product <- data.frame(
id = max_id + 1L, name = 'Wireless Mouse',
category = 'Electronics', price = 49.99, stock = 150L,
stringsAsFactors = FALSE)
cat('\n=== New Product ===\n'); print(new_product)
inventory$products <- rbind(inventory$products, new_product)
# --- Step 4: Write updated inventory --write_json(inventory, output_file, pretty = TRUE, auto_unbox =
TRUE)
cat('\nWritten to:', output_file, '\n')
# --- Step 5: Verify by re-reading --verified <- fromJSON(output_file, simplifyDataFrame = TRUE)
cat('\n=== Verified Contents ===\n')
print(verified$products)
# --- Step 6: Summary statistics ---
Student Reg. No:
23BCE0965
Name: Agrannya Singh
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
29 | P a g e
Date:
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
Program S. No.
prods <- verified$products
cat(sprintf('\nTotal products : %d\n',
nrow(prods)))
cat(sprintf('Total stock
: %d units\n', sum(prods$stock)))
cat(sprintf('Avg price
: $%.2f\n',
mean(prods$price)))
cat(sprintf('Most expensive : %s ($%.2f)\n',
prods$name[which.max(prods$price)],
max(prods$price)))
cat(sprintf('Cheapest
: %s ($%.2f)\n',
prods$name[which.min(prods$price)],
min(prods$price)))
cat('\n=== Stock by Category ===\n')
sb <- aggregate(stock ~ category, data = prods, FUN = sum)
print(sb[order(-sb$stock), ])
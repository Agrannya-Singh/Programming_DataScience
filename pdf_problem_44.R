# Verify the dataset before plotting
print(data)
# ── Step 3.1.1: Basic Scatter Plot
──────────────────────────────
# Plots 'a' on x-axis and 'b' on y-axis with default points
ggplot(data = data, aes(x = a, y = b)) +
geom_point() +
labs(title = "Scatter Plot",
x
= "X-axis",
y
= "Y-axis")
# ── Step 3.1.2: Scatter Plot with Color Customization
───────────
# Forest-green points sized at 1 — subtle but distinguishable
ggplot(data = data, aes(x = a, y = b)) +
geom_point(color = "forestgreen", size = 1) +
labs(title = "Scatter Plot with Color Customization",
x
= "X-axis",
y
= "Y-axis")
# ── Step 3.1.3: Scatter Plot with Text Labels
───────────────────
# vjust = -1 lifts the label above each point to avoid overlap
ggplot(data = data, aes(x = a, y = b)) +
geom_point(color = "forestgreen", size = 3) +
geom_text(aes(label = label), vjust = -1, color = "blue") +
labs(title = "Scatter Plot with Text Labels",
x
= "X-axis",
Student Reg. No:23BCE0965
Name: Agrannya Singh
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
3 | Page
Date:
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
y
Program S. No. 44
= "Y-axis")
# ── Step 3.1.4: Scatter Plot with Linear Smoothing Line
─────────
# method = "lm" → linear regression line
# se = FALSE
→ hide the grey confidence-band shading
ggplot(data = data, aes(x = a, y = b)) +
geom_point(color = "forestgreen", size = 1) +
geom_smooth(method = "lm", se = FALSE) +
labs(title = "Scatter Plot with Smooth Line",
x
= "X-axis",
y
= "Y-axis")
# ── Step 3.2: Customised Line Plot
──────────────────────────────
# linewidth replaces the deprecated 'size' argument for lines
ggplot(data = data, aes(x = a, y = b)) +
geom_line(color = "red", linewidth = 1) +
labs(title = "Line Plot",
x
= "X-axis",
y
= "Y-axis")
# ── Step 3.3: Customised Bar Plot
───────────────────────────────
# stat = "identity" uses the actual 'b' values as bar heights
# fill = "blue" applies a uniform blue color to all bars
ggplot(data = data, aes(x = a, y = b)) +
geom_bar(stat = "identity", fill = "blue") +
labs(title = "Bar Plot",
x
= "X-axis",
y
= "Values")
# ── Step 2.1: Scatter Plot — College Education vs Adult Poverty
──
dev.new() # Opens Window 1
ggplot(data = midwest) +
geom_point(mapping = aes(x = percollege, y = percadultpoverty))
+
labs(title = "2.1: Basic Scatter Plot")
# ── Step 2.2: Scatter Plot with LOESS Trend Line
─────────────────
dev.new() # Opens Window 2
ggplot(data = midwest) +
geom_point(mapping = aes(x = percollege, y =
percadultpoverty)) +
geom_smooth(mapping = aes(x = percollege, y =
percadultpoverty)) +
labs(title = "2.2: Scatter Plot with LOESS")
# ── Step 2.3: Bar Chart — Total Population per State
────────────
dev.new() # Opens Window 3
ggplot(data = midwest) +
geom_col(mapping = aes(x = state, y = poptotal)) +
labs(title = "2.3: Total Population per State")
Student Reg. No:
Name:
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
3 | Page
Date:
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
Program S. No.
# ── Step 2.4: Hexagonal Heatmap
─────────────────────────────────
dev.new() # Opens Window 4
ggplot(data = midwest) +
geom_hex(mapping = aes(x = percollege, y = percadultpoverty)) +
labs(title = "2.4: Hexagonal Heatmap")
# ── Step 2.5: Shared Aesthetic Mappings (DRY principle)
──────────
dev.new() # Opens Window 5
ggplot(data
= midwest,
mapping = aes(x = percollege, y = percadultpoverty)) +
geom_point() +
geom_smooth() +
geom_point(mapping = aes(y = percchildbelowpovert), color =
"orange") +
labs(title = "2.5: Shared Aesthetics & Overrides")
# ── Step 2.6: Color Mapping by State
────────────────────────────
dev.new() # Opens Window 6
ggplot(data = midwest) +
geom_point(mapping = aes(x
= percollege,
y
= percadultpoverty,
color = state)) +
labs(title = "2.6: Color Mapping by State")
# ── Step 2.7: Constant Color and Transparency
───────────────────
dev.new() # Opens Window 7
ggplot(data = midwest) +
geom_point(mapping = aes(x = percollege, y = percadultpoverty),
color
= "red",
alpha
= 0.3) +
labs(title = "2.7: Constant Color and Alpha")
# ── Step 3: Scatter Plot with Styled Points and Condition Labels
─
# Plant_ID
→ x-axis (discrete plant identifier)
# Growth_Rate → y-axis (continuous measurement)
# Points are rendered in dodgerblue at size 4 for high
visibility.
# Condition labels are placed below each point (vjust = 2) in
darkorange
# so they are easy to read without overlapping the markers.
ggplot(data = plant_data,
aes(x = Plant_ID, y = Growth_Rate)) +
# ── Styled scatter points
──────────────────────────────────────
geom_point(color = "dodgerblue",
size = 4) +
# ── Condition labels below each point
─────────────────────────
geom_text(aes(label = Condition_Label),
vjust = 2,
# positive vjust pushes
label downward
color = "darkorange") +
# ── Axis labels and title
──────────────────────────────────────
labs(title = "Scatter Plot of Plant Growth Data",
x
= "Plant ID",
y
= "Growth Rate")

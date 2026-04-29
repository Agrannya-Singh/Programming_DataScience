# ── Step 2: Static Scatter Plot with ggplot2
────────────────────
# Visualize Sepal.Width (x) vs Petal.Width (y), colored by
Species.
# Storing the plot in 'static_plot' allows it to be passed to
ggplotly().
static_plot <- ggplot(data = iris,
aes(x
= Sepal.Width,
y
= Petal.Width,
color = Species)) +
geom_point(size = 3) +
labs(title = "Iris: Sepal Width vs Petal Width",
x
= "Sepal Width (cm)",
y
= "Petal Width (cm)")
# Display the static plot
static_plot
# ── Step 3: Convert to Interactive Plot with ggplotly()
──────────
# ggplotly() wraps the ggplot2 object — hover, zoom, and pan
enabled
interactive_plot <- ggplotly(static_plot)
interactive_plot
# ── Step 4: Native Plotly Scatter Plot
──────────────────────────
# plot_ly() gives finer control; tilde (~) syntax maps data
columns.
# type = "scatter" with mode = "markers" produces a scatter plot.
# layout() pipes in axis labels and tick suffix annotations.
plot_ly(data = iris,
x
= ~Sepal.Width,
# maps Sepal.Width column
to x-axis
y
= ~Petal.Width,
# maps Petal.Width column
to y-axis
color = ~Species,
# distinct color per
species
type = "scatter",
Student Reg. No:23BCE0965
Name: Agrannya Singh
Faculty: Dr Rajasekhara Babu M, Professor, School of CSE, Vellore Institute of Technology (VIT), Vellore
3 | Page
Date:
2025 WINTER SEMESTER
Programming for Data Science Lab (BCSE207P) Record
Practice Program/ Exercise Program
Week No.:
Program S. No. 47
mode = "markers") %>%
layout(
title = "Iris Data Set Visualization",
xaxis = list(
title
= "Sepal Width",
ticksuffix = " cm"
# appends " cm" to every
x-axis tick
),
yaxis = list(
title
= "Petal Width",
ticksuffix = " cm"
# appends " cm" to every
y-axis tick
)
)
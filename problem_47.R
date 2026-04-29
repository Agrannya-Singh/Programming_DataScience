# ─────────────────────────────────────────────────────────────────
# Author: Agrannya Singh | Reg No: 23BCE0965
# Lab 47 | Interactive Visualization with the Iris Dataset
# Course : BCSE207P — Programming for Data Science
# Faculty : Dr. M Rajasekhara Babu
# ─────────────────────────────────────────────────────────────────

# ── Step 1: Install and Load Required Packages ───────────────────
# install.packages("ggplot2")     # uncomment and run once
# install.packages("plotly")      # uncomment and run once
library(ggplot2)                   # static plotting layer
library(plotly)                    # converts ggplot to interactive / native plots

# The iris dataset is built into base R — no separate loading required
# Peek at the data structure
str(iris)

# ── Step 2: Static Scatter Plot with ggplot2 ────────────────────
# Visualize Sepal.Width (x) vs Petal.Width (y), colored by Species.
# Storing the plot in 'static_plot' allows it to be passed to ggplotly().
static_plot <- ggplot(data = iris,
                      aes(x     = Sepal.Width,
                          y     = Petal.Width,
                          color = Species)) +
  geom_point(size = 3) +
  labs(title = "Iris: Sepal Width vs Petal Width",
       x     = "Sepal Width (cm)",
       y     = "Petal Width (cm)")

# Display the static plot
static_plot

# ── Step 3: Convert to Interactive Plot with ggplotly() ──────────
# ggplotly() wraps the ggplot2 object — hover, zoom, and pan enabled
interactive_plot <- ggplotly(static_plot)
interactive_plot

# ── Step 4: Native Plotly Scatter Plot ──────────────────────────
# plot_ly() gives finer control; tilde (~) syntax maps data columns.
# type = "scatter" with mode = "markers" produces a scatter plot.
# layout() pipes in axis labels and tick suffix annotations.
plot_ly(data  = iris,
        x     = ~Sepal.Width,     # maps Sepal.Width column to x-axis
        y     = ~Petal.Width,     # maps Petal.Width column to y-axis
        color = ~Species,         # distinct color per species
        type  = "scatter",
        mode  = "markers") %>%
  layout(
    title = "Iris Data Set Visualization",
    xaxis = list(
      title      = "Sepal Width",
      ticksuffix = " cm"          # appends " cm" to every x-axis tick
    ),
    yaxis = list(
      title      = "Petal Width",
      ticksuffix = " cm"          # appends " cm" to every y-axis tick
    )
  )

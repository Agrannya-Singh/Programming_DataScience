# Created by Agrannya Singh (23BCE0965)
# Problem 46: Iris Dataset - Static and Interactive Scatter Plots

if (!requireNamespace('ggplot2', quietly = TRUE)) install.packages('ggplot2')
if (!requireNamespace('plotly', quietly = TRUE)) install.packages('plotly')
library(ggplot2)
library(plotly)

# --- Step 2: Static Scatter Plot with ggplot2 ----
# Visualize Sepal.Width (x) vs Petal.Width (y), colored by Species.
# Storing the plot in 'static_plot' allows it to be passed to ggplotly().
static_plot <- ggplot(data = iris,
                      aes(x = Sepal.Width,
                          y = Petal.Width,
                          color = Species)) +
  geom_point(size = 3) +
  labs(title = "Iris: Sepal Width vs Petal Width",
       x = "Sepal Width (cm)",
       y = "Petal Width (cm)")
# Display the static plot
static_plot

# --- Step 3: Convert to Interactive Plot with ggplotly() ----
# ggplotly() wraps the ggplot2 object — hover, zoom, and pan enabled
interactive_plot <- ggplotly(static_plot)
interactive_plot

# --- Step 4: Native Plotly Scatter Plot ----
# plot_ly() gives finer control; tilde (~) syntax maps data columns.
# type = "scatter" with mode = "markers" produces a scatter plot.
# layout() pipes in axis labels and tick suffix annotations.
plot_ly(data = iris,
        x = ~Sepal.Width,     # maps Sepal.Width column to x-axis
        y = ~Petal.Width,     # maps Petal.Width column to y-axis
        color = ~Species,     # distinct color per species
        type = "scatter",
        mode = "markers") %>%
  layout(
    title = "Iris Data Set Visualization",
    xaxis = list(
      title = "Sepal Width",
      ticksuffix = " cm"     # appends " cm" to every x-axis tick
    ),
    yaxis = list(
      title = "Petal Width",
      ticksuffix = " cm"     # appends " cm" to every y-axis tick
    )
  )

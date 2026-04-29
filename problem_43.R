# Created by Agrannya Singh (23BCE0965)
# Problem 43: Basic ggplot2 Visualizations (Scatter, Line, Bar)

if (!requireNamespace('ggplot2', quietly = TRUE)) install.packages('ggplot2')
library(ggplot2)

# --- Step 1: Create sample dataset ----
data <- data.frame(
  a = c(1, 2, 3, 4, 5),
  b = c(2, 4, 1, 5, 3),
  label = c('P1', 'P2', 'P3', 'P4', 'P5'),
  stringsAsFactors = FALSE
)
# Verify the dataset before plotting
print(data)

# --- Step 3.1.1: Basic Scatter Plot ----
# Plots 'a' on x-axis and 'b' on y-axis with default points
ggplot(data = data, aes(x = a, y = b)) +
  geom_point() +
  labs(title = "Scatter Plot",
       x = "X-axis",
       y = "Y-axis")

# --- Step 3.1.2: Scatter Plot with Color Customization ----
# Forest-green points sized at 1 — subtle but distinguishable
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 1) +
  labs(title = "Scatter Plot with Color Customization",
       x = "X-axis",
       y = "Y-axis")

# --- Step 3.1.3: Scatter Plot with Text Labels ----
# vjust = -1 lifts the label above each point to avoid overlap
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 3) +
  geom_text(aes(label = label), vjust = -1, color = "blue") +
  labs(title = "Scatter Plot with Text Labels",
       x = "X-axis",
       y = "Y-axis")

# --- Step 3.1.4: Scatter Plot with Linear Smoothing Line ----
# method = "lm" → linear regression line
# se = FALSE → hide the grey confidence-band shading
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 1) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot with Smooth Line",
       x = "X-axis",
       y = "Y-axis")

# --- Step 3.2: Customised Line Plot ----
# linewidth replaces the deprecated 'size' argument for lines
ggplot(data = data, aes(x = a, y = b)) +
  geom_line(color = "red", linewidth = 1) +
  labs(title = "Line Plot",
       x = "X-axis",
       y = "Y-axis")

# --- Step 3.3: Customised Bar Plot ----
# stat = "identity" uses the actual 'b' values as bar heights
# fill = "blue" applies a uniform blue color to all bars
ggplot(data = data, aes(x = a, y = b)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Bar Plot",
       x = "X-axis",
       y = "Values")

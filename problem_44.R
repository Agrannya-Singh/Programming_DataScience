# ─────────────────────────────────────────────────────────────────
# Author: Agrannya Singh | Reg No: 23BCE0965
# Lab 44 | Creating Basic Visualizations Using ggplot2 in R
# Course : BCSE207P — Programming for Data Science
# Faculty : Dr. M Rajasekhara Babu
# ─────────────────────────────────────────────────────────────────

# ── Step 1: Install and Load Required Package ────────────────────
# install.packages("ggplot2")     # uncomment and run once
library(ggplot2)                   # loads ggplot2 into the session

# ── Step 2: Build the Dataset ───────────────────────────────────
# Fixed seed values are used so output is reproducible
data <- data.frame(
  a = 1:10,
  b = c(-0.0626, 0.6958, 0.5493, -0.1872, 0.1382,
        0.4878, 0.3192, 0.8584, -0.4466, 0.7718),
  label = letters[11:20]           # character labels: k through t
)

# Verify the dataset before plotting
print(data)

# ── Step 3.1.1: Basic Scatter Plot ──────────────────────────────
# Plots 'a' on x-axis and 'b' on y-axis with default points
ggplot(data = data, aes(x = a, y = b)) +
  geom_point() +
  labs(title = "Scatter Plot",
       x = "X-axis",
       y = "Y-axis")

# ── Step 3.1.2: Scatter Plot with Color Customization ───────────
# Forest-green points sized at 1 — subtle but distinguishable
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 1) +
  labs(title = "Scatter Plot with Color Customization",
       x = "X-axis",
       y = "Y-axis")

# ── Step 3.1.3: Scatter Plot with Text Labels ───────────────────
# vjust = -1 lifts the label above each point to avoid overlap
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 3) +
  geom_text(aes(label = label), vjust = -1, color = "blue") +
  labs(title = "Scatter Plot with Text Labels",
       x = "X-axis",
       y = "Y-axis")

# ── Step 3.1.4: Scatter Plot with Linear Smoothing Line ─────────
# method = "lm" → linear regression line
# se = FALSE    → hide the grey confidence-band shading
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 1) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot with Smooth Line",
       x = "X-axis",
       y = "Y-axis")

# ── Step 3.2: Customised Line Plot ──────────────────────────────
# linewidth replaces the deprecated 'size' argument for lines
ggplot(data = data, aes(x = a, y = b)) +
  geom_line(color = "red", linewidth = 1) +
  labs(title = "Line Plot",
       x = "X-axis",
       y = "Y-axis")

# ── Step 3.3: Customised Bar Plot ───────────────────────────────
# stat = "identity" uses the actual 'b' values as bar heights
# fill = "blue" applies a uniform blue color to all bars
ggplot(data = data, aes(x = a, y = b)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Bar Plot",
       x = "X-axis",
       y = "Values")

# Created by Agrannya Singh (23BCE0965)
# Problem 45: Plant Growth Scatter Plot with ggplot2

if (!requireNamespace('ggplot2', quietly = TRUE)) install.packages('ggplot2')
library(ggplot2)

# --- Step 1: Create plant dataset ----
plant_data <- data.frame(
  Plant_ID = c('P1', 'P2', 'P3', 'P4', 'P5'),
  Growth_Rate = c(5.2, 3.8, 7.1, 4.5, 6.3),
  Condition_Label = c('Sunny', 'Shade', 'Sunny', 'Shade', 'Partial'),
  stringsAsFactors = FALSE
)

# --- Step 3: Scatter Plot with Styled Points and Condition Labels ----
# Plant_ID → x-axis (discrete plant identifier)
# Growth_Rate → y-axis (continuous measurement)
# Points are rendered in dodgerblue at size 4 for high visibility.
# Condition labels are placed below each point (vjust = 2) in darkorange
# so they are easy to read without overlapping the markers.
ggplot(data = plant_data,
       aes(x = Plant_ID, y = Growth_Rate)) +
  # Styled scatter points
  geom_point(color = "dodgerblue", size = 4) +
  # Condition labels below each point
  geom_text(aes(label = Condition_Label),
            vjust = 2,          # positive vjust pushes label downward
            color = "darkorange") +
  # Axis labels and title
  labs(title = "Scatter Plot of Plant Growth Data",
       x = "Plant ID",
       y = "Growth Rate")

# ─────────────────────────────────────────────────────────────────
# Author: Agrannya Singh | Reg No: 23BCE0965
# Lab 46 | Plant Growth Visualization Using ggplot2
# Course : BCSE207P — Programming for Data Science
# Faculty : Dr. M Rajasekhara Babu
# ─────────────────────────────────────────────────────────────────

# ── Step 1: Install and Load Required Package ────────────────────
# install.packages("ggplot2")     # uncomment and run once
library(ggplot2)                   # loads ggplot2 into the session

# ── Step 2: Create the Plant Growth Dataset ──────────────────────
# Manually entered 5-observation dataset as per the problem spec
plant_data <- data.frame(
  Plant_ID        = c(1, 2, 3, 4, 5),
  Growth_Rate     = c(3.2, 1.8, 2.6, 0.9, 3.8),
  Condition_Label = c("Sunny", "Shade", "Rainy", "Drought", "Cloudy")
)

# Verify data entry is correct before plotting
print(plant_data)

# ── Step 3: Scatter Plot with Styled Points and Condition Labels ─
# Plant_ID    → x-axis (discrete plant identifier)
# Growth_Rate → y-axis (continuous measurement)
# Points are rendered in dodgerblue at size 4 for high visibility.
# Condition labels are placed below each point (vjust = 2) in darkorange
# so they are easy to read without overlapping the markers.
ggplot(data = plant_data,
       aes(x = Plant_ID, y = Growth_Rate)) +
  # ── Styled scatter points ──────────────────────────────────────
  geom_point(color = "dodgerblue",
             size  = 4) +
  # ── Condition labels below each point ─────────────────────────
  geom_text(aes(label = Condition_Label),
            vjust = 2,             # positive vjust pushes label downward
            color = "darkorange") +
  # ── Axis labels and title ──────────────────────────────────────
  labs(title = "Scatter Plot of Plant Growth Data",
       x     = "Plant ID",
       y     = "Growth Rate")

# ─────────────────────────────────────────────────────────────────
# Author: Agrannya Singh | Reg No: 23BCE0965
# Lab 45 | Socioeconomic Trends in the Midwest Using ggplot2
# Course : BCSE207P — Programming for Data Science
# Faculty : Dr. M Rajasekhara Babu
# ─────────────────────────────────────────────────────────────────

# ── Step 1: Install and Load Required Packages ───────────────────
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(hexbin))  install.packages("hexbin")   # Required for geom_hex
library(ggplot2)

# Load the built-in midwest dataset
data("midwest", package = "ggplot2")

# ── Step 2.1: Scatter Plot — College Education vs Adult Poverty ──
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty)) +
  labs(title = "2.1: Basic Scatter Plot")

# ── Step 2.2: Scatter Plot with LOESS Trend Line ─────────────────
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty)) +
  geom_smooth(mapping = aes(x = percollege, y = percadultpoverty)) +
  labs(title = "2.2: Scatter Plot with LOESS")

# ── Step 2.3: Bar Chart — Total Population per State ────────────
ggplot(data = midwest) +
  geom_col(mapping = aes(x = state, y = poptotal)) +
  labs(title = "2.3: Total Population per State")

# ── Step 2.4: Hexagonal Heatmap ─────────────────────────────────
ggplot(data = midwest) +
  geom_hex(mapping = aes(x = percollege, y = percadultpoverty)) +
  labs(title = "2.4: Hexagonal Heatmap")

# ── Step 2.5: Shared Aesthetic Mappings (DRY principle) ──────────
ggplot(data = midwest,
       mapping = aes(x = percollege, y = percadultpoverty)) +
  geom_point() +
  geom_smooth() +
  geom_point(mapping = aes(y = percchildbelowpovert), color = "orange") +
  labs(title = "2.5: Shared Aesthetics & Overrides")

# ── Step 2.6: Color Mapping by State ────────────────────────────
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege,
                            y = percadultpoverty,
                            color = state)) +
  labs(title = "2.6: Color Mapping by State")

# ── Step 2.7: Constant Color and Transparency ───────────────────
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty),
             color = "red",
             alpha = 0.3) +
  labs(title = "2.7: Constant Color and Alpha")

# Created by Agrannya Singh (23BCE0965)
# Problem 44: Midwest Dataset Visualizations with ggplot2

if (!requireNamespace('ggplot2', quietly = TRUE)) install.packages('ggplot2')
library(ggplot2)

# --- Step 2.1: Scatter Plot — College Education vs Adult Poverty ----
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty)) +
  labs(title = "2.1: Basic Scatter Plot")

# --- Step 2.2: Scatter Plot with LOESS Trend Line ----
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty)) +
  geom_smooth(mapping = aes(x = percollege, y = percadultpoverty)) +
  labs(title = "2.2: Scatter Plot with LOESS")

# --- Step 2.3: Bar Chart — Total Population per State ----
ggplot(data = midwest) +
  geom_col(mapping = aes(x = state, y = poptotal)) +
  labs(title = "2.3: Total Population per State")

# --- Step 2.4: Hexagonal Heatmap ----
ggplot(data = midwest) +
  geom_hex(mapping = aes(x = percollege, y = percadultpoverty)) +
  labs(title = "2.4: Hexagonal Heatmap")

# --- Step 2.5: Shared Aesthetic Mappings (DRY principle) ----
ggplot(data = midwest,
       mapping = aes(x = percollege, y = percadultpoverty)) +
  geom_point() +
  geom_smooth() +
  geom_point(mapping = aes(y = percchildbelowpovert), color = "orange") +
  labs(title = "2.5: Shared Aesthetics & Overrides")

# --- Step 2.6: Color Mapping by State ----
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege,
                            y = percadultpoverty,
                            color = state)) +
  labs(title = "2.6: Color Mapping by State")

# --- Step 2.7: Constant Color and Transparency ----
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty),
             color = "red",
             alpha = 0.3) +
  labs(title = "2.7: Constant Color and Alpha")

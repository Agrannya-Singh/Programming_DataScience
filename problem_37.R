# Created by Agrannya Singh (23BCE0965)
# Problem 37: Exploring the Starwars Dataset — Insights into Human Characters and their LMI
# (Exercise Program variant of Q36 — LA-3)

if (!requireNamespace('dplyr', quietly = TRUE)) install.packages('dplyr')
library(dplyr)

# ---- i) Load starwars dataset (from dplyr) ----
data('starwars', package = 'dplyr')

# ---- ii) Display first few rows ----
cat('=== First 6 Rows ===\n')
print(head(starwars))

# ---- iii) Summary statistics for height and mass ----
cat('=== Summary Statistics (height, mass) ===\n')
summary(starwars[, c('name','species','height','mass','homeworld','gender')])

# ---- iv) Structure of dataset ----
cat('=== Dataset Structure ===\n')
str(starwars)

# ---- v) Filter: Human characters only ----
humans <- starwars[!is.na(starwars$species) & starwars$species == 'Human', ]
cat('Human characters:', nrow(humans), '\n')

# ---- vi) Compute LMI = mass / (height/100)^2 ----
# Note: height is in cm; convert to metres before squaring
humans$LMI <- round(humans$mass / (humans$height / 100)^2, 2)
cat('Human characters with LMI column:\n')
print(humans[, c('name','homeworld','height','mass','LMI')])

# ---- vii) Average LMI grouped by homeworld ----
lmi_by_world <- aggregate(
  LMI ~ homeworld, data = humans,
  FUN = function(x) round(mean(x, na.rm = TRUE), 2)
)
lmi_by_world <- lmi_by_world[order(-lmi_by_world$LMI), ]
cat('=== Average LMI by Homeworld ===\n')
print(lmi_by_world)

# ---- viii.a) Histogram of LMI ----
humans_complete <- humans[!is.na(humans$LMI), ]
hist(humans_complete$LMI,
     breaks = 8,
     col = 'steelblue',
     border = 'white',
     main = 'Frequency Distribution of LMI for Human Characters',
     xlab = 'Lean Mass Index (LMI)',
     ylab = 'Frequency')
grid()

# ---- viii.b) Density plot by homeworld ----
worlds <- unique(na.omit(humans_complete$homeworld))
cols <- rainbow(length(worlds))
plot(
  density(humans_complete$LMI, na.rm = TRUE),
  main = 'Smooth Density Distribution of LMI by Homeworld',
  xlab = 'LMI', ylab = 'Density',
  col = 'black', lwd = 2
)
for (i in seq_along(worlds)) {
  sub_lmi <- humans_complete$LMI[humans_complete$homeworld == worlds[i]]
  if (length(sub_lmi) > 1)
    lines(density(sub_lmi), col = cols[i], lwd = 2)
}
legend('topright', legend = worlds, col = cols,
       lwd = 2, title = 'Homeworld', cex = 0.7)

# ---- viii.c) Bar chart: avg LMI by height bin ----
humans_complete$HeightBin <- cut(
  humans_complete$height,
  breaks = c(-Inf, 150, 179, 209, Inf),
  labels = c('Below 150','150-179','180-209','210 & above')
)
avg_lmi_bin <- tapply(humans_complete$LMI,
                      humans_complete$HeightBin, mean, na.rm = TRUE)
barplot(avg_lmi_bin,
        col = c('lightblue','lightgreen','lightyellow','salmon'),
        main = 'Average LMI by Height Bin (Human Characters)',
        xlab = 'Height Bin',
        ylab = 'Average LMI',
        border = 'grey40')
grid(nx = NA, ny = NULL)

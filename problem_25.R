# Problem 25: Sensor Data Analysis
# Created by Agrannya Singh (23BCE0965)

# Dummy data generated for context
temp <- c(28, 32, 35, 29, 31, 33)
humidity <- c(45, 35, 30, 50, 38, 36)
pressure <- c(1012, 1010, 1008, 1013, 1009, 1011)

# 1. Averages
cat("Avg Temp:", mean(temp), "\n")
cat("Avg Hum:", mean(humidity), "\n")

# 2. Conditions
indices <- which(temp > 30 & humidity < 40)
cat("Intervals matching condition:", indices, "\n")

# 3. Plot (Requires a graphics device, will save as 'sensor_plot.png' if run in batch)
# For local view:
# plot(temp, type="l", col="red", ylim=c(0, 50), main="Sensor Data")
# lines(humidity, col="blue")

cat("Analysis complete for Sensor Data.\n")

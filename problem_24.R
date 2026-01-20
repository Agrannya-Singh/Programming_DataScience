# Problem 24: Stock Price Analysis
# Created by Agrannya Singh (23BCE0965)

prices <- c(120, 122, 118, 121, 119, 117, 123, 125, 126, 124, 
            128, 130, 129, 131, 135, 134, 136, 137, 140, 138, 
            139, 141, 142, 144, 143, 145, 146, 148, 147, 149)

# 1. Daily Returns (diff)
returns <- diff(prices)
cat("First 5 returns:", head(returns, 5), "\n")

# 2. Max/Min Return
cat("Max Return:", max(returns), "\n")
cat("Min Return:", min(returns), "\n")

# 3. Cumulative Return ((End - Start) / Start)
cum_return <- (tail(prices, 1) - head(prices, 1)) / head(prices, 1)
cat("Cumulative Return:", round(cum_return * 100, 2), "%\n")

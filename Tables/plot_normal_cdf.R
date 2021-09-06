
# Function to visualize the area uncer curve of the standard normal

plot_normal_cdf <- function(upto, range = c(-4, 4), color = "lightblue"){
  par(mar = c(1, 1, 1, 1))
  z <- seq(range[1], range[2], by = 0.001)
  plot(dnorm(z) ~ z, xlim = range, type = 'n', axes = FALSE, xlab = "", ylab = "")
  x <- seq(range[1], upto, by = 0.001)
  px <- c(x, rev(x))
  py <- c(dnorm(x), rep(-0.01, length(x)))
  polygon(px, py, col = color, border = NA)
  curve(dnorm, add = TRUE, lwd = 2)
  abline(h = -0.01)
  points(0, -0.01, pch = 3)
  mtext(0, 1, cex = 0.8)
  mtext(upto, 1, cex = 0.8, at = upto)
}

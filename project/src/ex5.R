set.seed(2126)

n <- 4
r <- 150
m <- 130

samples <- matrix(NA, nrow = r, ncol = m)

for (i in 1:r) {
  for (j in 1:m) {
    z <- rnorm(n+1)
    samples[i,j] <- (sqrt(n)*z[1] / sqrt(sum(z[-1]^2)))
  }
}

proportions <- apply(samples, 1, function(row) mean(row <= -0.9))
p <- mean(proportions)
direct_p <- pt(-0.9, df = n)
diff_abs <- abs(p - direct_p)*100
diff_abs

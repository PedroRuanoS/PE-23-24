library(pracma)

set.seed(1820)
n <- 8

data <- c(34.0, 39.5, 33.2, 38.1, 29.9, 37.4, 32.1, 36.5, 31.4, 34.1, 33.1, 31.5, 33.9, 33.9)

samples <- sample(data, n, replace = FALSE)

gamma <- 0.95

a <- qchisq((1 - gamma) / 2, df = n - 1)
b <- qchisq((1 + gamma) / 2, df = n - 1)

s2 <- var(samples)

lower_bound <- (n - 1) * s2 / b
upper_bound <- (n - 1) * s2 / a

F <- function(x) {
  eq1 <- pchisq(x[2], df = n - 1) - pchisq(x[1], df = n - 1) - gamma
  eq2 <- dchisq(x[2], df = n + 3) - dchisq(x[1], df = n + 3)
  
  return(c(eq1, eq2))
}

# Resolver as equações para obter (c, d)
quantis <- fsolve(F, x0 = c(a,b))$x

c <- quantis[1]
d <- quantis[2]

# Calcular o novo intervalo de confiança para sigma^2
lower_bound_new <- (n - 1) * s2 / d
upper_bound_new <- (n - 1) * s2 / c

print(abs((upper_bound - lower_bound) - (upper_bound_new - lower_bound_new)))
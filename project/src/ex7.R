library(stats4)

dados <- c(8.54, 4.76, 5.15, 4.96, 6.25, 7.22, 12.9, 6.04, 8.86, 4.88, 6.54, 4.53, 4.7, 5.38, 5.96, 5.17, 5.09, 5.11)
a <- 4.5

logverossim <- function(theta) {
  if (theta <= 0) {
    return(Inf)
  }
  n <- length(dados)
  log_likelihood <- n * log(theta) - theta * sum(log(dados / a))
  return(-log_likelihood)
}

vero <- mle(logverossim, start = list(theta = 3.4))

theta_hat <- coef(vero)["theta"]
p <- 0.25
q_p_est <- a * (1 - p)^(-1 / theta_hat)

theta_true <- 3.4
q_p_true <- a * (1 - p)^(-1 / theta_true)

desvio_absoluto <- abs(q_p_est - q_p_true)
desvio_absoluto

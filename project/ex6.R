a <- 4

#Abordagem 1 (Valor simulado)
set.seed(1948)
n <- 30
n_sim <- 1000
Y_sim <- numeric(n_sim)

for (i in 1:n_sim) {
  X <- rexp(n, rate = 1/a)
  Y_sim[i] <- sum(X)
}
prop_Y <- sum(Y_sim > 90) / n_sim

#Abordagem 2 (Valor exato)
a <- 30
b <- 1/4
reliability <- 1 - pgamma(90, a, 1/4)

#Calcular diferenca
result <- abs(prop_Y - reliability) * 100
result

set.seed(2255)

realizations <- 150

sistema <- replicate(realizations, {
  emissions <- sample(1:10, 9, replace = TRUE, prob = 1:10 / 55)
  sound <- any(emissions == 2)
  not_turn_off <- !any(emissions == 1)
  c(sound, not_turn_off)
})

prop <- sum(sistema[1,] & sistema[2,]) / sum(sistema[2,])
prop
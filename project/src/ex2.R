library(ggplot2)
theme_set(theme_gray())

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/master.csv'
suicidios <- read.csv(url)
suicidios_selec <- subset(suicidios, year == 2002 & age == "55-74 years")

ggplot(suicidios_selec) +
  geom_boxplot(aes(x = sex, y = suicides.100k.pop)) +
  labs(title = paste0("Nº of suicides per 100k habitants (Women vs Men)"),
       y = "Nº of suicides/100k habitants")
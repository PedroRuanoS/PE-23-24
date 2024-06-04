library(ggplot2)
theme_set(theme_gray())

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/Paises_PIB_ICH.csv'
dados <- read.csv(url, check.names = FALSE)
continentes <- c("Europe", "Americas")
paises_especificos <- c("Lithuania", "Iceland", "United States", "Saint Lucia")

dados |>
  subset(Continent %in% continentes) |>
  ggplot() +
  geom_point(aes(GDP, HCI, color = Continent)) +
  scale_x_log10() +
  geom_text(data = subset(dados, Country %in% paises_especificos),
            aes(x = GDP, y = HCI, label = Country),
            color = "black") +
  labs(title = paste("Human Capital Index vs GDP per capita"),
       x = "GDP per capita",
       y = "Human Capital Index")
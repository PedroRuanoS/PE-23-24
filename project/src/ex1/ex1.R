library(ggplot2)
theme_set(theme_gray())

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/Paises_PIB_ICH.csv'
data <- read.csv(url, check.names = FALSE)
continents <- c("Europe", "Americas")
countries <- c("Lithuania", "Iceland", "United States", "Saint Lucia")

data |>
  subset(Continent %in% continents) |>
  ggplot() +
  geom_point(aes(GDP, HCI, color = Continent)) +
  scale_x_log10() +
  geom_text(data = subset(data, Country %in% countries),
            aes(x = GDP, y = HCI, label = Country),
            color = "black") +
  labs(title = paste("Human Capital Index vs GDP per capita"),
      x = "GDP per capita",
      y = "Human Capital Index")
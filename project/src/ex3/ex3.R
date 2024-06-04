library(ggplot2)
library(readxl)
theme_set(theme_gray())

# ler os dados do ficheiro excel
data <- readxl::read_excel("electricity.xlsx")

# filtrar os dados para energias renováveis apartir de 2015
data <- data[data$PRODUCT == "Renewables" & data$YEAR >= 2015,]

# filtrar e combinar os dados dos paises pedidos
combined_data <- rbind(
  subset(data, COUNTRY == "Italy"),
  subset(data, COUNTRY == "Latvia"),
  subset(data, COUNTRY == "IEA Total")
)

combined_data$share <- as.numeric(combined_data$share)
combined_data$share <- combined_data$share * 100 #passar share para percentagem
combined_data$Date <- as.Date(paste(combined_data$YEAR, combined_data$MONTH, "01", sep = "-"))


# gerar gráfico
ggplot(combined_data, aes(x = Date, y = share, color = COUNTRY, group = COUNTRY)) +
  geom_line() +
  geom_point() +
  labs(x = "Date", y = "Share (%)", color = "Country", 
    title = "Evolution of monthly Renewable Energy share") +
  scale_y_continuous(limits = c(0, 100)) +
  theme_minimal()



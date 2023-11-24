library(tidyverse)
library(readxl)


dados <- read_excel("~/dados_correlacao.xlsx")

# verificando correlação:

dados |> 
ggplot(aes(x = x, y = y)) +
  geom_point() +
  geom_smooth(method = "lm")

# Calculando o coeficiente de correlação (Pearson):
dados |>
  summarise(correlacao = cor(x, y))

# Calculando o coeficiente de correlação (Pearson)
# e o intervalo de confiança:
cor.test(dados$x, dados$y)

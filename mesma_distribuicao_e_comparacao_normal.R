library(tidyverse)
library(qqplot)
library(readxl)
library(qqplotr)
library(KbMvtSkew)
library(e1071)
options(scipen = 999)

# Considere o conjunto de dados com duas variáveis quantitativas contínuas. 
# Desenhe o gráfico quantil-quantil para X e Y, desenhe o gráfico de 
# probabilidade normal para X, desenhe o gráfico de probabilidade normal para Y,
# e responda as questões abaixo.


plotqq <- read_excel("~/dados_quantil_quantil.xlsx")

# Gráfico quantil-quantil:
# Objetivo: checar se duas variáveis tem a mesma distribuição

estat_ordem_a <- sort(plotqq$x)
estat_ordem_b <- sort(plotqq$y)


tibble(escola_a = estat_ordem_a, escola_b = estat_ordem_b)|> 
  ggplot(aes(escola_a,escola_b)) + 
  geom_point(size = 3) + 
  geom_abline(intercept = 0, slope = 1,size = 2, color = "blue") + 
  theme_minimal() + 
  labs(x="EscolaA",y="EscolaB")


# Prob normal x -----------------------------------------------------------

ggplot(
  plotqq,
  aes(sample = x)
) +
  stat_qq_point(color = "blue") +
  stat_qq_line(size = 1.5, color = "purple") +
  stat_qq_band(bandType = "pointwise", fill = "red", alpha = 0.25) +
  theme_minimal() +
  labs(
    x = "Quantis teóricos da distribuição normal",
    y = "Quantis amostrais"
  )

ggplot(
  plotqq,
  aes(sample = y)
) +
  stat_qq_point(color = "blue") +
  stat_qq_line(size = 1.5, color = "purple") +
  stat_qq_band(bandType = "pointwise", fill = "red", alpha = 0.25) +
  theme_minimal() +
  labs(
    x = "Quantis teóricos da distribuição normal",
    y = "Quantis amostrais"
  )

plotqq |> 
  summarise(
    media_x = mean(x),
    media_y = mean(y),
    desvio_padx = sd(x),
    desvio_pady = sd(y),
    bowley_x = BowleySkew(x),
    bowley_y = BowleySkew(y),
    x_G1 = skewness(x, type = 2),
    y_G1 = skewness(y, type = 2),
    x_kurtosis = kurtosis(x, type = 2),
    y_kurtosis = kurtosis(y, type = 2)
  )

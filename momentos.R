library(tidyverse) 
library(e1071)
library(KbMvtSkew)
library(readxl)


dados <- read_excel("~/dados_momentos.xlsx")

# Considere a amostra em dados.xlsx da variável quantitativa contínua X. Calcule:
  
# m2: Resposta momento 2 = uma medida de dispersão
# m3: Resposta momento 3 = assimetria
# m4: Resposta momento 4 = curtose
# g1: Resposta pior estimativa
# G1: Resposta melhor estivamtiva no ausencia de normalidade
# b1: Resposta melhor estimativa no contexto da normalidade
# g2: Resposta mede a chance de aparecer pontos exteriores ao amostra valores na população
# G2: Resposta 
# b2: Resposta

tabela <- dados |> 
  summarise(
    m2 = mean((x -mean(x))^2),
    m3 = mean((x -mean(x))^3),
    m4 = mean((x -mean(x))^4),
    g1 = skewness(x, type = 1),
    G1 = skewness(x, type = 2),
    b1 = skewness(x, type = 3),
    g2 = kurtosis(x, type = 1),
    G2 = kurtosis(x, type = 2),
    b2 = kurtosis(x, type = 3),
  )


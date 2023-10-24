library(pacman)

p_load(
  readxl,
  tidyverse,
  lettervalue,
  janitor
)

dados <- read_excel("dados/brutos/iris.xlsx")


# medidas de resumo -------------------------------------------------------

# medidas de dispersão
# mede a distribuição dos valores em torno da média (homogeneidade dos dados)

# variância: média dos desvios ao quadrado (acaba colocando cm2, por isso, utilizamos o desvio padrão para reajustar)
# desvio padrão: Raíz da variância (ele serve para colocar na mesma unidade ) - maior variabilidade nos dados
# desvio médio: média dos desvio abolsuto - tira-se o sinal
# coeficiente de variação: (s cm / x cm) sem unidades - pode ser usadao para comparar variáveis diferentes

medidas_dispersão <- dados |>  
  summarise(
    variancia = var(comprimento_petala),
    desv_pad_1 = sqrt(variancia),
    desv_pad_2 = sd(comprimento_petala)
  )


medidas_resumo_especie <- dados |> 
  group_by(especies) |> 
  summarise(
    media = mean(comprimento_petala),
    mediana = median(comprimento_petala),
    variancia = var(comprimento_petala),
    desv_pad = sqrt(variancia),
    desv_medio = abs(comprimento_petala - media) |> mean(), # pegou o valor absoluto, e tirou a média dele
    coef_variacao = desv_pad / media
  )

medidas_resumo_especie


# dados enem --------------------------------------------------------------

sorocaba <- read_excel("dados/sorocaba.xlsx")

# 1) nu_nota_mt por tp_escola

resumo_tp_escola <- sorocaba |> 
  group_by(tp_escola) |> 
  summarise(
    media_mt = mean(nu_nota_mt),
    media_lc = mean(nu_nota_lc),
    mediana_mt = median(nu_nota_mt),
    mediana_lc = median(nu_nota_lc),
    variancia_mt = var(nu_nota_mt), 
    variancia_lc = var(nu_nota_lc),
    desv_pad_mt = sd(nu_nota_mt), 
    desv_pad_lc = sd(nu_nota_lc),
    desv_medio_mt = mean(abs(nu_nota_mt - media_mt)),
    desv_medio_lc = mean(abs(nu_nota_lc - media_lc))
)


resumo_tp_cor_raca <- sorocaba |> 
  group_by(tp_cor_raca) |> 
  summarise(
    media_mt = mean(nu_nota_mt),
    media_lc = mean(nu_nota_lc),
    mediana_mt = median(nu_nota_mt),
    mediana_lc = median(nu_nota_lc),
    variancia_mt = var(nu_nota_mt), 
    variancia_lc = var(nu_nota_lc),
    desv_pad_mt = sd(nu_nota_mt), 
    desv_pad_lc = sd(nu_nota_lc),
    desv_medio_mt = mean(abs(nu_nota_mt - media_mt)),
    desv_medio_lc = mean(abs(nu_nota_lc - media_lc))
  )


# media dos desvios é zero ------------------------------------------------

# desvio_padrao <- sqrt(mean(abs(amostra_1 - median(amostra_1))^2)) |> 
# mean() |> 
# sqrt() 

# quantil -----------------------------------------------------------------




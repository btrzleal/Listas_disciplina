library(pacman)

p_load(
  readxl,writexl, DescTools, janitor, tidyverse,
  forcats
)

matriz <- rbind(
  c(1169, 148),
  c(156, 	1127)
)

GoodmanKruskalGamma(matriz, conf.level = 0.95)

dados <- read_excel("~/dados_tentativa.xlsx")


tabyl(dados, x1, x2)


dados <- dados |>
  mutate(
    x1 = fct(x1, levels = c("A", "B", "C", "D")),
    x2 = fct(x2, levels = c("A", "B", "C", "D", "E", "F"))
  )

GoodmanKruskalGamma(dados$x1, dados$x2, conf.level = 0.95)

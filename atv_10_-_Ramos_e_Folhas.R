library(pacman)

p_load(
  readxl, writexl, e1071, KbMvtSkew, tidyverse
)

# 1 | 2: represents 1.2
# leaf unit: 0.1
# n: 30
# 3    3. | 789
# 5    4* | 12
# 12    4. | 5556778
# (6)   5* | 001133
# 12    5. | 69
# 10    6* | 0011
# 6    6. | 556
# 3    7* | 13
# 1    7. | 8

dados <- tibble(
  x = c(3.7, 3.8, 3.9,
        4.1, 4.2,
        rep(4.5, 3), 4.6, 4.7, 4.7, 4.8,
        5, 5, 5.1,5.1, 5.3, 5.3,
        5.6, 5.9,
        6, 6, 6.1, 6.1,
        6.5, 6.5, 6.6,
        7.1, 7.3,
        7.8
  )
)

q1 = quantile(dados$x, probs = 0.25)
q3 = quantile(dados$x, probs = 0.75)

resposta <- dados |>
  summarise(
    mediana = median(x),
    m2 = moment(x, order=2, center = TRUE),
    m3 = moment(x, order=3, center = TRUE),
    m4 = moment(x, order=4, center = TRUE),
    q1 = quantile(x, probs = 0.25),
    q3 = quantile(x, probs = 0.75),
    B = BowleySkew(x),
    G1 = skewness(x, type = 2),
    G2 = kurtosis(x, type = 2),
    s = sd(x),
    s2 = var(x),
    LI = q1 - 1.5 * (q3 - q1),
    LS = q3 + 1.5 * (q3 - q1)
  )

resposta

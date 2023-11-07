# • Verifique se nu_nota_mt e nu_nota_lc do conjunto de dados
# amostra_enem_salvador.xlsx tem a mesma distribuição usando
# histograma, violin plot, lv plot e gráfico quantil-quantil;

# • Verifique se nu_nota_mt do conjunto de dados
# amostra_enem_salvador.xlsx tem distribuição normal usando
# histograma e gráfico quantil-quantil;

# • Verifique se nu_nota_lc do conjunto de dados
# amostra_enem_salvador.xlsx tem distribuição normal usando
# histograma e gráfico quantil-quantil.

library(pacman)

p_load(
  readxl, writexl, e1071, KbMvtSkew, tidyverse,
  qqplotr
)


# quantil-quantil ---------------------------------------------------------

# 
# qt_mt <- length(nota_mt)
# 
# # nu_nota_lc <- quantile(df_negros$nu_nota_mt, probs = seq_len(qtd_brancos)  / qtd_brancos) # quando as variaveis tem tamanhos diferentes
# 
# nota_lc <- quantile(sorocaba$nu_nota_lc, probs = seq_len(nota_mt)  / qt_mt)

sorocaba |>
  ggplot() +
  geom_point(aes(x = sort(nu_nota_mt), y = sort(nu_nota_lc))) + #lembrar de ordernar os dados
  geom_abline(intercept = 0, slope = 1) +
  ggthemes::theme_gdocs()

ggplot(sorocaba, aes(sample = nu_nota_mt)) +
  stat_qq_point() +
  stat_qq_line() +
  stat_qq_band()


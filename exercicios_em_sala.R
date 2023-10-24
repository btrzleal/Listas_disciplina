tab <- rename(sorocaba,
              "Cor_raca" = "tp_cor_raca",
              "Escola" = "tp_escola"
)

# selecionando a variável raça, adicionando totais e percentual

tab_raca <- tabyl(tab, Cor_raca)
tab_raca <- adorn_totals(tab_raca)
tab_raca <- adorn_pct_formatting(tab_raca,digits = 3)
tab_raca <- rename(tab_raca, "Cor/Raça" = "Cor_raca")


# selecionando a variável escola, adicionando totais e percentual

tab_escola <- tabyl(tab, Escola)
tab_escola <- tab_escola %>% 
  adorn_totals() %>% 
  adorn_pct_formatting(digits = 3)

# Salvando dfs

write_xlsx(tab_raca, "output/tab_raca.xlsx")
write_xlsx(tab_escola, "output/tab_escola.xlsx")

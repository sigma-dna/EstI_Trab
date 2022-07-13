library(expss)
base_mora_true <- base_prep |> filter(mora_familia == 'Sim') #filtrando apenas os pacientes que moram com a família
cont_disc_viol_in_mora <- base_mora_true |> cross_cases(discriminacao, violencia_sexual)
xq_disc_viol_in_mora <- chisq.test(x = base_mora_true$discriminacao, y = base_mora_true$violencia_sexual, correct = F)$statistic |> unname()
graf_disc_viol_in_mora <- base_mora_true |>
  ggplot(mapping = aes(x= discriminacao, fill = violencia_sexual)) +
  geom_bar(position = 'fill') +
  labs(x = 'discriminação', y = '%', fill = 'sofreu violência sexual?') +
  scale_y_continuous(labels = scales::percent_format()) +
  scale_fill_discrete(labels = c('Não', 'Sim'))
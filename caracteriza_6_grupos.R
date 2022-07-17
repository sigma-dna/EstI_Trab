#separando os grupos
rara_sim <- base_prep |>
  filter(uso_camisinha == 'Raramente', sexo_grupo == 'Sim') |> #filtrando as caracteristicas do grupo
  tibble::add_column(grupos = 'grupo 1') #nomeando as linhas que pertencem ao grupo

rara_nao <- base_prep |>
  filter(uso_camisinha == 'Raramente', sexo_grupo == 'Nao') |>
  tibble::add_column(grupos = 'grupo 2')

ocasional_sim <- base_prep |>
  filter(uso_camisinha == 'Ocasionalmente', sexo_grupo == 'Sim') |>
  tibble::add_column(grupos = 'grupo 3')

ocasional_nao <- base_prep |>
  filter(uso_camisinha == 'Ocasionalmente', sexo_grupo == 'Nao') |>
  tibble::add_column(grupos = 'grupo 4')

sempre_sim <- base_prep |>
  filter(uso_camisinha == 'Sempre', sexo_grupo == 'Sim') |>
  tibble::add_column(grupos = 'grupo 5')

sempre_nao <- base_prep |>
  filter(uso_camisinha == 'Sempre', sexo_grupo == 'Nao') |>
  tibble::add_column(grupos = 'grupo 6')

base_grupos <- rbind(rara_sim, rara_nao, ocasional_sim, ocasional_nao, sempre_sim, sempre_nao) |> #unindo os grupos em uma unica base de dados
  select(grupos, idade, escolaridade, depressao, ansiedade, qualidade_sono, risco) #selecionando as colunas necessárias

res_grupos <- base_grupos |>
  group_by(grupos)

res_grupos_age <- res_grupos |>
  summarise(n = n(),
            min = min(idade, na.rm = T),
            max = max(idade, na.rm = T),
            media = mean(idade, na.rm = T),
            mediana = median(idade, na.rm = T),
            desvio = sd(idade, na.rm = T))

boxplot_grupos_age <- base_grupos |> ggplot(mapping = aes(x = grupos, y = idade)) + geom_boxplot()

res_grupos_esco <- res_grupos |>
  summarise(n = n(),
            min = min(escolaridade, na.rm = T),
            max = max(escolaridade, na.rm = T),
            media = mean(escolaridade, na.rm = T),
            mediana = median(escolaridade, na.rm = T),
            desvio = sd(escolaridade, na.rm = T))

boxplot_grupos_esco <- base_grupos |> ggplot(mapping = aes(x = grupos, y = escolaridade)) + geom_boxplot()

res_grupos_dep <- res_grupos |>
  summarise(n = n(),
            min = min(depressao, na.rm = T),
            max = max(depressao, na.rm = T),
            media = mean(depressao, na.rm = T),
            mediana = median(depressao, na.rm = T),
            desvio = sd(depressao, na.rm = T))

boxplot_grupos_dep <- base_grupos |> ggplot(mapping = aes(x = grupos, y = depressao)) + geom_boxplot()

res_grupos_ans <- res_grupos |>
  summarise(n = n(),
            min = min(ansiedade, na.rm = T),
            max = max(ansiedade, na.rm = T),
            media = mean(ansiedade, na.rm = T),
            mediana = median(ansiedade, na.rm = T),
            desvio = sd(ansiedade, na.rm = T))

boxplot_grupos_ans <- base_grupos |> ggplot(mapping = aes(x = grupos, y = ansiedade)) + geom_boxplot()

res_grupos_sono <- res_grupos |>
  summarise(n = n(),
            min = min(qualidade_sono, na.rm = T),
            max = max(qualidade_sono, na.rm = T),
            media = mean(qualidade_sono, na.rm = T),
            mediana = median(qualidade_sono, na.rm = T),
            desvio = sd(qualidade_sono, na.rm = T))

boxplot_grupos_sono <- base_grupos |> ggplot(mapping = aes(x = grupos, y = qualidade_sono)) + geom_boxplot()

res_grupos_risco <- res_grupos |>
  summarise(n = n(),
            min = min(risco, na.rm = T),
            max = max(risco, na.rm = T),
            media = mean(risco, na.rm = T),
            mediana = median(risco, na.rm = T),
            desvio = sd(risco, na.rm = T))

boxplot_grupos_risco <- base_grupos |> ggplot(mapping = aes(x = grupos, y = risco)) + geom_boxplot()
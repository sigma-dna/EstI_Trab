library(expss) #Ativando o pacote para criação das tabelas de contingência
library(ggplot2) #Ativando o pacote para a criação de gráficos

#Avaliação da Associação entre as variáveis municipio e discriminacao
cont_mun_disc <- base_prep |> cross_cases(municipio, discriminacao) #Cria a Tabela de contingência para as variáveis municipio e discriminacao
xq_mun_disc <- chisq.test(table(base_prep$municipio, base_prep$discriminacao))$statistic |> unname() #Calcula o qui-quadrado
v_mun_disc <- sqrt(xq_mun_disc/nrow(base_prep)*(min(nrow(cont_mun_disc)-1,ncol(cont_mun_disc)-1)-1)) #Calcula o V de cramer
graf_mun_disc <- base_prep |> ggplot(mapping = aes(x = municipio, fill = discriminacao)) + #Criando um grafico e definindo seus eixos
  geom_bar(position = 'fill') + #definindo o gráfico como do tipo barras empilhadas
  labs(x = "municípios", y = '%', fill = 'sofreu discriminação?') + #definindo os rótulos dos eixos
  scale_y_continuous(labels = scales::percent_format()) + # alterando a escala do eixo y para percentual
  scale_fill_discrete(labels = c('Não', 'Sim')) #Altarando como o texto aparece na legenda das barras empilhadas

#Avaliação da Associação entre as variáveis municipio e mora_familia
cont_mun_mora <- base_prep |> cross_cases(municipio, mora_familia)
xq_mun_mora <- chisq.test(table(base_prep$municipio, base_prep$mora_familia))$statistic |> unname()
v_mun_mora <- sqrt(xq_mun_mora/nrow(base_prep)*(min(nrow(cont_mun_mora)-1,ncol(cont_mun_mora)-1)-1))
graf_mun_mora <- base_prep |> ggplot(mapping = aes(x = municipio, fill = mora_familia)) +
  geom_bar(position = 'fill') +
  labs(x = "municípios", y = '%', fill = 'mora com a família?') +
  scale_y_continuous(labels = scales::percent_format()) +
  scale_fill_discrete(labels = c('Não', 'Sim'))

#Avaliação da Associação entre as variáveis municipio e populacao
cont_mun_pop <- base_prep |> cross_cases(municipio, populacao)
xq_mun_pop <- chisq.test(table(base_prep$municipio, base_prep$populacao))$statistic |> unname()
v_mun_pop <- sqrt(xq_mun_pop/nrow(base_prep)*(min(nrow(cont_mun_pop)-1,ncol(cont_mun_pop)-1)-1))
graf_mun_pop <- base_prep |> ggplot(mapping = aes(x = municipio, fill = populacao)) +
  geom_bar(position = 'fill') +
  labs(x = "municípios", y = '%', fill = 'pertence a qual grupo?') +
  scale_y_continuous(labels = scales::percent_format())

#Avaliação da Associação entre as variáveis municipio e descontinuou
cont_mun_desc <- base_prep |> cross_cases(municipio, descontinuou)
xq_mun_desc <- chisq.test(table(base_prep$municipio, base_prep$descontinuou))$statistic |> unname()
v_mun_desc <- sqrt(xq_mun_desc/198*(min(nrow(cont_mun_desc)-1,ncol(cont_mun_desc)-1)-1))
graf_mun_desc <- base_prep |> ggplot(mapping = aes(x = municipio, fill = descontinuou)) +
  geom_bar(position = 'fill') +
  labs(x = "municípios", y = '%', fill = 'descontinuou em algum momento?') +
  scale_y_continuous(labels = scales::percent_format()) +
  scale_fill_discrete(labels = c('Não', 'Sim', 'Não quis responder'))

#Avaliação da Associação entre as variáveis municipio e idade
res_mun_age <- base_prep |>group_by(municipio) |> #agrupando os dados com base no município
  summarise(media = mean(idade, na.rm = T), #calculando a média para cada grupo
            var = var(idade, na.rm = T), #calculando a variância para cada grupo
            n = n()) #calculando a frequência para cada grupo
var_med_mun_age <- sum(res_mun_age$var*res_mun_age$n)/sum(res_mun_age$n) #calculando a variância média
r2_mun_age <- 1 - var_med_mun_age/var(base_prep$idade, na.rm = T)
boxplot_mun_age <- base_prep |> ggplot(mapping = aes(x = municipio, y = idade)) +
  geom_boxplot()

#Avaliação da Associação entre as variáveis municipio e escolaridade
res_mun_esco <- base_prep |>group_by(municipio) |>
  summarise(media = mean(escolaridade, na.rm = T),
            var = var(escolaridade, na.rm = T),
            n = n())
var_med_mun_esco <- sum(res_mun_esco$var*res_mun_esco$n)/sum(res_mun_esco$n)
r2_mun_esco <- 1 - var_med_mun_esco/var(base_prep$escolaridade, na.rm = T)
boxplot_mun_esco <- base_prep |> ggplot(mapping = aes(x = municipio, y = escolaridade)) +
  geom_boxplot()

#Avaliação da Associação entre as variáveis municipio e depressao
res_mun_dep <- base_prep |>group_by(municipio) |>
  summarise(media = mean(depressao, na.rm = T),
            var = var(depressao, na.rm = T),
            n = n())
var_med_mun_dep <- sum(res_mun_dep$var*res_mun_dep$n)/sum(res_mun_dep$n)
r2_mun_dep <- 1 - var_med_mun_dep/var(base_prep$depressao, na.rm = T)
boxplot_mun_dep <- base_prep |> ggplot(mapping = aes(x = municipio, y = depressao)) +
  geom_boxplot()

#Avaliação da Associação entre as variáveis municipio e ansiedade
res_mun_ans <- base_prep |>group_by(municipio) |>
  summarise(media = mean(ansiedade, na.rm = T),
            var = var(ansiedade, na.rm = T),
            n = n())
var_med_mun_ans <- sum(res_mun_ans$var*res_mun_ans$n)/sum(res_mun_ans$n)
r2_mun_ans <- 1 - var_med_mun_ans/var(base_prep$ansiedade, na.rm = T)
boxplot_mun_ans <- base_prep |> ggplot(mapping = aes(x = municipio, y = ansiedade)) +
  geom_boxplot()
#Avaliação da Associação entre as variáveis idade e depressao
corr_age_dep <- cor(base_prep$idade, base_prep$depressao, use = 'complete.obs') #calculando a correlação entre as variáveis
graf_disp_age_dep <- base_prep |> ggplot(mapping = aes(x = idade, y = depressao)) +
  geom_point() +
  labs(x = 'idade', y = 'nível de depressão')

#Avaliação da Associação entre as variáveis idade e ansiedade
corr_age_ans <- cor(base_prep$idade, base_prep$ansiedade, use = 'complete.obs')
graf_disp_age_ans <- base_prep |> ggplot(mapping = aes(x = idade, y = ansiedade)) +
  geom_point() +
  labs(x = 'idade', y = 'nível de ansiedade')

#Avaliação da Associação entre as variáveis idade e qualidade_sono
corr_age_sono <- cor(base_prep$idade, base_prep$qualidade_sono, use = 'complete.obs')
graf_disp_age_sono <- base_prep |> ggplot(mapping = aes(x = idade, y = qualidade_sono)) +
  geom_point() +
  labs(x = 'idade', y = 'nível de qualidade de sono')

#Avaliação da Associação entre as variáveis idade e risco
corr_age_risco <- cor(base_prep$idade, base_prep$risco, use = 'complete.obs')
graf_disp_age_risco <- base_prep |> ggplot(mapping = aes(x = idade, y = risco)) +
  geom_point() +
  labs(x = 'idade', y = 'nível autopercepção de risco')

#criando uma base separada para pacientes de belo horizonte
base_bh <- base_prep |> filter(municipio == 'Belo Horizonte')

#Avaliação da Associação entre as variáveis idade e depressao para pacientes de belo horizonte
corr_age_dep_bh <- cor(base_bh$idade, base_bh$depressao, use = 'complete.obs') #calculando a correlação entre as variáveis
graf_disp_age_dep_bh <- base_bh |> ggplot(mapping = aes(x = idade, y = depressao)) +
  geom_point() +
  labs(x = 'idade', y = 'nível de depressão (Belo Horizonte)')

#Avaliação da Associação entre as variáveis idade e ansiedade para pacientes de belo horizonte
corr_age_ans_bh <- cor(base_bh$idade, base_bh$ansiedade, use = 'complete.obs')
graf_disp_age_ans_bh <- base_bh |> ggplot(mapping = aes(x = idade, y = ansiedade)) +
  geom_point() +
  labs(x = 'idade', y = 'nível de ansiedade (Belo Horizonte)')

#Avaliação da Associação entre as variáveis idade e qualidade_sono para pacientes de belo horizonte
corr_age_sono_bh <- cor(base_bh$idade, base_bh$qualidade_sono, use = 'complete.obs')
graf_disp_age_sono_bh <- base_bh |> ggplot(mapping = aes(x = idade, y = qualidade_sono)) +
  geom_point() +
  labs(x = 'idade', y = 'nível de qualidade de sono (Belo Horizonte)')

#Avaliação da Associação entre as variáveis idade e risco para pacientes de belo horizonte
corr_age_risco_bh <- cor(base_bh$idade, base_bh$risco, use = 'complete.obs')
graf_disp_age_risco_bh <- base_bh |> ggplot(mapping = aes(x = idade, y = risco)) +
  geom_point() +
  labs(x = 'idade', y = 'nível autopercepção de risco (Belo Horizonte)')
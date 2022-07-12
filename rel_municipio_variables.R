library(expss);
#Avaliação da Associação entre as variáveis municipio e discriminacao
cont_mun_disc <- base_prep |> cross_cases(municipio, discriminacao); #Cria a Tabela de contingência
xq_mun_disc <- chisq.test(table(base_prep$municipio, base_prep$discriminacao))$statistic |> unname(); #Calcula o qui-quadrado
v_mun_disc <- sqrt(xq_mun_disc/200*(min(nrow(cont_mun_disc)-1,ncol(cont_mun_disc)-1)-1)); #Calcula o V de cramer

#Avaliação da Associação entre as variáveis municipio e mora_familia
cont_mun_mora <- base_prep |> cross_cases(municipio, mora_familia);
xq_mun_mora <- chisq.test(table(base_prep$municipio, base_prep$mora_familia))$statistic |> unname();
v_mun_mora <- sqrt(xq_mun_mora/200*(min(nrow(cont_mun_mora)-1,ncol(cont_mun_mora)-1)-1));

#Avaliação da Associação entre as variáveis municipio e populacao
cont_mun_pop <- base_prep |> cross_cases(municipio, populacao);
xq_mun_pop <- chisq.test(table(base_prep$municipio, base_prep$populacao))$statistic |> unname();
v_mun_pop <- sqrt(xq_mun_pop/200*(min(nrow(cont_mun_pop)-1,ncol(cont_mun_pop)-1)-1));

#Avaliação da Associação entre as variáveis municipio e descontinuou
cont_mun_desc <- base_prep |> cross_cases(municipio, descontinuou);
xq_mun_desc <- chisq.test(table(base_prep$municipio, base_prep$descontinuou))$statistic |> unname();
v_mun_desc <- sqrt(xq_mun_desc/200*(min(nrow(cont_mun_desc)-1,ncol(cont_mun_desc)-1)-1));

#Essas linhas são pra evitar incompatibilidade entre os pacotes readr e expss, NÃO APAGAR
detach("package:expss", unload = T);
detach("package:maditr", unload = T)

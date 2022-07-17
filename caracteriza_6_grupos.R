rara_sim <- base_prep |> filter(uso_camisinha == 'Raramente', sexo_grupo == 'Sim')

rara_nao <- base_prep |> filter(uso_camisinha == 'Raramente', sexo_grupo == 'Nao')

ocasional_sim <- base_prep |> filter(uso_camisinha == 'Ocasionalmente', sexo_grupo == 'Sim')

ocasional_nao <- base_prep |> filter(uso_camisinha == 'Ocasionalmente', sexo_grupo == 'Nao')

sempre_sim <- base_prep |> filter(uso_camisinha == 'Sempre', sexo_grupo == 'Sim')

sempre_nao <- base_prep |> filter(uso_camisinha == 'Sempre', sexo_grupo == 'Nao')

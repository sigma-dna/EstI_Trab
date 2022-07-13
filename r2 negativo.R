library(dplyr)
res_mun_dep <- base_prep |> #base_prep é o nome da variável em que eu importei a base de dados
  group_by(municipio) |>
  summarise(media = mean(depressao, na.rm = T),
            var = var(depressao, na.rm = T),
            n = n())
var_med_mun_dep <- sum(res_mun_dep$var*res_mun_dep$n)/sum(res_mun_dep$n)
r2_mun_dep <- 1 - var_med_mun_dep/var(base_prep$depressao, na.rm = T)
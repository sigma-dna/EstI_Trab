source('./import.R')
source('./rel_municipio_variables.R')
source('./rel_idade_escalas.R')
source('./rel_discriminacao_violencia_in_mora.R')

#Essas linhas são pra evitar incompatibilidade entre os pacotes readr e expss, NÃO APAGAR
detach("package:expss", unload = T)
detach("package:maditr", unload = T)

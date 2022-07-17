source('./import.R') #importação
source('./rel_municipio_variables.R') #tópico 2
source('./rel_idade_escalas.R') #tópico 3
source('./caracteriza_6_grupos.R.R') #tópico 4
source('./rel_discriminacao_violencia_in_mora.R') #tópico 5

#Essas linhas são pra evitar incompatibilidade entre os pacotes readr e expss, NÃO APAGAR
detach("package:expss", unload = T)
detach("package:maditr", unload = T)

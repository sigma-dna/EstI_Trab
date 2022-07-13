library(readr); #Ativando o pacote para importar arquivos do tipo txt
base_prep <- read_delim( #importando a base de dados através da função 'read_delim()' e armazenando na variável 'base_prep'
  file = './base_PREp.txt', #Definindo o caminho do arquivo da base de dados
  locale = locale(decimal_mark = ','), #configurando para que a vírgula seja considerada como separador decimal
  na = c('77777','88888'), #configurando os valores que representam dados faltantes(NA)
  col_types = cols(cd_pac = col_character()) #definindo os valores da coluna cd_pac como texto
);
library(dplyr); #Ativando o pacote para manipulação de bases de dados
base_prep <- base_prep |> mutate( #Alterando a base de dados
  municipio = factor(municipio, #alterando a váriavel município para que corresponda devidamente a uma variável qualitativa
    levels = c(1,2,3), #delimitando os códigos usados para cada realização
    labels = c('Salvador', 'Sao Paulo', 'Belo Horizonte'), #dando os devidos nomes às realizações
  ),
  descontinuou = factor(
    descontinuou,
    levels = c(0,1),
    labels = c('Nao','Sim'),
  ),
  populacao = factor(
    populacao,
    levels = c(1,2),
    labels = c('Homem que faz sexo com homem','Mulher Trans'),
  ),
  discriminacao = factor(
    discriminacao,
    levels = c(0,1),
    labels = c('Nao','Sim'),
  ),
  mora_familia = factor(
    mora_familia,
    levels = c(0,1),
    labels = c('Nao','Sim'),
  ),
  violencia_sexual = factor(
    violencia_sexual,
    levels = c(0,1),
    labels = c('Nao','Sim'),
  ),
  uso_camisinha = factor(
    uso_camisinha,
    levels = c(1,2,3),
    labels = c('Raramente','Ocasionalmente', 'Sempre'),
    ordered = T #definindo a variável como qualitativa ordinal
  ),
  pessoas_velhas = factor(
    pessoas_velhas,
    levels = c(0,1),
    labels = c('Nao','Sim'),
  ),
  sexo_grupo = factor(
    sexo_grupo,
    levels = c(0,1),
    labels = c('Nao','Sim'),
  ),
  teste_HIV = factor(
    teste_HIV,
    levels = c(0,1),
    labels = c('Nao','Sim'),
  ),
  usou_PEP = factor(
    usou_PEP,
    levels = c(0,1),
    labels = c('Nao','Sim'),
  )
)

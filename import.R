library(readr);
base_prep <- read_delim(
  file = 'base_PREp.txt',
  locale = locale(decimal_mark = ','),
  na = c('77777','88888'),
  col_types = cols(cd_pac = col_character())
);
library(dplyr);
base_prep <- base_prep |> mutate(
  municipio = factor(
    municipio,
    levels = c(1,2,3),
    labels = c('Salvador', 'Sao Paulo', 'Belo Horizonte'),
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
    ordered = T
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

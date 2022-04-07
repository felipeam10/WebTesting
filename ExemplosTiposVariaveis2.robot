*** Settings ***
Documentation   Exemplo de tipos de variáveis: LISTAS
*** Variable ***

#Tipo Lista
@{MESES}    Janeiro  Fevereiro  Março  Abril  Maio  Junho  Julho  Agosto  Setembro  Outubro  Novembro  Dezembro

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    #Lista
    Log To Console    Meses: ${MESES}


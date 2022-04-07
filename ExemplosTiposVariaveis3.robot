*** Settings ***
Documentation   Exemplo de tipos de variáveis: DICIONÁRIOS

*** Variable ***
#Tipo Dicionário
&{MESES}    janeiro=janeiro        qtdDiasJan=31
...         fevereiro=fevereiro    qtdDiasFev=28
...         marco=marco            qtdDiasMar=31
...         abril=abril            qtdDiasAbr=30
...         maio=maio              qtdDiasMai=31
...         junho=junho            qtdDiasJun=30
...         julho=julho            qtdDiasJul=31
...         agosto=agosto          qtdDiasAgo=31
...         setembro=setembro      qtdDiasSet=30
...         outubro=outubro        qtdDiasOut=31
...         novembro=novembro      qtdDiasNov=30
...         dezembro=dezembro      qtdDiasDez=31


*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    #Dicionário
    Log To Console    Mes: ${MESES.janeiro} e qtd dias: ${MESES.qtdDiasJan}
    Log To Console    Mes: ${MESES.fevereiro} e qtd dias: ${MESES.qtdDiasFev}
    Log To Console    Mes: ${MESES.marco} e qtd dias: ${MESES.qtdDiasMar}
    Log To Console    Mes: ${MESES.abril} e qtd dias: ${MESES.qtdDiasAbr}
    Log To Console    Mes: ${MESES.maio} e qtd dias: ${MESES.qtdDiasMai}
    Log To Console    Mes: ${MESES.junho} e qtd dias: ${MESES.qtdDiasJun}
    Log To Console    Mes: ${MESES.julho} e qtd dias: ${MESES.qtdDiasJul}
    Log To Console    Mes: ${MESES.agosto} e qtd dias: ${MESES.qtdDiasAgo}
    Log To Console    Mes: ${MESES.setembro} e qtd dias: ${MESES.qtdDiasSet}
    Log To Console    Mes: ${MESES.outubro} e qtd dias: ${MESES.qtdDiasOut}
    Log To Console    Mes: ${MESES.novembro} e qtd dias: ${MESES.qtdDiasNov}
    Log To Console    Mes: ${MESES.dezembro} e qtd dias: ${MESES.qtdDiasDez}
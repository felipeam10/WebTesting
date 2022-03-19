*** Settings ***
Library           SeleniumLibrary



*** Variables ***
${URL}                   https://www.amazon.com.br/ 
${MENU_ELETRONICOS}      //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXT_HEADER_ELETRONICOS}  Eletrônicos e Tecnologia

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO_XBOX}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO_XBOX}

Clicar no botão de pesquisa
    Click Button    locator=nav-search-submit-button


Verificar o resultado da pesquisa, se está listando o produto ${PRODUTO_XBOX_SERIE_S}
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO_XBOX_SERIE_S}')])[5]
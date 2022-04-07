*** Settings ***
Documentation      Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library            RequestsLibrary
Library            Collections




*** Variables ***
${URL_API}        https://fakerestapi.azurewebsites.net/api/v1/



*** Keywords ***
#### SETUP E TEARDOWNS
Conectar minha API
    Create Session    fakeAPI    ${URL_API}

#### Ações
Requisitar todos os livros
    ${RESPOSTA}    Get Request    fakeAPI    Books
    Log            ${RESPOSTA.text}
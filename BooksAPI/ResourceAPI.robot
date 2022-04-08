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
    Set Test Variable    ${RESPOSTA}

Conferir o status code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retorna "${QTD_LIVROS}" livros na lista
    Length Should Be    ${RESPOSTA.json()}    ${QTD_LIVROS}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Get Request    fakeAPI    Books/${ID_LIVRO}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
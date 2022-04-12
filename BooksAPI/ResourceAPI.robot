*** Settings ***
Documentation      Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library            RequestsLibrary
Library            Collections




*** Variables ***
${URL_API}        https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_14}        id=14
...               title=Book 14
...               pageCount=1400
&{BOOK_1}         id=1
...               title=Book 1 alterado
...               description=Descrição do book 1 alterada
...               pageCount=123
...               excerpt=Resumo do book 1 alterado
...               publishDate=2017-04-26T15:58:14.765Z


*** Keywords ***
#### SETUP E TEARDOWNS
Conectar minha API
    Create Session    fakeAPI    ${URL_API}
    ${HEADERS}     Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}

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

Conferir se retorna todos os dados corretos do livro 14
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id            ${BOOK_14.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title         ${BOOK_14.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount     ${BOOK_14.pageCount}
    Should Not Be Empty               ${RESPOSTA.json()["description"]}
    Should Not Be Empty               ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty               ${RESPOSTA.json()["publishDate"]}


Cadastrar um novo livro
    ${HEADERS}     Create Dictionary    content-type=application/json
    ${RESPOSTA}    Post Request    fakeAPI    Books
    ...                            data={"id": 1212,"title": "tests","description": "tests", "pageCount": 2000, "excerpt": "tests","publishDate": "2022-04-11T04:24:35.801Z"}
    ...                            headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Alterar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Put Request    fakeAPI    Books/${ID_LIVRO}
    ...                           data={"id": ${BOOK_1.id},"title": "${BOOK_1.title}","description": "${BOOK_1.description}","pageCount": ${BOOK_1.pageCount},"excerpt": "${BOOK_1.excerpt}","publishDate": "${BOOK_1.publishDate}"}
    ...                           headers=${HEADERS}
    Log                           ${RESPOSTA.text}
    Set Test Variable             ${RESPOSTA}

Conferir se retorna todos os dados alterados do livro "${ID_LIVRO}"
    Conferir livro    ${ID_LIVRO}

Conferir livro
    [Arguments]     ${ID_LIVRO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              ${BOOK_${ID_LIVRO}.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           ${BOOK_${ID_LIVRO}.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description     ${BOOK_${ID_LIVRO}.description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       ${BOOK_${ID_LIVRO}.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt         ${BOOK_${ID_LIVRO}.excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate     ${BOOK_${ID_LIVRO}.publishDate}

Excluir o livro "${ID_LIVRO}"
    ${RESPOSTA}     Delete Request    fakeAPI    Books/${ID_LIVRO}
    Log                  ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Conferir se excluiu o livro "${ID_LIVRO}"
    Should Be Empty     ${RESPOSTA.content}
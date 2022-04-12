*** Settings ***
Documentation      Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource           ResourceAPI.robot
Suite Setup        Conectar minha API




*** Test Cases ***
Buscar listagem de todos os livros
    Requisitar todos os livros
    Conferir o status code    200
    Conferir o reason         OK
    Conferir se retorna "200" livros na lista

Buscar um livro especifico
    Requisitar o livro "14"
    Conferir o status code    200
    Conferir o reason         OK
    Conferir se retorna todos os dados corretos do livro 14

Cadastrar um novo livro - POST
    Cadastrar um novo livro

Alterar um livro - PUT 
    Alterar o livro "1"
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se retorna todos os dados alterados do livro "1"

Excluir um livro - DELETE 
    Excluir o livro "20"
    Conferir o status code    200
    Conferir o reason   OK
#   (o response body deve ser vazio)
    Conferir se excluiu o livro "200"